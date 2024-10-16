import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

// import '../../../../api/advantages.dart';
import '../../../../api/cities.dart';
import '../../../../constants/nums.dart';
import '../../../../core/widgets/alirt_class_widget.dart';
import '../../../../core/widgets/apartments/create_apartment/'
    'container_classes_widget/containers_choose_items_class_widget'
    '/container_choose_items_class_widget.dart';
import '../../../../core/widgets/apartments/create_apartment/'
    'container_classes_widget/input_text_class_widget/'
    'container_input_text_class_widget.dart';
import '../../../../data_containers/add_ad_data_container.dart';

TextEditingController addressController = TextEditingController();
TextEditingController countOfRoomsController = TextEditingController();
TextEditingController countOfBathRoomsController = TextEditingController();

// City? currentCity ;
// int? countOfRooms = AddAdDataContainer.rooms;
// int? countOfBathRooms = AddAdDataContainer.bathRooms;
// String? address = AddAdDataContainer.address;
// String getInputText(){
// return AddAdDataContainer.cityId;
// addressController.text;

// }/

class FirstStep extends StatefulWidget {
  const FirstStep({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
  // late DropDownCity city;

  @override
  void initState() {
    super.initState();
    wholeListApi = readyCityAndTypeOfApartmentApi.getDataCityApiToEdit(
        readyCityAndTypeOfApartmentApi.itemsCity, ServerWeenBalaqee.city);
    print("this in first step values,"
        "oneCityName --${oneCityName}"
        "cities name --${citiesName},"
        "index of city --${indexOfCity}");

    // setState(() {
    //   readyCityApi.dataStatus=true;
    // });
    //try this :
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await
    //   getDataCityApi(false);
    // });
  }

//is user want to continue to add apartment ?
//   bool isUserWantToAddApartment = false;
  List<City> citiesName = [];
  int indexOfCity = 1;
  String oneCityName = "";
  Future<List<dynamic>?>? wholeListApi;

//   double opacity = 1;
  //choose address box
  String chooseAddressTitle = "العنوان";
  String hintAddress = "مثال:الخليل-وادالهرية-بجانب مسجد ابوعيشة";
  TextInputType text = TextInputType.text;

//choose rooms box
  String chooseCountRoomText = "عدد الغرف ";
  String hintCountRooms = "0";
  TextInputType number = TextInputType.number;
  var addressFocusnose = FocusNode();
  var countRoomsfocusnode = FocusNode();
  var countBathroomsfocusnode = FocusNode();

//choose bathrooms box;
  int cityId = 0;
  String chooseCountBathroomsText = "عدد الحمامات";

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: GestureDetector(
          onTap: () {
            print("object");
            // setState(() {
            //   // dataStatus = true;
            // });

            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
              backgroundColor: themeMode.isLight
                  ? kBackgroundAppColorLightMode
                  : kBackgroundAppColorDarkMode,
              body: SingleChildScrollView(
                  child: Center(
                      child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: outlinedButton(themeMode:themeMode),
                        child: const Text("إلغاء"),
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            try {
                              AddAdDataContainer.address =
                                  addressController.text;
                              AddAdDataContainer.rooms =
                                  int.parse(countOfRoomsController.text);
                              AddAdDataContainer.bathRooms =
                                  int.parse(countOfBathRoomsController.text);
                              // AddAdDataContainer.city?.name =
                              //     oneCityName;
                              /*
                                be careful !!!
                          * don't delete those commands it's will active after
                                solve dropdown save data  problem
                                  --------------------------

                                                              setState(() {
                                  AddAdDataContainer.cityId?.id = city_id;
                                });

                                 --------------------------

                                * */

                              if (AddAdDataContainer.address != null &&
                                  AddAdDataContainer.bathRooms != null &&
                                  AddAdDataContainer.rooms != null) {
                                // debugPrint(
                                //     "type of apartment after add on class "
                                //     "--${AddAdDataContainer.city}");

                                myPushName(context, MyPagesRoutes.step2);
                              }
                            } catch (c) {
                              NormalAlert.show(
                                  context,
                                  "بيانات ناقصة",
                                  "يوجد "
                                      "بيانات"
                                      " ناقصة "
                                      "، تأكد "
                                      "من إدخال "
                                      "البيانات"
                                      " في جميع "
                                      "الحقول،"
                                      "ثم حاول"
                                      " مرة إخرى",
                                  "حسنًا");
                              return;
                            }
                            // AddAdDataContainer.bathRooms =
                            // AddAdDataContainer.currentCity?.
                            // name = currentCity;
                            // Testing.printValue();
                            //AddAdDataContainer.printValues();

                            // AddAdDataContainer.cityId ;
                            //   print("city_id
                            //   --${AddAdDataContainer.cityId}
                            //   -- in first_step page");
                            //   print(City);

                            // AddAdDataContainer.currentCityId?.id =
                            // currentCity?.id??0;
                            // currentCity?.id = 0;
                            // print(currentCity?.id);
                            debugPrint("${AddAdDataContainer.rooms}");
                          });
                        },
                        style: fullButton(themeMode: themeMode),
                        child: const Text("التالي"),
                      ),
                    ],
                  ),
                ),
                //text steps
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "الخطوة الاولى",
                    style: TextStyle(
                      color: themeMode.isLight
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
                    'step_one.png',
                    width: 65,
                    height: 65,
                    fit: BoxFit.fill,
                  ),
                ),
                //city box
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(children: [
                    ContainerChooseItemsClassWidget(
                      wholeListApi: wholeListApi,
                      title: "المدنية",
                      currentValue: oneCityName,
                      // dataStatus: true,
                      onSelected: (c) {
                        if (c is City) {
                          setState(() {
                            indexOfCity = c.id ?? -1;
                          });
                          // ... use other properties of c
                        } else {
                          debugPrint("Invalid object type");
                        }
                        readyCityAndTypeOfApartmentApi.saveData(indexOfCity);
                        debugPrint("the index of city is $indexOfCity");
                      },
                    ),

                    //location box
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: ContainerInputTextClassWidget(
                          title: chooseAddressTitle,
                          hintInput: hintAddress,
                          inputType: text,
                          controller: addressController,
                          focusNode: addressFocusnose,
                          onFieldSubmitted: (value) {}),
                    ),
                    //rooms box
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: ContainerInputTextClassWidget(
                          title: chooseCountRoomText,
                          hintInput: hintCountRooms,
                          inputType: number,
                          controller: countOfRoomsController,
                          focusNode: countRoomsfocusnode,
                          onFieldSubmitted: (value) {}),
                    ),
                    //bathrooms box
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ContainerInputTextClassWidget(
                          title: chooseCountBathroomsText,
                          hintInput: hintCountBathrooms,
                          inputType: number,
                          controller: countOfBathRoomsController,
                          focusNode: countBathroomsfocusnode,
                          onFieldSubmitted: (value) {
                            print("value is $value in bath room text field");
                          }),
                    ),
                  ]),
                ),
              ])))),
        ));
  }

  String hintCountBathrooms = "0";
}
