import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/features/error_widgets/no_internet.dart';

import '../../../../api/apartments_api/one_apartment.dart';
import '../../../../api/photos.dart';
import '../../../../constants/nums.dart';
import '../../../../core/utils/funcations/snakbar.dart';
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

  // error holding
  String errorMessage = '';

  bool isStart = false;

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
  // }

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

  @override
  void initState() {
    super.initState();
    isStart = true;
    // myPushName(context, MyPagesRoutes.skeletonShowMoreWidget);
    // SkeletonShowMoreWidget;
    callAPIandAssignData();
    debugPrint("the initState is work now ");
    // print(callAPIandAssignData());
    // print(apartmentsRes.data);
  }

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(

        // backgroundColor: Colors.grey.shade200,
        isDataLoaded
            ? errorMessage.isNotEmpty
                ? Text(errorMessage)
                : (apartmentsRes.data?.isEmpty ?? false)
                    ? const Text(
                        "لا يوجد إعلانات في الوقت الحالي يرجى المحاولة لاحقًا.",
                      )
                    : StreamBuilder<ConnectivityResult>(
                        stream: Connectivity().onConnectivityChanged,
                        builder: (context, snapshot) {
                          if (snapshot.data == ConnectivityResult.wifi) {
                            isStart
                                ? const Text("")
                                : showSnakBarInStreamBuilder(
                                    context, "تمت إعادة الاتصال",
                                    isIcon: true, icon: Icons.wifi,isConnect: true);
                          } else if (snapshot.data == ConnectivityResult.none) {
                            showSnakBarInStreamBuilder(
                              context,
                              "انقطع الانترنت",
                              isIcon: true,
                              icon: Icons.wifi_off,isConnect: false
                            );
                          }

                          return ListView.builder(

                              // shrinkWrap: true,
                              // scrollDirection: Axis.vertical,
                              itemCount: apartmentsRes.data?.length,
                              itemBuilder: (ctx, index) =>
                                  apartments(index, true));

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

  void showSnakBarInStreamBuilder(BuildContext context, String text,
      {bool? isIcon, IconData? icon, bool? isConnect}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSnakBar(context, text,
          isIcon: isIcon, icon: icon, isConnect: isConnect);
      isStart = false;
    });
  }

  Widget apartments(
    int index,
    bool checked,
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
      height: 395,
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
                child: checked == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            clicked = false;
                          });
                        },
                        icon: const Icon(
                          Icons.bookmark_outline,
                          size: 28,
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            clicked = true;
                          });
                        },
                        icon: const Icon(
                          Icons.bookmark,
                          size: 28,
                        )),
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

  // API Call
  Future<OneApartment> getDataFromAPI() async {
    Uri uri = Uri.parse(ServerLocalDiv.apartmentAll);
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

  callAPIandAssignData() async {
    apartmentsRes = (await getDataFromAPI()) as OneApartment;
    // photos =  (await NewShowMore().oneApartment?.photos);

    // oneApartment = (await apartmentsRes.data) as DataOfOneApartment;
    // photos = (await getDataImagesFromAPI()) as Photos;

    // debugPrint("$apartmentsRes");
  }
}
