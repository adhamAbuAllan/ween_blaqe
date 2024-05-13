import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/models_controller/apartment_model_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/list_of_apartments.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/container_types.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/pointer_of_type.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/show_list_button.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/type_item_button.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/features/error_widgets/no_internet.dart';
import 'package:ween_blaqe/features/error_widgets/search_not_found.dart';
import '../../../../api/apartments_api/one_apartment.dart';
import '../../../../api/photos.dart';
import '../../../../core/utils/funcations/snakbar_for_stream_builder.dart';

// main(){
//   runApp( MaterialApp(
//       theme: ThemeData(useMaterial3: false,),
//       home:const Scaffold(body: NewMasterHome())));
// }

class NewMasterHome extends StatefulWidget {
  const NewMasterHome({Key? key}) : super(key: key);
  // Future<OneApartment> getDataFromAPI();
  //  MainController mainController = Get.find();

  @override
  State<NewMasterHome> createState() => _NewMasterHomeState();
}

class _NewMasterHomeState extends State<NewMasterHome> {
  ApartmentModelController apartmentModelController = Get.find();
  // late OneApartment apartmentsRes;
  late String name;

  // for data is loaded flag
  bool isDataLoaded = false; //data load from server
  // bool isCodeActive = false;//chick if code is action

  // error holding
  String errorMessage = ''; // message of error server

  bool isStart = false;
bool isHaveInternet = false;
  // bool clicked = false;//to chnage bookmark icon
  late ScrollController
      _scrollController; //[_scroolController] usgae to show or hide a types button when user scroll.

  bool _isVisible =
      false; //[_isVisable] usage to hide or show button and a list of types when user scroll or tab on screen.

  bool _isSebhaVisible =
  false; //[_isSebhaVisible] usage to hide or show button of Sebha.
  //those values : [_isBoyStudent] , [_isGirlStudent] , [_isFamilies] , [_isAll] usege to make point on the type of apartment when user chose one of them .
  bool _isGirlStudent = false; //for boy students
  bool _isBoyStudent = false; //for gril studnts
  bool _isFamilies = false; //for families
  bool _isAll = false; // for all types
  // [_isListOfTypes] values usages to show all types of apartments
  bool _isListOfTypes = false; //the types on the list

  //[_type] value that mean the type of apartment
  String _type = 'طلاب'; //first type

  @override
  void initState() {
    super.initState();
    isStart = true;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //[_scrollController.addListener] this attribute usages to hide or show the button
      debugPrint("min scroll extent${_scrollController.position.minScrollExtent}");
      debugPrint(" scroll div PR${_scrollController.position.devicePixelRatio}");
      debugPrint(" isScrollingNotifier${_scrollController.position.isScrollingNotifier}");
      debugPrint("axis${_scrollController.position.axis}");
      // debugPrint("axis${_scrollController.position.}");
      Future.delayed(const Duration(milliseconds: 350), () {
        //when user make scrolling , the udenr code execute after 350 milisec. ///don't remove it///
        if (_scrollController.position.userScrollDirection.name == "forward") {
          //if user scroll to up , the button will visible after 350 milisec
          setState(() {
            _isVisible = true;
          });
        } else if (_scrollController.position.userScrollDirection.name ==
            "reverse") {
          //when user scroll to down , the button will invisible after 350 milisec
          setState(() {
            _isVisible = false;
          });
        }
      });
    });
    debugPrint("the initState is work now ");
    // myPushName(context, MyPagesRoutes.skeletonShowMoreWidget);
    // SkeletonShowMoreWidget;
    _isAll = true;
    callAPIandAssignData(type: _type, isAll: true);
    debugPrint("type in initState is :$_type ");
  }

  @override
  Widget build(BuildContext context) {
    return
      isDataLoaded //if data is loading
          ? errorMessage.isNotEmpty // if have error from server
          ? Text(errorMessage) // then error will show
          : (apartmentModelController.apartment.data?.isEmpty ??
          false) // else if json of apartment - specific type of apartment -
          ? TypeNotFound(type: _type,) // then go to TypeNotFound screen
          : StreamBuilder<ConnectivityResult>(

          stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) { //check wifi
          if (snapshot.data == ConnectivityResult
              .wifi) { // show snackbar connection if have connection with wifi
            isStart
                ?
          const Text("")
                :
          showSnakBarInStreamBuilder(
                context, "تمت إعادة الاتصال",
                isIcon: true,
                icon: Icons.wifi,
                isConnect: true,
                isStart: isStart);

              // Navigator.pop(context);

          } else if (snapshot.data == ConnectivityResult
              .none) { // show sanckbar no connectoin if no have connection with wifi and go to no Internet screen
            showSnakBarInStreamBuilder(
                context, "انقطع الانترنت",
                isIcon: true,
                icon: Icons.wifi_off,
                isConnect: false,
                isStart: isStart);
            isStart = false;
            return const NoInternet();
          }

          return GestureDetector(
            onTap: () { //make list of types of apartment type and button that show a list is inviable when click on screen
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            child: Stack(
                alignment: Alignment.topRight,

                children: [

                  ApartmentList(apartmentsRes: apartmentModelController.apartment,
                      scrollController: _scrollController), //aprtments list

                  Padding(
                    padding: const EdgeInsets.only(top: 10 * 7, right: 8.0),
                    child: AnimatedOpacity(
                      opacity: (
                          apartmentModelController.apartment.data?.isNotEmpty

                              ?? true
                          ? (_isVisible ? 1 : 0)
                          : 1),
                      duration: const Duration(milliseconds: 300),
                      child: true //the v for apartments sale , after make it for rent you can active this :
                      // !_isVisible
                          ? const SizedBox()
                          : ApartmentShowTypesButton(onPressed: () {
                        setState(() {
                          _isListOfTypes = !_isListOfTypes;
                        });
                      }),
                    ),
                  ), //btn show types of apartments
                  Padding(
                    padding: const EdgeInsets.only(top: 10 * 7, left: 8.0),
                    child: !_isListOfTypes ? const SizedBox(): AnimatedOpacity(
                        opacity: (_isListOfTypes ? (_isVisible ? 1 : 0) : 0),
                        duration: const Duration(milliseconds: 350),

                        child: true //the v for apartments sale , after make it for rent you can active this :
                        // !_isVisible

                            ? const SizedBox() //you don't reomve under lines of code , keep them Or save a last v
                            : ApartmentShowTypesContainer(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  ApartmentShowTypesTextButton(
                                    textType: 'طلاب',
                                    onPressed: () {

                                      setState(() {
                                        isDataLoaded = false;
                                        _type = "طلاب";
                                        callAPIandAssignData(
                                            type: _type, isAll: false);
                                        _isBoyStudent = true;
                                        _isGirlStudent = false;
                                        _isFamilies = false;
                                        _isAll = false;
                                      });
                                    },
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: AnimatedOpacity(
                                        opacity: _isBoyStudent ? 1 : 0,
                                        duration: const Duration(
                                            milliseconds: 200),
                                        child: const ApartmentShowTypesPointer()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  ApartmentShowTypesTextButton(
                                    textType: 'طالبات',
                                    onPressed: () {
                                      setState(() {
                                        isDataLoaded = false;

                                        _type = "طالبات";
                                        callAPIandAssignData(
                                            type: _type, isAll: false);
                                        _isBoyStudent = false;
                                        _isGirlStudent = true;
                                        _isFamilies = false;
                                        _isAll = false;
                                      });
                                    },
                                  ),

                                  Padding(

                                    padding: const EdgeInsets.only(right: 5),
                                    child: AnimatedOpacity(
                                        opacity: _isGirlStudent ? 1 : 0,
                                        duration: const Duration(
                                            milliseconds: 200),
                                        child: const ApartmentShowTypesPointer()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  ApartmentShowTypesTextButton(
                                    textType: 'عائلات',
                                    onPressed: () {
                                      setState(() {
                                        isDataLoaded = false;

                                        _type = "عائلات";
                                        callAPIandAssignData(
                                            type: _type, isAll: false);
                                        _isBoyStudent = false;
                                        _isGirlStudent = false;
                                        _isFamilies = true;
                                        _isAll = false;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: AnimatedOpacity(
                                        opacity: _isFamilies ? 1 : 0,
                                        duration: const Duration(
                                            milliseconds: 200),
                                        child: const ApartmentShowTypesPointer()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(

                              child: Row(
                                children: [
                                  ApartmentShowTypesTextButton(
                                    textType: 'الكل',
                                    onPressed: () {
                                      setState(() {
                                        isDataLoaded = false;
                                        // _type = "عائلات";

                                        callAPIandAssignData(isAll: true);
                                        _isBoyStudent = false;
                                        _isGirlStudent = false;
                                        _isFamilies = false;
                                        _isAll = true;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: AnimatedOpacity(
                                        opacity: _isAll ? 1 : 0,
                                        duration: const Duration(
                                            milliseconds: 200),
                                        child: const ApartmentShowTypesPointer()),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),)
                    ),
                  ) //list of types of apartments
                ]),
          ); //this widget have a list of apartment and a button that show types list of types of apartments
        }
    ) // streamBuilder will show if json of apartment is not have a null value

        :   Stack(children:[

          GestureDetector(child: const HomeSkeletonWidget(),onDoubleTap: (){
              setState(() {
                _isSebhaVisible = !_isSebhaVisible;
              });

          },),
        Padding(
          padding:  const EdgeInsets.only(top: 10 * 7, right: 8.0),
          child: AnimatedOpacity(
            opacity: (
                _isSebhaVisible ? 1 : 0)
                ,
            duration: const Duration(milliseconds: 300),
            child: !_isSebhaVisible
                ? const SizedBox()
                : ApartmentShowTypesButton(onPressed: () {
              setState(() {
                myPushName(context, MyPagesRoutes.noInternet);
              });
            },text: "   سّبح   "),
          ),
        )

      ]); // show HomeSkeletonWdiget if data is loading
  }

  // API Call
  Future<OneApartment> getDataFromAPI({String? type, bool? isAll}) async {
    Uri uri = Uri.parse("${ServerWeenBalaqee.apartmentAll}?type=$type");
    if (isAll == true) {
      uri = Uri.parse(ServerWeenBalaqee.apartmentAll);
    }
    debugPrint("uri --$uri");
    var response = await http.get(uri);
    debugPrint("response --$response");
    if (response.statusCode == 200) {
      // All ok
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      OneApartment apartmentsRes = OneApartment.fromJson(json);
      setState(() {
        isDataLoaded = true;
      });
      // debugPrint("the id is : ${apartmentsRes.data?.first.ownerId}");
      debugPrint("data : ${apartmentsRes.data}");
      debugPrint("msg : ${apartmentsRes.msg}");
      debugPrint("the status is ${apartmentsRes.status}");
      return apartmentsRes;
    } else if (apartmentModelController.apartment.msg?.isNotEmpty ?? false) {
      errorMessage = '${response.statusCode}: ${response.body} ';
      debugPrint(errorMessage);
      return OneApartment(data: []);
    }
    return apartmentModelController.apartment;
  }

  Future<List<Photos>> fetchPhotos() async {
    setState(() {
      isDataLoaded = true;

    });
    Uri uri = Uri.parse(ServerWeenBalaqee.apartmentAll);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((item) => Photos.fromJson(item)).toList();
    } else {
      setState(() {
        isDataLoaded = false;
      });
      throw Exception('Failed to load photos from API');
    }
  }

  callAPIandAssignData({String? type, required bool isAll}) async {
    apartmentModelController.apartment = (await getDataFromAPI(type: type, isAll: isAll));
  }

  Future<void> showSnackBarAfter3Second() async {
    Future.delayed(const Duration(milliseconds: 3000), () {

      // Navigator.pushReplacementNamed(context, MyPagesRoutes.noInternet);

return showSnakBarInStreamBuilder(context,withButton: true,textOfButton: "سّبح",onPressed: (){const NoInternet();}, "انقطع الانترنت",
    isIcon: true,
    icon: Icons.wifi_off,
    isConnect: false,
    isStart: false);

      // checkWifiStatus();
    });


    // Navigator.pushReplacementNamed(context,MyPagesRoutes.noInternet);
  }

}
