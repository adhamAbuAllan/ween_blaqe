// import 'dart:js';

import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/pop_routes.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/widgets/alirt_class_widget.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/main.dart';

import '../../../../api/users.dart';

import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/check_boxs/connection_check_box/add_a_contact_class_widget.dart';
import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/image_picker/image_picker_apartment.dart';
import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
import '../../../../constants/nums.dart';
// import 'fourth_step.dart';
// User ownerId;

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
var title = AddAdDataContainer.title;
var description = AddAdDataContainer.description;
// TextEditingController titleController = TextEditingController();
var address = AddAdDataContainer.address;
var countOfStudent = AddAdDataContainer.countOfStudent;
var bathRooms = AddAdDataContainer.bathRooms;
var rooms = AddAdDataContainer.rooms;
var price = AddAdDataContainer.price;
var type = AddAdDataContainer.type;
var city = AddAdDataContainer.city;
var email = AddAdDataContainer.email;

// var owner = AddAdDataContainer.ownerId?.id;

/*
* be careful don't delete those lines
* ---------------------------------
var typeOfApartment = AddAdDataContainer.typOfApartmentId;
var city = AddAdDataContainer.cityId ;
* -----------------------------------

*/

var squareMeters = AddAdDataContainer.squareMeters;

class FourthStep extends StatefulWidget {
  const FourthStep(
      {super.key,
      this.userInfo,
       this.oneApartmentId,
      });
  final User? userInfo;
  final DataOfOneApartment ? oneApartmentId;
  @override
  State<FourthStep> createState() => _FourthStepState();
}

class _FourthStepState extends State<FourthStep> {
  @override
  void initState() {
    super.initState();
    // getUserData(User);
  }

  @override
  Widget build(BuildContext context) {

    // Ad box
    var addSuitableTitleForAdText = "أضف عنوان";
    var addSuitableTitleForAdHnit = "سكن طلاب مفروش";
    var adFocusNode = FocusNode();
    var discrptionFocusedNode = FocusNode();
    //discription box
    var discrptionApartmentText = "صف الشقة";
    var discrptionApartmentHint = " شقة خاصة"
        " بالطلاب و في مكان هادئ و بعيد عن الضوضاء ،"
        " لدينا تسهيلات للطلاب و بسعر مناسب ، ويتوفر"
        " فيها العديد من الخدمات مثل السوبر ماركت "
        "و مطعم للوجبات السريعة كذلك يوجد العديد "
        "من المكتبات التي تخدم الطلاب بجميع التخصصات.";

    //images  box
    // var titleOfImageContainer = "أضف صور للشقة";
    // var images = [
    //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    // ];

    return ColorfulSafeArea(
        color: kPrimaryColor,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      mypopAndPushNamed(context, MyPagesRoutes.step3);
                    },
                    style: outlineButton,
                    child: const Text("رجوع"),
                  ),
                ),
                const Expanded(child: Text("")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      });
                      setState(() {
                        try {
                          AddAdDataContainer.title = titleController.text;
                          AddAdDataContainer.description =
                              descriptionController.text;
                          if (title != null && description != null) {
                            setState(() {
                              try {
                                createApartment(
                                    address!,
                                    bathRooms!,
                                    rooms!,
                                    price!,
                                    //be careful don't delete it!!!
                                    //-------------------
                                    //  typeOfApartment!,
                                    //-------------------
                                    city!,
                                    squareMeters!,
                                    type!,
                                    //be careful don't delete it!!!
                                    //-------------------
                                    //  city!,
                                    //-------------------
                                    title!,
                                    description!,
                                    countOfStudent!,
                                    email

                                    // NewSession.get("id", User),
                                    );
                                myPushName(context, MyPagesRoutes.main);
                              } catch (e) {
                                rethrow;
                              }
                            });
                          }
                        } catch (e) {
                          // print(AddAdDataContainer.city);
                          // print("owner id  --${NewSession.get("token", "")}");
                          // print(AddAdDataContainer.ownerId);

                          NormalAlert.show(
                              context,
                              "مشكلة فنية",
                              "يوجد "
                                  "مشكلة"
                                  " فنية "
                                  "، سيتم "
                                  "إصلاحها "
                                  " قريبًا،"
                                  "لا تقلق لقد تم حفظ بياناتك،،يمكنك "
                                  "الرجوع "
                                  "و المتابعة"
                                  " في وقتٍ لاحق",
                              "حسنًا");
                        }
                        // AddAdDataContainer.photos = AddImages;

                        // AddAdDataContainer.tesing();
                      });
                      // Get.to(ApartmentsOfOwnerAfterAdd());
                    },
                    style: fullButton,
                    child: const Text("حفظ"),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //text steps
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "الخطوة الأخيرة",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20,
                        fontFamily: 'IBM',
                      ),
                    ),
                  ),
                  //image steps
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 5, 25, 30),
                    child: Image.asset(
                      'assets/'
                      'images/'
                      'apartments_images/'
                      'images_to_create_apartment/'
                      'step_four.png',
                      width: 65,
                      height: 65,
                      fit: BoxFit.fill,
                    ),
                  ),

                  //add images
                  //   ContainerAddImagesClassWidget(title: titleOfImageContainer,
                  //     images: images,
                  //   ),

                  //add title to Ad
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextClassWidget(
                        title: addSuitableTitleForAdText,
                        controller: titleController,
                        hintInput: addSuitableTitleForAdHnit,
                        inputType: TextInputType.text,
                        focusNode: adFocusNode,
                        onFieldSubmitted: (value) {}),
                  ),
                  // discriptopin the apartment
                  ContainerInputTextClassWidget(
                      title: discrptionApartmentText,
                      controller: descriptionController,
                      hintInput: discrptionApartmentHint,
                      inputType: TextInputType.text,
                      // maxLines: 1,

                      maxLength: 255,
                      hintMaxLines: 7,
                      focusNode: discrptionFocusedNode),
                  AddAcontact(
                    userInfo: widget.userInfo,
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(

              onPressed: () {
                // Get.to(ImagePickerTesting);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AddImages(oneApartmentId: widget.oneApartmentId?.id?? 0),
                ));
              },
              label: const Text('أضف صور'),
              icon: const Icon(Icons.photo),
              backgroundColor: kPrimaryColor,
            ),
          ),
        ));
  }

  String msg = "";
  createApartment(
      String address,
      int bathRooms,
      int rooms,
      int price,
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
      String city,
      int squareMeters,
      String type,
      String title,
      String description,
      int countOfStudent,
      String? email,
      // User ? ownerId,
      // DropDownTypeOfUser typeId
      // String value
      ) async {
    // try{
    var url = Uri.parse(ServerLocalDiv.apartmentAdd);
    var token = (await sp).get("token");
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      "location": address,
      "bathrooms": bathRooms.toString(),
      "rooms": rooms.toString(),
      "price": price.toString(),
      //be careful don't delete it!!!
      //-------------------
      //   "type_id": typeOfApartment,
      //-------------------
      //be careful don't delete it!!!
      //-------------------
      //   "city_id": city,
      //-------------------
      "type": type,
      "city": city,
      "email": email,
      "square_meters": squareMeters.toString(),
      "title": title,
      "description": description.toString(),
      "count_of_student": countOfStudent.toString(),
      // "owner_id":ownerId
      // "type_id":typeId
    });
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      var res = DataOfOneApartment.fromJson(json);
      var resUser = User.fromJson(json);
      // res. = AddAdDataContainer.countOfStudent;
      res.type = AddAdDataContainer.type!;
      res.squareMeters = AddAdDataContainer.squareMeters!;
      res.bathrooms = AddAdDataContainer.bathRooms!;
      res.rooms = AddAdDataContainer.rooms!;
      res.description = AddAdDataContainer.description!;
      res.location = AddAdDataContainer.address!;
      res.city = AddAdDataContainer.city!;
      res.title = AddAdDataContainer.title!;
      res.price = AddAdDataContainer.price!;
      resUser.email = AddAdDataContainer.email;
      // res.owner?.phone = AddAdDataContainer.user!.phone;
      pushToApartmentOfOwnerAfterAdd();

      return res;
    }

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

  void pushToApartmentOfOwnerAfterAdd() {
    myPushReplacementNamed( MyPagesRoutes.apartmentOfOwnerAfterAdd,context: context);
  }
}

    // }catch(e){

    // }

  // }
// }

// getUserData(User){
//   // var userId = User.id;
//
// }