import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/features/error_widgets/search_not_found.dart';

import '../../../../api/apartments_api/one_apartment.dart';
import '../../../../api/photos.dart';
import '../../../../constants/nums.dart';
import '../../../../core/utils/funcations/snakbar_for_stream_builder.dart';
import 'new_show_more.dart';

void main() {
  runApp(const MaterialApp(
    home: NewMasterHome(),
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

  late ScrollController _scrollController;//[_scroolController] usgae to show or hide a types button when user scroll.

  bool _isVisable = false;//[_isVisable] usage to hide or show button and a list of types when user scroll.
  //those values : [_isBlue] , [_isPink] , [_isGreen] , [_isAll] usege to make point on the type of apartment when user chose one of them .
  bool _isBlue = false; //for boy students
  bool _isPink = false; //for gril studnts
  bool _isGreen = false; //for families
  bool _isAll = false;// for all types
  // [isListOfColors] values usages to show all types of apartments
  bool _isListOfColors = false; //the types on the list
  //[_type] value that mean the type of apartment
  String _type = "طلاب"; //first type

  @override
  void initState() {
    super.initState();
    isStart = true;
    _scrollController = ScrollController();

    _scrollController.addListener(() {//[_scrollController.addListener] this attribute usages to hide or show the button

      Future.delayed(const Duration(milliseconds: 700), () {//when user make scrolling , the udenr code execute after 700 milisec. ///don't remove it///
        if (_scrollController.position.userScrollDirection.name == "forward") {//if user scroll to up , the button will visible after 700 milisec
          setState(() {
            _isVisable = true;
          });
        } else if (_scrollController.position.userScrollDirection.name ==
            "reverse") {//when user scroll to down , the button will invisible after 700 milisec
          setState(() {
            _isVisable = false;
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
        // Scaffold(

        // backgroundColor: Colors.grey.shade200,
        isDataLoaded
            ? errorMessage.isNotEmpty
                ? Text(errorMessage)
                : (apartmentsRes.data?.isEmpty ?? false)
                    ? TypeNotFound(
                        type: _type,
                      )
                    : StreamBuilder<ConnectivityResult>(
                        stream: Connectivity().onConnectivityChanged,
                        builder: (context, snapshot) {
                          if (snapshot.data == ConnectivityResult.wifi) {
                            isStart
                                ? const Text("")
                                : showSnakBarInStreamBuilder(
                                    context, "تمت إعادة الاتصال",
                                    isIcon: true,
                                    icon: Icons.wifi,
                                    isConnect: true,
                                    isStart: isStart);
                          } else if (snapshot.data == ConnectivityResult.none) {
                            showSnakBarInStreamBuilder(
                                context, "انقطع الانترنت",
                                isIcon: true,
                                icon: Icons.wifi_off,
                                isConnect: false,
                                isStart: isStart);
                          }

                          return Stack(
                            children: [
                              ListView.builder(
                                  // controller:_scrollController.onAttach!(ScrollPosition scroll) ,
                                  controller: _scrollController,

                                  // shrinkWrap: true,
                                  // scrollDirection: Axis.vertical,
                                  itemCount: apartmentsRes.data?.length,
                                  itemBuilder: (ctx, index) => Column(
                                        children: [
                                          apartments(
                                            index,
                                          ),
                                          apartments(
                                            index,
                                          ),
                                          apartments(
                                            index,
                                          ),
                                        ],
                                      )),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 700),
                                opacity: (_isListOfColors
                                    ? (_isVisable ? 1 : 0)
                                    : 0),
                                curve: Curves.linear,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 50.0, horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 7,
                                            color: Colors.grey.shade200,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                7)),
                                    height: 200,
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 7,
                                                child: TextButton(
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.orange
                                                                    .shade200)),
                                                    onPressed: () {
                                                      setState(() {
                                                        _type = "طلاب";
                                                        callAPIandAssignData(
                                                            type: _type,
                                                            isAll: false);
                                                        _isBlue = true;
                                                        _isGreen = false;
                                                        _isPink = false;
                                                        _isAll = false;
                                                      });
                                                    },
                                                    child: Text(
                                                      "طلاب                    ",
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(.7),
                                                          fontFamily: 'IBM'),
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Expanded(
                                                  child: AnimatedOpacity(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      opacity: _isBlue ? 1 : 0,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                kPrimaryColor,
                                                            borderRadius:
                                                                BorderRadiusDirectional
                                                                    .circular(
                                                                        7 / 2),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .orange
                                                                    .shade200,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignOutside,
                                                                width: 7 / 2)),
                                                        width: 50 / 2.7,
                                                        height: 50 / 2.7,
                                                      )),
                                                ),
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
                                              Expanded(
                                                flex: 7,
                                                child: TextButton(
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.orange
                                                                    .shade200)),
                                                    child: Text(
                                                        "طالبات                 ",
                                                        style: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .7),
                                                            fontFamily: 'IBM')),
                                                    onPressed: () {
                                                      setState(() {
                                                        _type = "طالبات";
                                                        callAPIandAssignData(
                                                          type:   _type,
                                                            isAll: false);

                                                        _isBlue = false;
                                                        _isGreen = false;
                                                        _isPink = true;
                                                        _isAll = false;
                                                      });
                                                    }),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Expanded(
                                                  child: AnimatedOpacity(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      opacity: _isPink ? 1 : 0,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                kPrimaryColor,
                                                            borderRadius:
                                                                BorderRadiusDirectional
                                                                    .circular(
                                                                        7 / 2),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .orange
                                                                    .shade200,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignOutside,
                                                                width: 7 / 2)),
                                                        width: 50 / 2.7,
                                                        height: 50 / 2.7,
                                                      )),
                                                ),
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
                                              Expanded(
                                                flex: 7,
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                      overlayColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.orange
                                                                  .shade200)),
                                                  child: Text(
                                                      "عائلات                ",
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(.7),
                                                          fontFamily: 'IBM')),
                                                  onPressed: () {
                                                    // onTap: () {
                                                    setState(() {
                                                      _type = "عائلات";
                                                      callAPIandAssignData(
                                                       type:_type,
                                                          isAll: false);

                                                      _isBlue = false;
                                                      _isGreen = true;
                                                      _isPink = false;
                                                      _isAll = false;
                                                    });
                                                    // }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Expanded(
                                                  child: AnimatedOpacity(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      opacity: _isGreen ? 1 : 0,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                kPrimaryColor,
                                                            borderRadius:
                                                                BorderRadiusDirectional
                                                                    .circular(
                                                                        7 / 2),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .orange
                                                                    .shade200,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignOutside,
                                                                width: 7 / 2)),
                                                        width: 50 / 2.7,
                                                        height: 50 / 2.7,
                                                      )),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 7,
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                      overlayColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.orange
                                                                  .shade200)),
                                                  child: Text(
                                                      "الكل                ",
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(.7),
                                                          fontFamily: 'IBM')),
                                                  onPressed: () {
                                                    // onTap: () {
                                                    setState(() {
                                                      // _type = "عائلات";
                                                      callAPIandAssignData(isAll: true);
                                                      _isBlue = false;
                                                      _isGreen = false;
                                                      _isPink = false;
                                                      _isAll = true;

                                                    });
                                                    // }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Expanded(
                                                  child: AnimatedOpacity(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      opacity: _isAll ? 1 : 0,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                kPrimaryColor,
                                                            borderRadius:
                                                                BorderRadiusDirectional
                                                                    .circular(
                                                                        7 / 2),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .orange
                                                                    .shade200,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignOutside,
                                                                width: 7 / 2)),
                                                        width: 50 / 2.7,
                                                        height: 50 / 2.7,
                                                      )),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                                opacity: (apartmentsRes.data?.isNotEmpty ?? true
                                    ? (_isVisable ? 1 : 0)
                                    : 1),
                                child: !_isVisable
                                    ? const SizedBox()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Opacity(
                                          opacity: .95,
                                          child: OutlinedButton(
                                              style: outlineButton,
                                              onPressed: () {
                                                setState(() {
                                                  _isListOfColors =
                                                      !_isListOfColors;
                                                  print(
                                                      "$_isListOfColors : _isListOfColors");
                                                });

                                                debugPrint(
                                                    "you click on eleavatedButton now ");
                                              },
                                              //                              Container(height: 50,width: 100,color: Colors.white,),
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  height: 35,
                                                  color: Colors.white,
                                                  child: const Text(
                                                      " صنف السكن "))),
                                        ),
                                      ),
                              ),
                            ],
                          );

                          //  if(snapshot.data == ConnectivityResult.none ){
                          //
                          //    showSnakBarInStreamBuilder(context,"انقطع الانترنت",state: false);
                          //
                          //    return   const NoInternet();
                          // }else {
                          //      isStart ? const Text("") :   showSnakBarInStreamBuilder(context,"تمت إعادة الاتصال",state: true);
                          //
                          //
                          //
                          //    return ListView.builder(
                          //
                          //      // shrinkWrap: true,
                          //      // scrollDirection: Axis.vertical,
                          //        itemCount: apartmentsRes.data?.length,
                          //        itemBuilder: (ctx, index) => apartments(index, true));
                          //  }
                        })
            : const HomeSkeletonWidget();
  }

  Container apartments(
    int index,
    // bool clicked,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
      // width: 373,
      /*
      this is  wrong don't add height in the container
      that will do huge error when use another screens in future
      so delete the height attribute and add the padding  widget instead
       */
      //----------
      //you should delete the height attribute and add the padding widget instead
      height: 355,
      // <- delete height attribute
      //----------
      //decoration of show apartment style
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: kContainerColor,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
        children: [
          // bookmark iconImage
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " سكن :${apartmentsRes.data?[index].type ?? ""}",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'IBM',
                      color: Colors.black.withOpacity(.9)),
                ),
              ),
              const Expanded(child: Text("")),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child:
                      // clicked
                      //     ?
                      isCodeActive
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  clicked = !clicked;
                                });
                              },
                              icon: Icon(
                                clicked
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                size: 28,
                              ))
                          : const SizedBox()
                  // : IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         clicked = !clicked;
                  //       });
                  //     },
                  //     icon: const Icon(
                  //       Icons.bookmark,
                  //       size: 28,
                  //     )),
                  ),
            ],
          ),
          // image/s of apartment
          // isDataLoaded ?
          // SkeletonAvatar(
          //   style: SkeletonAvatarStyle(
          //       width: 368,
          //       height: 240,
          //       borderRadius: BorderRadius.circular(7)),
          // ) :
          ClipRRect(
              borderRadius: BorderRadius.circular(7 / 2),
              child: Image(
                image: CachedNetworkImageProvider(
                    apartmentsRes.data?[index].photos?[0].url ??
                        'https://via.placeholder.com/150'),
              )),

          //             image: NetworkImage(
          //             // json.decode(
          //               apartmentsRes.data?[index].photos?[0].url?? 'https://via.placeholder.com/150',
          //             //     photos?[0].url ?? "https://via.placeholder.com/150"
          //
          //               //   oneApartment.photos?[0].url??"https://via.placeholder.com/150"
          //
          //
          // // )
          //               ),height: 240,              ),) ,

          //  Image(
          //   // image: AssetImage("assets/images/apartments_images/image1.png")
          //   image: NetworkImage(apartmentsRes.data[index].photos?.isNotEmpty
          //   ? json.decode(apartmentsRes.data[index].photos?[0].url??"")[0]
          //   : 'https://via.placeholder.com/150')
          //   // child: Image(image: Image.network("src")),
          //   ,
          //   height: 240,
          //   // width:368,
          // )),
          // title and price
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text((apartmentsRes.data?[index].title ?? ""),
                    style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontFamily: 'IBM',
                      fontSize: 15,
                    )),
              ),
              const Expanded(child: Text("")),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                child:
                    Text((apartmentsRes.data?[index].price.toString()) ?? "0",
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontFamily: 'IBM',
                        )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
                child: Text("ش/ش",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 12,
                      fontFamily: 'IBM',
                    )),
              ),
            ],
          ),

          // see more and location
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => NewShowMore(
                              oneApartment: apartmentsRes.data?[index],
                            )));
                    // myPushName(context, MyPagesRoutes.showMore);
                  },
                  style: outlineButton,
                  child: const Text(
                    " عرض المزيد ",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'IBM',
                    ),
                  ),
                ),
              ),
              const Expanded(child: Text("")),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text("الموقع:",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.65),
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(apartmentsRes.data?[index].city ?? "",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
            ],
          )
        ],
      ),
    );
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
  Future<OneApartment> getDataFromAPI(String type, bool isAll) async {
    Uri uri = Uri.parse("${ServerLocalDiv.apartmentAll}?type=$type");
    if (isAll != true) {
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

  callAPIandAssignData({ String ?  type, required bool isAll}) async {
    apartmentsRes = (await getDataFromAPI(_type, isAll)) as OneApartment;

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
