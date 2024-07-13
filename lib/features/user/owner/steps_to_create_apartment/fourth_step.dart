// import 'dart:js';

import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

// import 'package:ween_blaqe/api/type_of_apartment.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/widgets/alirt_class_widget.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/main.dart';

// import '../../../../api/cities.dart';
import '../../../../api/users.dart';

import '../../../../controller/models_controller/advantages_model_controller.dart';
import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/check_boxs/connection_check_box/add_a_contact_class_widget.dart';
import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/image_picker/image_picker_apartment.dart';
import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
import '../../../../constants/nums.dart';

// import 'fourth_step.dart';
// User ownerId;

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
// var title = AddAdDataContainer.title;
// var description = AddAdDataContainer.description;
// TextEditingController titleController = TextEditingController();
// var address = AddAdDataContainer.address;
// var countOfStudent = AddAdDataContainer.countOfStudent;
// var bathRooms = AddAdDataContainer.bathRooms;
// var rooms = AddAdDataContainer.rooms;
// var price = AddAdDataContainer.price;
// var type = AddAdDataContainer.type;
// var city = AddAdDataContainer.city;
// var email = AddAdDataContainer.email;

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
  const FourthStep({
    super.key,
    this.userInfo,
    this.oneApartmentId,
  });

  final User? userInfo;
  final DataOfOneApartment? oneApartmentId;

  @override
  State<FourthStep> createState() => _FourthStepState();
}

class _FourthStepState extends State<FourthStep> {
  @override
  void initState() {
    super.initState();
    // getUserData(User);
  }

  var apartmentId = '';
  bool isDataLoaded = false;

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
        bottomColor: Colors.transparent,
        color:
            themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: themeMode.isDark
                ? kBackgroundAppColorLightMode
                : kBackgroundAppColorDarkMode,
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            //   actions: ,
            // ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            // mypopAndPushNamed(context, MyPagesRoutes.step3);
                            Navigator.pop(context);
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
                            // setState(() {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            // });
                            // setState(() {
                            try {
                              AddAdDataContainer.title = titleController.text;
                              AddAdDataContainer.description =
                                  descriptionController.text;
                              // if (
                              // title != null && description != null
                              // apartmentModelController.ownerToken!=null
                              // ) {
                              // setState(() {
                              try {
                                setState(() {
                                  createApartment();
                                });

                                debugPrint("current value of local "
                                    "apartmantId is $apartmentId");
                                // apartmentModelController.apartmentId =
                                //     apartmentId;
                                // debugPrint("currently the apartment Id "
                                //     "from API is "
                                //     "${}");
                                //                                print("an apartment Id from SP :${NewSession
                                //                                    .get
                                //                                 ('apartmentId','-'
                                // '1')}");

                                //
                                // //    var token = (await sp).get("token");
                                //
                                // debugPrint("the apartment id now is : ${widget.oneApartmentId?.id}");
                                // advantagesModelController
                                //     .insertAdvInApartment3("${}",
                                //     ["${advantagesModelController
                                //         .chosen}"]);
                                // createApartment(
                                //   address ?? "",
                                //   bathRooms ?? -1,
                                //   rooms ?? -1,
                                //   price ?? -1,
                                //   //be careful don't delete it!!!
                                //   //-------------------
                                //   //  typeOfApartment!,
                                //   //-------------------
                                //   // city!,
                                //   squareMeters ?? -1,
                                //   // type!,
                                //   //be careful don't delete it!!!
                                //   //-------------------
                                //   //  city!,
                                //   //-------------------
                                //   title ?? "",
                                //   description ?? "",
                                //   countOfStudent ?? -1,
                                //   // email
                                //
                                //   // NewSession.get("id", User),
                                // );

                                debugPrint("successfuly created apartment "
                                    "ad !");
                              } catch (e) {
                                rethrow;
                              }
                              // });
                              // }
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
                            // });

                            // Get.to(ApartmentsOfOwnerAfterAdd());
                          },
                          style: fullButton,
                          child: isDataLoaded
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text("حفظ"),
                        ),
                      ),
                    ],
                  ),

                  //text steps
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "الخطوة الأخيرة",
                      style: TextStyle(
                        color: themeMode.isDark
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
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
                      AddImages(oneApartmentId: widget.oneApartmentId?.id ?? 0),
                ));
              },
              label: const Text('أضف صور'),
              icon: const Icon(Icons.photo),
              backgroundColor: themeMode.isDark
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
            ),
          ),
        ));
  }

  String msg = "";

  Future<DataOfOneApartment?> createApartment(// String address,
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
        "location": AddAdDataContainer.address ?? "",
        "bathrooms": "${AddAdDataContainer.bathRooms ?? -1}",
        // bathRooms.toString(),
        "rooms": "${AddAdDataContainer.rooms ?? -1}",
        // rooms.toString(),
        "price": "${AddAdDataContainer.price ?? -1}",
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
        "square_meters": "${AddAdDataContainer.squareMeters ?? -1}",
        // squareMeters.toString(),
        "title": AddAdDataContainer.title ?? "",
        "description": AddAdDataContainer.description ?? "",
        // description.toString(),
        "count_of_student": "${AddAdDataContainer.countOfStudent ?? -1}",
        "type_id": "${readyCityAndTypeOfApartmentApi.indexApartmentType}",
        "city_id": "${readyCityAndTypeOfApartmentApi.indexApartmentType}",
        // countOfStudent.toString(),
        // "owner_id":ownerId
        // "type_id":typeId
      });
        isDataLoaded = true;
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // debugPrint("apartment basic data creating...");

        var json = await jsonDecode(response.body);

        var apartmentId = json['data']['id'];
        // setState(() {
        //   apartmentIdPram = apartmentId;
        AddAdDataContainer.id = await apartmentId;
        // apartmentModelController.apartmentId = await apartmentId;

        debugPrint(
            "the apartment from AddAdDataContainer is : ${AddAdDataContainer.id}");
        // });
        debugPrint("the new apartment Id is : $apartmentId");

        // debugPrint("insert advantages is done!");

        await AdvantagesModelController().insertAdvInApartment3(
            "${await apartmentId}", advantagesModelController.chosen);
        // alert("تم اضافة أعلانك","تم إنشاء إعلان جديد ،ببيانات تم ادخالها "
        //     "يدويا بالإضافة إلى إدخال قائمة من المزايا بشكل يدوي","حسنًا");

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
        await imagesModelController.uploadImages();
        isDataLoaded = false;
        pushToMainPage();
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
        return res;
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

  Future<void> pushToMainPage() async {
    await myPushName(context, MyPagesRoutes.main);
    // await  Navigator.of(context).push(MaterialPageRoute(
    //       builder: (BuildContext context) => const HomeBeforeAddData())
    // );

    // studentController.index = 0;
  }

  void pushToApartmentOfOwnerAfterAdd() {
    myPushReplacementNamed(MyPagesRoutes.apartmentOfOwnerAfterAdd,
        context: context);
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
