import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/list_of_apartments.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/container_types.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/pointer_of_type.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/show_list_button.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/type_item_button.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/features/error_widgets/search_not_found.dart';

import '../../../../api/apartments_api/one_apartment.dart';
import '../../../../api/photos.dart';
import '../../../../core/utils/funcations/snakbar_for_stream_builder.dart';

void main() {
  runApp(const MaterialApp(
    home:
    NewMasterHome(),
  ));
}

class NewMasterHome extends StatefulWidget {
  const NewMasterHome({Key? key}) : super(key: key);

  @override
  State<NewMasterHome> createState() => _NewMasterHomeState();
}

class _NewMasterHomeState extends State<NewMasterHome> {
  // For holding response as UserPets
  late OneApartment apartmentsRes;

  // DataOfOneApartment oneApartment  ;

  late String name;

  // for data is loaded flag
  bool isDataLoaded = false;
  bool isCodeActive = false;

  // error holding
  String errorMessage = '';

  bool isStart = false;
  bool clicked = false;

  // }

  //
  // late final List<Photos>? photos;
  // Future<List<Photos>> fetchPhotos() async {
  //   Uri uri = Uri.parse(ServerLocalhostEm.apartmentAll);
  //
  //   final response = await http.get(uri);
  //
  //   if (response.statusCode == 200) {
  //     List jsonResponse = jsonDecode(response.body);
  //     return jsonResponse.map((item) => Photos.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to load photos from API');
  //   }
  //
  // Future<Photos> getDataImagesFromAPI() async {
  //   Uri uri = Uri.parse(ServerLocalhostEm.showImages);
  //
  //   debugPrint("uri --$uri");
  //   var response = await http.get(uri);
  //   debugPrint("response --$response");
  //   if (response.statusCode == 200) {
  //     var responseBody = response.body;
  //
  //     // All ok
  //     // ApartmentsRes usersPets = apartmentPetsFromJson(response.body);
  //     var json = jsonDecode(responseBody);
  //     Photos photos = Photos.fromJson(json);
  //
  //     // ApartmentsRes  usersPets = ApartmentsRes.fromJson(json);
  //
  //     // debugPrint("$usersPets");
  //     setState(() {
  //       // isDataLoaded = true;
  //     });
  //     // debugPrint("the id is : ${PlayerOneRes.data.first.ownerId}");
  //     // debugPrint("data : ${PlayerOneRes.data}");
  //     // debugPrint("msg : ${PlayerOneRes.msg}");
  //     // debugPrint("the status is ${PlayerOneRes.status}");
  //     return photos;
  //
  //     // } else {
  //     //   errorMessage = '${response.statusCode}: ${response.body} ';
  //     //   return ApartmentsRes(data: []);
  //   }
  //   return photos;
  // }

  late ScrollController
      _scrollController; //[_scroolController] usgae to show or hide a types button when user scroll.

  bool _isVisible = false; //[_isVisable] usage to hide or show button and a list of types when user scroll or tab on screen.
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

      Future.delayed(const Duration(milliseconds: 700), () {
        //when user make scrolling , the udenr code execute after 700 milisec. ///don't remove it///
        if (_scrollController.position.userScrollDirection.name == "forward") {
          //if user scroll to up , the button will visible after 700 milisec
          setState(() {
            _isVisible = true;
          });
        } else if (_scrollController.position.userScrollDirection.name ==
            "reverse") {
          //when user scroll to down , the button will invisible after 700 milisec
          setState(() {
            _isVisible = false;
          });
        }
      });
      // debugPrint("_scrollController.position.allowImplicitScrolling:${_scrollController.position.allowImplicitScrolling}");
      // debugPrint("_scrollController.position.userScrollDirection.name:${_scrollController.position.userScrollDirection.name}");
      // debugPrint("_scrollController.position.debugLabel:${_scrollController.position.debugLabel}");
      // debugPrint("_scrollController.position.devicePixelRatio:${_scrollController.position.devicePixelRatio}");
      // debugPrint("_scrollController.position.hasContentDimensions:${_scrollController.position.hasContentDimensions}");
      // debugPrint("_scrollController.position.isScrollingNotifier.value:${_scrollController.position.isScrollingNotifier.value}");
      // debugPrint("_scrollController.position.keepScrollOffset:${_scrollController.position.keepScrollOffset}");
      // debugPrint("_scrollController.position.context.axisDirection.name:${_scrollController.position.context.axisDirection.name}");
      // debugPrint("_scrollController.position.context.axisDirection.name:${_scrollController.position.physics.dragStartDistanceMotionThreshold}");
      // // debugPrint("_scrollController.position:${_scrollController.position.activity?.isScrolling}");
      // debugPrint("_scrollController.onAttach:${_scrollController.onAttach}");
      // debugPrint("_scrollController.onDetach:${_scrollController.onDetach}");
    });
    debugPrint("the initState is work now ");
    // myPushName(context, MyPagesRoutes.skeletonShowMoreWidget);
    // SkeletonShowMoreWidget;
    _isAll = true;
    callAPIandAssignData(type: _type, isAll: true);
    debugPrint("type in initState is :$_type ");

    // print(callAPIandAssignData());
    // print(apartmentsRes.data);
  }

  @override
  Widget build(BuildContext context) {
    return
      isDataLoaded//if data is loading
          ? errorMessage.isNotEmpty// if have error from server
          ? Text(errorMessage)// then error will show
          : (apartmentsRes.data?.isEmpty ?? false) // else if json of apartment - specific type of apartment -
          ? TypeNotFound(type: _type,) // then go to TypeNotFound screen
          : StreamBuilder<ConnectivityResult>(

          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {//check wifi
            if (snapshot.data == ConnectivityResult.wifi) {// show snackbar connection if have connection with wifi
              isStart
                  ? const Text("")
                  : showSnakBarInStreamBuilder(
                  context, "تمت إعادة الاتصال",
                  isIcon: true,
                  icon: Icons.wifi,
                  isConnect: true,
                  isStart: isStart);
            } else if (snapshot.data == ConnectivityResult.none) {// show sanckbar no connectoin if no have connection with wifi
              showSnakBarInStreamBuilder(
                  context, "انقطع الانترنت",
                  isIcon: true,
                  icon: Icons.wifi_off,
                  isConnect: false,
                  isStart: isStart);
            }

            return GestureDetector(
              onTap: (){//make list of types of apartment type and button that show a list is inviable when click on screen
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Stack(
                  alignment: Alignment.topRight,

                  children: [

                    ApartmentsList(apartmentsRes: apartmentsRes,scrollController: _scrollController),//aprtments list

                    Padding(
                      padding: const EdgeInsets.only(top:10*7,right: 8.0),
                      child: AnimatedOpacity(
                        opacity: (apartmentsRes.data?.isNotEmpty ?? true
                            ? (_isVisible ? 1 : 0)
                            : 1),
                        duration: const Duration(milliseconds: 300),
                        child: !_isVisible
                            ? const SizedBox()
                            : ApartmentShowTypesButton(onPressed: () {
                          setState(() {
                            _isListOfTypes = !_isListOfTypes;
                          });
                        }),
                      ),
                    ),//btn show types of apartments
                    Padding(
                      padding: const EdgeInsets.only(top:10*7,left: 8.0),
                      child: AnimatedOpacity(
                          opacity: (_isListOfTypes ? (_isVisible ? 1 : 0) : 0),
                          duration: const Duration(milliseconds: 700),

                          child:!_isVisible
                              ? const SizedBox()
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
                                          _type = "طلاب";
                                          callAPIandAssignData(type: _type, isAll: false);
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
                                          duration: const Duration(milliseconds: 200),
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
                                          _type = "طالبات";
                                          callAPIandAssignData(type: _type, isAll: false);
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
                                          duration: const Duration(milliseconds: 200),
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
                                          _type = "عائلات";
                                          callAPIandAssignData(type: _type, isAll: false);
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
                                          duration: const Duration(milliseconds: 200),
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
                                          duration: const Duration(milliseconds: 200),
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
                    )//list of types of apartments
                  ]),
            );//this widget have a list of apartment and a button that show types list of types of apartments
          }
      )// streamBuilder will show if json of apartment is not have a null value

          :const HomeSkeletonWidget();// show HomeSkeletonWdiget if data is loading
  }


//Scroll controller functions
//   _scrollController.onAttach = () {
//   // Callback when the controller is attached
//   print('Scroll controller attached');
// };
//
// _scrollController.onDetach = () {
// // Callback when the controller is detached
// print('Scroll controller detached');
// };
// }
//
// @override
// void dispose() {
// _scrollController.dispose();
// super.dispose();
// }
  // API Call


  Future<OneApartment> getDataFromAPI({String? type, bool? isAll}) async {
    Uri uri = Uri.parse("${ServerLocalDiv.apartmentAll}?type=$type");
    if (isAll == true) {
      uri = Uri.parse(ServerLocalDiv.apartmentAll);
    }


    debugPrint("uri --$uri");

    var response = await http.get(uri);
    debugPrint("response --$response");
    if (response.statusCode == 200) {
      var responseBody = response.body;


      // All oku=
      // ApartmentsRes usersPets = apartmentPetsFromJson(response.body);
      var json = jsonDecode(responseBody);


      OneApartment apartmentsRes = OneApartment.fromJson(json);
      // ApartmentsRes  usersPets = ApartmentsRes.fromJson(json);

      // debugPrint("$usersPets");
      setState(() {
        isDataLoaded = true;
      });
      // debugPrint("the id is : ${apartmentsRes.data?.first.ownerId}");
      debugPrint("data : ${apartmentsRes.data}");
      debugPrint("msg : ${apartmentsRes.msg}");
      debugPrint("the status is ${apartmentsRes.status}");
      return apartmentsRes;

      // } else {
      //   errorMessage = '${response.statusCode}: ${response.body} ';
      //   return ApartmentsRes(data: []);
    }
    // if(apartmentsRes.data?.first.type?.isNotEmpty??false){
    //   return apartmentsRes;
    // }else{
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => const TypeNotFound(),));
    // }

    return apartmentsRes;
  }

  Future<List<Photos>> fetchPhotos() async {
    setState(() {
      isDataLoaded = true;
    });
    Uri uri = Uri.parse(ServerLocalDiv.apartmentAll);
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
    apartmentsRes = (await getDataFromAPI(type: type, isAll: isAll));

    // photos =  (await NewShowMore().oneApartment?.photos);

    // oneApartment = (await apartmentsRes.data) as DataOfOneApartment;
    // photos = (await getDataImagesFromAPI()) as Photos;

    // debugPrint("$apartmentsRes");
  }

// testing
//   callAPIandAssignData(String type) async {
//     setState(() {
//       // Reset the data or show a loading state if needed
//       isDataLoaded = false;
//       // apartmentsRes.data = null;
//     });
//
//     apartmentsRes = await getDataFromAPI(_type) as OneApartment;
//
//     setState(() {
//       // Mark the data as loaded
//       isDataLoaded = true;
//     });
//   }
}