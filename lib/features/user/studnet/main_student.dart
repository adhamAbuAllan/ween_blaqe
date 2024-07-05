import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/controller/models_controller/advantages_model_controller.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';

import '../../../api/apartments_api/one_apartment.dart';
import '../../../controller/student_controller/student_controller.dart';
import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../core/widgets/alirt_class_widget.dart';
import '../../../core/widgets/bottom_nav_bar/bottom_nav_of_student.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../../main.dart';
import '../../../sesstion/new_session.dart';
import '../../widgets_before_user_reg/account_before_login.dart';
import 'from_master_home_to_show_more/new_master_home.dart';
import 'orders_of_student.dart';

class MainStudent extends StatefulWidget {
  const MainStudent({
    Key? key,
  }) : super(key: key);

  @override
  State<MainStudent> createState() => _MainStudentState();
}

class _MainStudentState extends State<MainStudent> {
  bool isTest = true;

  @override
  void initState() {
    super.initState();
    // checkWifiStatus();
  }

  var studentController = StudentController();
  int index = 0;
  String apartmentIdLocal = "";

  StudentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var studentController = controller;

    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(

          // appBar: AppBar(bottomOpacity: 0,leadingWidth: 20,toolbarOpacity: 0,backgroundColor: Colors.transparent,elevation: 0,shadowColor: Colors.transparent,title: Text("Your wlecome "),),
          backgroundColor: themeMode.isDark
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          body: GetBuilder<StudentController>(
            builder: (context) {
              return ColorfulSafeArea(
                bottomColor: Colors.transparent,
                color: themeMode.isDark
                    ? kPrimaryColorLightMode
                    : kPrimaryColorDarkMode,
                child: IndexedStack(
                  index: studentController.index,
                  children: [
                    // MasterHome(),

                    const NewMasterHome(),
                    // const NewMasterHomeTest(),
                    // NotificationOfStudentWithNotifi(),
                    const OrdersOfStudent(),
                    // const Bookmark(),
                    // NewSession.get("logged", "") == ""
                    //     ?
                    AccountBeforeLoginInStudent()
                    // : AccountOfStudent(),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBarOfStudent(
            controller: studentController,
          ),
// floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton:
              // isTest
              //     ? FloatingActionButton(
              //         onPressed: () {
              //
              //           myPushName(context, MyPagesRoutes.step1 );
              //         },
              //   foregroundColor: kPrimaryColorLightMode,
              //         child: const Icon(
              //           Icons.add_home_outlined,
              //           color: kContainerColorLightMode,
              //         ),
              //       )
              //     : FloatingActionButton(
              //         // shape: ContinuousRectangleBorder(
              //         //
              //         //     borderRadius: BorderRadius.circular(16 / 2)),
              //         onPressed: () {
              //           showCupertinoModalPopup(
              //               context: context,
              //               builder: (
              //                 context,
              //               ) {
              //                 return CupertinoActionSheet(
              //                   /*
              //             RichText(
              //                             softWrap: true,
              //
              //                             // "إختر مدة إقامتك من خلال إضافة عدد الأشهر ",
              //                             text: TextSpan(
              //             children: <TextSpan>[
              //           const TextSpan(
              //               text: "نصيحة:",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //                 color: Colors.orange,
              //                 fontFamily: 'IBM',
              //                 inherit: true,
              //               )),
              //                             ]),
              //                           )
              //              */
              //                   title: Text(
              //                     "إنشاء إعلان",
              //                     style: TextStyle(
              //                       color: Colors.grey[600],
              //                       fontSize: 24,
              //                       fontFamily: "IBM",
              //                     ),
              //                   ),
              //
              //                   message: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       RichText(
              //                         textAlign: TextAlign.center,
              //                         softWrap: true,
              //                         text: TextSpan(
              //                           children: <TextSpan>[
              //                             TextSpan(
              //                                 text:
              //                                     "قم بإنشاء إعلانك الخاص على تطبيق 'وين بلاقي' واحصل على زبائن بشكل أسرع",
              //                                 style: TextStyle(
              //                                   color: Colors.grey[600],
              //                                   fontSize: 24,
              //                                   fontFamily: "IBM",
              //                                 )),
              //                           ],
              //                         ),
              //                       ),
              //                       Divider(color: Colors.black.withOpacity(.3)),
              //                       SizedBox(
              //                         child: Row(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.center,
              //                           mainAxisSize: MainAxisSize.min,
              //                           children: [
              //                             RichText(
              //                                 text: TextSpan(children: [
              //                               TextSpan(
              //                                   style: TextStyle(
              //                                     fontFamily: "IBM",
              //                                     fontSize: 18,
              //                                     color: Colors.grey[600],
              //                                   ),
              //                                   text: "التكلفة الشهرية: "),
              //                               TextSpan(
              //                                   style: TextStyle(
              //                                     fontFamily: "IBM",
              //                                     color: Colors.grey[600],
              //                                     fontSize: 18,
              //                                   ),
              //                                   text: "199"),
              //                             ])),
              //                             const SizedBox(
              //                               width: 3,
              //                             ),
              //                             FaIcon(FontAwesomeIcons.shekelSign,
              //                                 size: 14, color: Colors.grey[600]),
              //                           ],
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         child: Row(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.center,
              //                           mainAxisSize: MainAxisSize.min,
              //                           children: [
              //                             const SizedBox(
              //                               width: 20,
              //                             ),
              //                             SizedBox(
              //                               height: 50,
              //                               width: 120,
              //                               child: RichText(
              //                                   softWrap: true,
              //                                   text: TextSpan(
              //                                     children: [
              //                                       TextSpan(
              //                                           style: TextStyle(
              //                                             fontFamily: "IBM",
              //                                             fontSize: 18,
              //                                             color: Colors.grey[600],
              //                                           ),
              //                                           text: "التكلفة السنوية:"),
              //                                     ],
              //                                   )),
              //                             ),
              //                             SizedBox(
              //                               child: Column(
              //                                 children: [
              //                                   SizedBox(
              //                                     child: Row(
              //                                       children: [
              //                                         SizedBox(
              //                                           child: RichText(
              //                                               softWrap: true,
              //                                               text: const TextSpan(
              //                                                   children: [
              //                                                     TextSpan(
              //                                                       style:
              //                                                           TextStyle(
              //                                                         fontFamily:
              //                                                             "IBM",
              //                                                         color: Colors
              //                                                             .grey,
              //                                                         decoration:
              //                                                             TextDecoration
              //                                                                 .lineThrough,
              //                                                         decorationColor:
              //                                                             Colors
              //                                                                 .red,
              //                                                         fontSize: 20,
              //                                                       ),
              //                                                       text: "2388",
              //                                                     )
              //                                                   ])),
              //                                         ),
              //                                         const SizedBox(
              //                                           width: 3,
              //                                         ),
              //                                         FaIcon(
              //                                           size: 16,
              //                                           FontAwesomeIcons.shekelSign,
              //                                           color: Colors.grey[600],
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                   SizedBox(
              //                                     child: Row(
              //                                       children: [
              //                                         SizedBox(
              //                                           child: RichText(
              //                                               text:
              //                                                   TextSpan(children: [
              //                                             TextSpan(
              //                                                 style: TextStyle(
              //                                                   fontFamily: "IBM",
              //                                                   color: Colors
              //                                                       .grey[600],
              //                                                   fontSize: 14,
              //                                                 ),
              //                                                 text: "1999")
              //                                           ])),
              //                                         ),
              //                                         const SizedBox(
              //                                           width: 3,
              //                                         ),
              //                                         FaIcon(
              //                                             FontAwesomeIcons
              //                                                 .shekelSign,
              //                                             size: 12,
              //                                             color: Colors.grey[600]),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   // const Text(
              //                   //     "قم بإنشاء إعلانك الخاص على تطبيق 'وين بلاقي' واحصل على زبائن بشكل أسرع",
              //                   //     softWrap: true,
              //                   //
              //                   //     style: TextStyle(fontSize: 20, fontFamily: "IBM")),
              //
              //                   actions: [
              //                     CupertinoActionSheetAction(
              //                         onPressed: () {
              //                           sendMessageToWhatsApp(
              //                               '2569339613', "السلام عليكم،");
              //                         },
              //                         child: const Text(
              //                           "طلب الإشتراك عبر واتس أب",
              //                           style: TextStyle(
              //                             fontFamily: "IBM",
              //                           ),
              //                         )),
              //                     CupertinoActionSheetAction(
              //                         onPressed: () {
              //                           myPushName(context,
              //                               MyPagesRoutes.theAdIsFreeOrNot);
              //                         },
              //                         child: const Text(
              //                           "عرض تفاصيل الإشتراك",
              //                           style: TextStyle(
              //                             fontFamily: "IBM",
              //                           ),
              //                         )),
              //                   ],
              //                   cancelButton: CupertinoActionSheetAction(
              //                     child: const Text('إلغاء',
              //                         style: TextStyle(
              //                           fontFamily: "IBM",
              //                         )),
              //                     onPressed: () {
              //                       Navigator.pop(context);
              //                     },
              //                   ),
              //                 );
              //               });
              //         },
              //         backgroundColor: themeMode.isDark
              //             ? kPrimaryColorLightMode
              //             : kPrimaryColorDarkMode,
              //         child: const Icon(
              //           Icons.add_home_outlined,
              //           size: 30, // shadows: [
              //           //   BoxShadow(
              //           //       color: const Color(0xffD56300).withOpacity(.26),
              //           //       blurRadius: 5,
              //           //       offset: const Offset(3, 5),
              //           //       spreadRadius: 7)
              //           // ],
              //         ),
              //       )
              // buildSpeedDial()
              FloatingActionButton(
            backgroundColor: themeMode.isDark
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode,
            onPressed: () {
              NewSession.get("logged", "") == ""
                  ? alert("يرجى تسجيل الدخول لإنشاء إعلانك","قم بتسجيل الدخول أولا لتتمكن من إضافة الشقة الخاصة بك","حسنًا")

                  :createApartment();

              // createApartmentAndInsertAdvantages();
              // }
              if(apartmentIdLocal!=""){
                setState(() {
                  apartmentModelController.apartmentId = apartmentIdLocal;

                });
              }

              // myPushName(context, MyPagesRoutes.step1);
            },
            child: const Icon(
              Icons.add_home_outlined,
              color: Colors.white,
            ),
          )),
    );
  }
  void alert( String title, String message, String textOfButton) {
    NormalAlert.show(context, title,
        message, textOfButton);
  }


  Future<void> checkWifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      debugPrint('Wi-Fi is connected');
    } else {
      pushToNoInternetPage();
    }
  }
  Future<void>createApartmentAndInsertAdvantages()async{
    await createApartment();
    debugPrint("create apartment is done!");

    // if(AddAdDataContainer.id != null){

  }
  Future<DataOfOneApartment?>createApartment(
      // String address,
      // int bathRooms,
      // int rooms,
      // int price,
      //
      //   //be careful don't delete it!!!
      //   //-------------------
      //   // TypeOfApartment typeOfApartment,
      //   //-------------------
      //   //be careful don't delete it!!!
      //   //-------------------
      //   // City city,
      //   //-------------------
      //
      // City? city,
      // int squareMeters,
      // TypeOfApartment? type,
      // String title,
      // String description,
      // int countOfStudent,
      // String? email,
      // User ? ownerId,
      // DropDownTypeOfUser typeId
      // String value
      ) async {

    // try{
    var url = Uri.parse(ServerWeenBalaqee.apartmentAdd);
    var token = (await sp).get("token");

    if (token != null) {
      final headers = {
        'Authorization':
        // 'Bearer ${apartmentModelController.ownerToken}',
        // 'Bearer 59|kO3wxOnjan40Ps4OO7D14nC0tt4tUAhq5oABl7f23256a9b0',
        'Bearer $token',
        'Content-Type': 'application/json',
      };

      debugPrint("the token is : $token");

      var body = jsonEncode({
        "location":  "testing",
        "bathrooms": "09",
        // bathRooms.toString(),
        "rooms": "09",
        // rooms.toString(),
        "price": "09",
        // price.toString(),
        //be careful don't delete it!!!
        //-------------------
        //   "type_id": typeOfApartment,
        //-------------------
        //be careful don't delete it!!!
        //-------------------
        //   "city_id": city,
        //-------------------
        // "type": type,
        // "city": city,
        // "email": email,
        "square_meters": "09",
        // squareMeters.toString(),
        "title": "testing title",
        "description":  "testing description",
        // description.toString(),
        "count_of_student": "09",
        "type_id": "2",
        "city_id": "2",
        // countOfStudent.toString(),
        // "owner_id":ownerId
        // "type_id":typeId
      });

      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // debugPrint("apartment basic data creating...");

        var json = await jsonDecode(response.body);

        var apartmentId = json['data']['id'];
        // setState(() {
        //   apartmentIdPram = apartmentId;
          AddAdDataContainer.id = await apartmentId;
          debugPrint(
              "the apartment from AddAdDataContainer is : ${AddAdDataContainer
                  .id}");
        // });
        debugPrint("the new apartment Id is : $apartmentId");

        // debugPrint("insert advantages is done!");

        await AdvantagesModelController().insertAdvInApartment3
          ("${await apartmentId}",
            ['1','2','3']);
        alert("تم اضافة أعلانك","تم إنشاء إعلان جديد ،ببيانات تم ادخالها "
            "يدويا بالإضافة إلى إدخال قائمة من المزايا بشكل يدوي","حسنًا");


        // });
        // if(apartmentModelController.apartmentId != '-1'){
        //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        //   });
        // }else{
        //   debugPrint("apartment id is not found! ${apartmentModelController.apartmentId}");
        // }

        //
        // debugPrint(" the apartmentIdPram is : $apartmentIdPram");
        // debugPrint("the id of AddAdDataContainer is: ${AddAdDataContainer.id}");


        // setState(() {
        //   apartmentId = '-2';
        //
        // });


        var res = DataOfOneApartment.fromJson(json);
        // dataOfOneApartment = res;

        // if (res.id != null) {
        //   await advantagesModelController.insertAdvInApartment3(
        //       "${res.id}", ["${advantagesModelController.chosen}"]);q
        // } else {
        //
        //   debugPrint("your method is not working , that could not to get id "
        //       "without retrn the res first!");
        //
        // }
        // var resUser = User.fromJson(json);
        // res. = AddAdDataContainer.countOfStudent;
        // res.type = AddAdDataContainer.type!;
        // res.squareMeters = AddAdDataContainer.squareMeters ?? -1;
        // res.bathrooms = AddAdDataContainer.bathRooms ?? -1;
        // res.rooms = AddAdDataContainer.rooms ?? -1;
        // res.description = AddAdDataContainer.description ?? "";
        // res.type.id = AddAdDataContainer.
        // res.location = AddAdDataContainer.address ?? "";
        // res.city = AddAdDataContainer.city!;
        // res.title = AddAdDataContainer.title ?? "";
        // res.price = AddAdDataContainer.price ?? -1;
        // res.type?.id = readyCityAndTypeOfApartmentApi.indexApartmentType;
        // res.city?.id = readyCityAndTypeOfApartmentApi.indexApartmentType;
        // resUser.email = AddAdDataContainer.email;
        // res.owner?.phone = AddAdDataContainer.user!.phone;
        // pushToApartmentOfOwnerAfterAdd();//not nessarry
        // if(res.id!=null){
        //   debugPrint("the new id of aparmtant is ${res.id}");
        //
        // }else{
        //   debugPrint("the id is not ready that is ${res.id}");
        // }
        // var apartmentSpId = (await sp).save('apartmentId');

        return  res;

      } else {
        debugPrint("the statee of code is not true : ${response.statusCode}");
        debugPrint(
            "you have somehting null in this response :${response.body}");
      }
      debugPrint("the token is not null $token");
    } else {
      debugPrint("the token is null $token");
    }
    return null;

    // var user = User.fromJson(json);

    // ownerId = user.id as User;
    // AddAdDataContainer.ownerId = ownerId;
    // if (res.status == false) {
    //   setState(() {
    //     msg = res.msg;
    //   });
    //   print(json);
    // } else {
    //   if (res.data != null) {
    // var data = res.data;
  }
  void pushToNoInternetPage() {
    myPushName(context, MyPagesRoutes.noInternet);
  }
}

// SpeedDial buildSpeedDial() {
//   return SpeedDial(
//     curve: Curves.linear,
//
//     spacing: 25,
//     // activeBackgroundColor: Colors.orange[400],
//     overlayColor: Colors.grey,
//     // animatedIcon: AnimatedIcons.home_menu,
//     icon: Icons.add_home_outlined,
//     backgroundColor: kPrimaryColor,
//     renderOverlay: true,
//     closeManually: false,
//     switchLabelPosition: true,
//
//     children: [
//       SpeedDialChild(
//         child: const Icon(
//           FontAwesomeIcons.whatsapp,
//           color: Colors.white,
//         ),
//         //25D366
//         backgroundColor: const Color(0xff25D366),
//         // label: 'whatsApp',
//         onTap: () {
//           sendMessageToWhatsApp('2569339613', "هل يمكنني الاستفسار عن هذا؟");
//         },
//       ),
//       // SpeedDialChild(
//       //   child: Image.asset(m),
//       //   label: 'messenger',
//       //   onTap: () => print('Edit'),
//       // ),
//     ],
//   );
// }
