import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstStepCreateApartmentUi extends ConsumerStatefulWidget {
  const FirstStepCreateApartmentUi({super.key});

  @override
  ConsumerState createState() => _FirstStepCreateApartmentUiState();
}

class _FirstStepCreateApartmentUiState
    extends ConsumerState<FirstStepCreateApartmentUi> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        child: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //two buttons,
              //text,
              //circle steps,
              //city container,
              //location container,
              //count of rooms container,
              //count of bath rooms container,
            ],
          ),
        ),
      ),
    ));
  }
}
/*
ColorfulSafeArea(
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: GestureDetector(
          onTap: () {
            debugPrint("object");
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
                        style: outlinedButton(themeMode:themeMode,context: context),
                        child:  Text(SetLocalization.of(context)!
                            .getTranslateValue("cancel")),
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            try {
                              AddApartmentData.address =
                                  addressController.text;
                              AddApartmentData.rooms =
                                  int.parse(countOfRoomsController.text);
                              AddApartmentData.bathRooms =
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

                              if (AddApartmentData.address != null &&
                                  AddApartmentData.bathRooms != null &&
                                  AddApartmentData.rooms != null) {
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
                            debugPrint("${AddApartmentData.rooms}");
                          });
                        },
                        style: fullButton(),
                        child:  Text(SetLocalization.of(context)!
                            .getTranslateValue("next")),
                      ),
                    ],
                  ),
                ),
                //text steps
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    SetLocalization.of(context)!.getTranslateValue
                      ("first_step"),
                    style: TextStyle(
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                      fontSize: getIt<AppDimension>()
                          .isSmallScreen(context)
                          ? 18:20,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                //image steps
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
                  child:themeMode.isLight ?   Image.asset(
                    'assets/'
                    'images/'
                    'apartments_images/'
                    'images_to_create_apartment/'
                    'step_one.png',
                    width:getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                    height: getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                    fit: BoxFit.fill,

                  ):Image.asset(
                    'assets/'
                        'images/'
                        'apartments_images/'
                        'images_to_create_apartment/'
                        'first_setp_dark_mode.png',
                    width: getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                    height: getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                    fit: BoxFit.fill,

                  ),
                ),
                //city box
                Column(children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: getIt<AppDimension> ().isSmallScreen(context) ? 0:10),
                    child: ContainerChooseItemsClassWidget(
                      wholeListApi: wholeListApi,
                      title: SetLocalization.of(context)!.getTranslateValue("city"),
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
                  ),

                  //location box
                  Padding(
                    padding:  EdgeInsets.only(bottom: getIt<AppDimension> ().isSmallScreen(context) ? 0:10),
                    child: ContainerFieldWidget(
                        title: SetLocalization.of(context)!.getTranslateValue
                          ("address"),
                        hintInput: SetLocalization.of(context)!.getTranslateValue("example_apartment_address"),
                        inputType: text,
                        controller: addressController,
                        focusNode: addressFocusnose,
                        onFieldSubmitted: (value) {}),
                  ),
                  //rooms box
                  Padding(
                    padding:  EdgeInsets.only(bottom: getIt<AppDimension> ().isSmallScreen(context) ? 0:10),
                    child: ContainerFieldWidget(
                        title: SetLocalization.of(context)!.getTranslateValue("room_count"),
                        hintInput: hintCountRooms,
                        inputType: number,
                        controller: countOfRoomsController,
                        focusNode: countRoomsfocusnode,
                        onFieldSubmitted: (value) {}),
                  ),
                  //bathrooms box
                  Padding(
                    padding:  EdgeInsets.only(bottom:  getIt<AppDimension> ().isSmallScreen(context) ? 0:10),
                    child: ContainerFieldWidget(
                        title:                                 SetLocalization
                            .of(context)!.getTranslateValue("number_of_bathrooms"),
                        hintInput: hintCountBathrooms,
                        inputType: number,
                        controller: countOfBathRoomsController,
                        focusNode: countBathroomsfocusnode,
                        onFieldSubmitted: (value) {
                          debugPrint("value is $value in bath room text field");
                        }),
                  ),
                ]),
              ])))),
        ));
 */
