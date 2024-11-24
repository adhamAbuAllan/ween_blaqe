import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get_common/get_reset.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/api/type_of_apartment.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/pop_routes.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';

// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/core/widgets/alirt_class_widget.dart';
import '../../../api/advantages.dart';
import '../../../api/apartments_api/apartments.dart';
import '../../../api/cities.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/localization.dart';
import '../../../constants/strings.dart';
import '../../../controller/get_controllers.dart';
import '../../../controller/models_controller/advantages_model_controller.dart';

// import '../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../core/widgets/apartments/create_apartment/container_classes_widget/containers_choose_items_class_widget/container_choose_items_class_widget.dart';

// import '../../../core/widgets/apartments/create_apartment/container_classes_widget/image_picker/image_picker_apartment.dart';
import '../../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
import '../../../core/widgets/skeletons/student_widgets/show_more_skeleton_widget.dart';

// import 'apartment_of_owner.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../../core/widgets/apartments/update_apartment/update_image_apartment.dart';

class RefactorApartment extends StatefulWidget {
  const RefactorApartment({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  State<RefactorApartment> createState() => _RefactorApartmentState();
}

class _RefactorApartmentState extends State<RefactorApartment> {
  TextEditingController addressController = TextEditingController();
  TextEditingController countOfRoomsController = TextEditingController();
  TextEditingController countOfBathRoomsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController countOfStudentController = TextEditingController();
  TextEditingController squareMetersController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  //cities
  List<int> cityIds = []; // For storing the IDs
  List<City> cityNames = [];
  String selectedCityName = '';
  int selectedCityId = 0; // For storing the selected city's ID

  Future<List<dynamic>?>? wholeCityListApi;

  var addressFocusnose = FocusNode();
  var countRoomsfocusnode = FocusNode();
  var countBathroomsfocusnode = FocusNode();

  List<Advantages> advantages = [];
  late Future<List<Advantages>> allFeatures;
  late bool isDataLoading = false;
  List<int> featuresChosen = [];

  //price box
  var priceText = "السعر";
  var priceHint = "يرجى إدخال الإيجار بشكل شهري";
  var priceFocusNode = FocusNode();

  // var numberInputType

  //count of students box
  var countStudentText = "عدد الطلاب المسموح به";
  var countStudentHint = "0";
  var countStudentFocusNode = FocusNode();

  //square meters of apartment box
  var squareText = "حجم الشقة";
  var squareHint = "يرجى إدخال حجم الشقة بالمتر مربع";
  var squareFocusNode = FocusNode();

  //type of apartment box
  var typeApartmentText = "نوع السكن";
  Future<List<dynamic>?>? wholeTypeListApi;
  String typesName = '';
  int selectedTypeOfApartmentId = 0;
  List<int> typeOfApartmentIds = []; // For storing the IDs

  var typeOfApartmentFoucsNode = FocusNode();
  List<TypeOfApartment> typeApartmentItems = [];

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

  @override
  void initState() {
    super.initState();
    addressController.text = widget.oneApartment?.location ?? "";
    countOfRoomsController.text = widget.oneApartment?.rooms.toString() ?? "-1";
    countOfBathRoomsController.text =
        widget.oneApartment?.bathrooms.toString() ?? "-1";
    priceController.text = widget.oneApartment?.price.toString() ?? "-1";
    countOfStudentController.text =
        widget.oneApartment?.countOfStudnet.toString() ?? "-1";
    squareMetersController.text =
        widget.oneApartment?.squareMeters.toString() ?? "-1";
    titleController.text = widget.oneApartment?.title ?? "";
    descriptionController.text = widget.oneApartment?.description ?? "";
    allFeatures =
        getAdvantagesMethod(advantages, widget.oneApartment?.advantages ?? []);
    // allFeatures;

    wholeCityListApi = readyCityAndTypeOfApartmentApi.getDataCityApiToEdit(
      readyCityAndTypeOfApartmentApi.itemsCity,
      ServerWeenBalaqee.city,
    );
    cityIds = readyCityAndTypeOfApartmentApi.cityIds;
    wholeTypeListApi = readyCityAndTypeOfApartmentApi.getDataTypeApiToEdit(
      readyCityAndTypeOfApartmentApi.itemsTypeOfApartment,
      ServerWeenBalaqee.typeOfApartment,
    );

    // wholeTypeListApi = readyCityAndTypeOfApartmentApi.getDataCityApi(
    //   typeApartmentItems,
    //   "",
    //   ServerWeenBalaqee.typeOfApartment,
    // );

    typesName = widget.oneApartment?.type?.name ?? "";
    // indexOfTypeOfApartment =
    //     typeApartmentItems.indexOf(firstValueTypeApartment);
    // indexOfTypeOfApartment = widget.oneApartment?.type?.id;

    for (var index in widget.oneApartment?.advantages ?? []) {
      debugPrint("index of widget.oneApartment?.advantages is --$index");

      //check if a current [index] have true
      if (index.checked == true) {
        debugPrint("if Status");
        debugPrint("index.checked is ${index.checked}");
        // if that is true then add it in [featureChosen] list

        // featuresChosen.add(index.id!);
      } else {
        debugPrint("else Status");
        debugPrint("index.checked is ${index.checked}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: themeMode.isLight
                ? kBackgroundAppColorLightMode
                : kBackgroundAppColorDarkMode,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("edit_apartment_ad"),
                  style: TextStyle(
                    
                    fontWeight: FontWeight.w600,
                    fontSize: getIt<AppDimension>().isSmallScreen(context)
                        ? 16
                        : null,
                  )),
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: BackButton(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  style: const ButtonStyle(
                    // iconSize : WidgetStateProperty.all(34),
                    //    maximumSize: WidgetStateProperty.all(Size(32,
                    //        32)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () async {
                    if (apartmentModelController.isUpdating.value) {
                      NormalAlert.show(
                          context,
                          "يرجى الانتظار",
                          "الرجاء "
                              "الانتظار حتى يتم حفظ التغييرات",
                          "حسنًا");
                      return;
                    }

                    imagesModelController.images.clear();
                    imagesModelController.photoWillDeleteIds.clear();
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      apartmentModelController.fetchApartments(
                          isOwnerApartments: true);
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              actions: [
                // const Expanded(
                //     child: Padding(
                //       padding: EdgeInsets.all(8.0),
                //       child: Text(
                //                         "تعديل الشقة",
                //                         style: TextStyle(fontSize: 22),
                //                       ),
                //     )),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getIt<AppDimension>().isSmallScreen(context) ? 10: 8,
                      horizontal:
                       8),
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        if (apartmentModelController.isUpdating.value) {
                          debugPrint("uploading...");
                          // apiApartmentController.isEditMode.value = true;
                          // apiApartmentController.isDeleteMode.value = false;
                          return;
                        }
                        // });
                        updateApartment();
                      },
                      style: fullButton(),
                      child: apartmentModelController.isUpdating.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(SetLocalization.of(context)!
                              .getTranslateValue("save")),
                    );
                  }),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
              backgroundColor: themeMode.isLight
                  ? kContainerColorLightMode
                  : kContainerColorDarkMode,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getIt<AppDimension>().isSmallScreen(context)
                              ? 0
                              : 10),
                      child: ContainerChooseItemsClassWidget(
                          itemIdNotIndex: widget.oneApartment?.city?.id,
                          wholeListApi: wholeCityListApi,
                          title: "المدنية",
                          currentValue: selectedCityName,
                          onSelected: (c) {
                            if (c is City) {
                              setState(() {
                                selectedCityId = c.id ?? -1;
                              });
                              // ... use other properties of c
                            } else {
                              debugPrint("Invalid object type");
                            }
                            debugPrint("selectedCityId is $selectedCityId");
                          }),
                    ),

                    //location box
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getIt<AppDimension>().isSmallScreen(context)
                              ? 0
                              : 10),
                      child: ContainerInputTextClassWidget(
                          title: SetLocalization.of(context)!
                              .getTranslateValue("address"),
                          hintInput: SetLocalization.of(context)!
                              .getTranslateValue("example_apartment_address"),
                          inputType: TextInputType.text,
                          controller: addressController,
                          focusNode: addressFocusnose,
                          onFieldSubmitted: (value) {}),
                    ),
                    //rooms box
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getIt<AppDimension>().isSmallScreen(context)
                              ? 0
                              : 10),
                      child: ContainerInputTextClassWidget(
                          title: SetLocalization.of(context)!
                              .getTranslateValue("number_of_rooms"),
                          hintInput: "0",
                          inputType: TextInputType.number,
                          controller: countOfRoomsController,
                          focusNode: countRoomsfocusnode,
                          onFieldSubmitted: (value) {}),
                    ),
                    //bathrooms box
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getIt<AppDimension>().isSmallScreen(context)
                              ? 0
                              : 10),
                      child: ContainerInputTextClassWidget(
                          title: SetLocalization.of(context)!
                              .getTranslateValue("number_of_bathrooms"),
                          hintInput: "0",
                          inputType: TextInputType.number,
                          controller: countOfBathRoomsController,
                          focusNode: countBathroomsfocusnode,
                          onFieldSubmitted: (value) {
                            debugPrint(
                                "value is $value in bath room text field");
                          }),
                    ),
                  ]),
                  isDataLoading
                      ? const SkeletonAdvantages(isAddAdvantages: true)
                      : Container(
                          // height: 100,
                          margin: EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 10
                                  : 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: themeMode.isLight
                                ? kContainerColorLightMode
                                : kContainerColorDarkMode,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //this row for text
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  SetLocalization.of(context)!
                                      .getTranslateValue("select_advantages"),
                                  style: TextStyle(
                                      
                                      fontSize: getIt<AppDimension>()
                                              .isSmallScreen(context)
                                          ? 18
                                          : 20,
                                      fontWeight: FontWeight.w500,
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode),
                                ),
                              ),
                              //here could owner add advantages
                              // const AddAdvantages()
                              Column(
                                  children:
                                      // turnOnLocalFeatures == true ?
                                      advantages.map((feature) {
                                return ListTile(
                                    onTap: () {
                                      setState(() {
                                        feature.checked = !feature.checked!;
                                      });
                                    },
                                    horizontalTitleGap: 2.5,
                                    dense: false,
                                    leading: Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.6)),
                                        focusColor: themeMode.isLight
                                            ? kPrimaryColorLightMode
                                            : kPrimaryColorDarkMode,
                                        checkColor: Colors.white,
                                        hoverColor: themeMode.isLight
                                            ? kPrimaryColorLightMode
                                            : kPrimaryColorDarkMode,
                                        activeColor: themeMode.isLight
                                            ? kPrimaryColorLightMode
                                            : kPrimaryColorDarkMode,
                                        side: BorderSide(
                                            color: themeMode.isLight
                                                ? kPrimaryColor300LightMode
                                                : kPrimaryColor300DarkMode),
                                        splashRadius: 20,
                                        value: feature.checked,
                                        onChanged: (a) {
                                          if (a != null) {
                                            setState(() {
                                              feature.checked = a;
                                            });
                                          }
                                        }),
                                    title: Text(
                                      feature.advName ?? "",
                                      // feature.advName,
                                      style: TextStyle(
                                          
                                          fontSize: getIt<AppDimension>()
                                                  .isSmallScreen(context)
                                              ? 14
                                              : 16,
                                          color: themeMode.isLight
                                              ? kTextColorLightMode
                                              : kTextColorDarkMode),
                                    ),
                                    // const Expanded(child: Text("")),
                                    trailing: Image(
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode,
                                      image: NetworkImage(
                                        feature.icon ?? "",
                                      ),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        return child;
                                      },
                                      width: getIt<AppDimension>()
                                              .isSmallScreen(context)
                                          ? 24
                                          : 30,
                                      height: getIt<AppDimension>()
                                              .isSmallScreen(context)
                                          ? 24
                                          : 30,
                                    ));
                              }).toList())
                            ],
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getIt<AppDimension>().isSmallScreen(context)
                            ? 0
                            : 10),
                    child: ContainerInputTextClassWidget(
                      title: SetLocalization.of(context)!
                          .getTranslateValue("price"),
                      hintInput: SetLocalization.of(context)!
                          .getTranslateValue("enter_monthly_rent"),
                      controller: priceController,
                      inputType: TextInputType.number,
                      focusNode: priceFocusNode,
                    ),
                  ),
                  //countStudent padding

                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getIt<AppDimension>().isSmallScreen(context)
                            ? 0
                            : 10),
                    child: ContainerChooseItemsClassWidget(
                        itemIdNotIndex: widget.oneApartment?.type?.id,
                        wholeListApi: wholeTypeListApi,
                        title: SetLocalization.of(context)!
                            .getTranslateValue("housing_type_students"),
                        currentValue: typesName,
                        onSelected: (type) {
                          if (type is TypeOfApartment) {
                            setState(() {
                              selectedTypeOfApartmentId = type.id ?? -1;
                            });
                          }
                          debugPrint(
                              "selected type Id is $selectedTypeOfApartmentId");
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getIt<AppDimension>().isSmallScreen(context)
                            ? 0
                            : 10),
                    child: ContainerInputTextClassWidget(
                      title: SetLocalization.of(context)!
                          .getTranslateValue("allowed_students"),
                      hintInput: countStudentHint,
                      controller: countOfStudentController,
                      inputType: TextInputType.number,
                      focusNode: countStudentFocusNode,
                    ),
                  ),
                  //square padding
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0,
                        getIt<AppDimension>().isSmallScreen(context) ? 0 : 10),
                    child: ContainerInputTextClassWidget(
                      title: SetLocalization.of(context)!
                          .getTranslateValue("apartment_size"),
                      hintInput: squareHint,
                      controller: squareMetersController,
                      inputType: TextInputType.number,
                      focusNode: squareFocusNode,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0,
                        getIt<AppDimension>().isSmallScreen(context) ? 0 : 10),
                    child: ContainerInputTextClassWidget(
                        title: SetLocalization.of(context)!
                            .getTranslateValue("add_address"),
                        controller: titleController,
                        hintInput: SetLocalization.of(context)!
                            .getTranslateValue("furnished_student_housing"),
                        inputType: TextInputType.text,
                        focusNode: adFocusNode,
                        onFieldSubmitted: (value) {}),
                  ),
                  // discriptopin the apartment
                  ContainerInputTextClassWidget(
                      title: SetLocalization.of(context)!
                          .getTranslateValue("apartment_overview"),
                      controller: descriptionController,
                      hintInput: SetLocalization.of(context)!
                          .getTranslateValue("private_student_apartment"),
                      inputType: TextInputType.text,
                      // maxLines: 1,

                      maxLength: 255,
                      hintMaxLines: 7,
                      focusNode: discrptionFocusedNode),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                // Get.to(ImagePickerTesting);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UpdateImages(
                    oneApartmentId: widget.oneApartment?.id ?? 0,
                    oneApartment: widget.oneApartment,
                  ),
                ));
              },
              label: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("add_or_remove_images"),
                style: TextStyle(
                    fontSize:
                        getIt<AppDimension>().isSmallScreen(context) ? 13 :
                        null),
              ),
              icon: const Icon(Icons.photo),
              backgroundColor: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Advantages>> getAdvantagesMethod(
      List<Advantages> adv, List<Advantages> alreadyAdv) async {
    setState(() {
      adv.clear();
      isDataLoading = true;
    });
    var url = Uri.parse(ServerWeenBalaqee.advantagesAll);
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    var data = json["data"];
    adv.clear();
    for (var value in data) {
      bool isChecked = alreadyAdv.any((element) => element.id == value['id']);
      adv.add(Advantages(
        id: value['id'],
        advName: value['adv_name'],
        icon: value['icon'],
        checked: isChecked,
      ));
    }
    setState(() {
      isDataLoading = false;
    });

    debugPrint(
        "a advantages value is : --$advantages , after isDataLoading is : --$isDataLoading");
    return (adv);
  }

  updateAdvantages() async {
    // isUpdating = true;
    featuresChosen.clear();
    await apiApartmentController
        .deleteAdvInApartment(widget.oneApartment?.id.toString() ?? "-1");

    // in a list of [advantages]
    for (var index in advantages) {
      //check if a current [index] have true
      if (index.checked == true) {
        // if that is true then add it in [featureChosen] list

        featuresChosen.add(index.id ?? -1);
      }
    }
    await AdvantagesModelController().insertAdvInApartment3(
        widget.oneApartment?.id.toString() ?? "-1", featuresChosen);
    // isUpdating = false;
  }

  updateApartment() async {
    apartmentModelController.isUpdating.value = true;
    await apiApartmentController.updateApartment(
        widget.oneApartment?.id.toString() ?? "-1",
        countOfRoomsController.text,
        countOfBathRoomsController.text,
        squareMetersController.text,
        titleController.text,
        descriptionController.text,
        addressController.text,
        priceController.text,
        selectedCityId.toInt(),
        selectedTypeOfApartmentId.toInt());
    await updateAdvantages();
    await imagesModelController.deleteImages(widget.oneApartment?.id ?? -1,
        imagesModelController.photoWillDeleteIds);
    debugPrint(
        "a list of String in image controller is ${imagesModelController.images}");
    await imagesModelController.compressAndUploadUpdateImages(
      apartmentIdToUpdate: widget.oneApartment?.id ?? -1,
    );
    apartmentModelController.isUpdating.value = false;
    imagesModelController.imageFiles = null;
    // await apartmentModelController.fetchApartments(isOwnerApartments: true);
    // ignore: use_build_context_synchronously
    showSnakBar(context, "تم حفظ التغييرات بنجاح");
  }

  // Future<void> popAwaitMethod() async {
  //   await Navigator.pop(context);
  // }

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
    countOfStudentController.dispose();
    squareMetersController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    adFocusNode.dispose();
    discrptionFocusedNode.dispose();
    priceFocusNode.dispose();
    countStudentFocusNode.dispose();
    squareFocusNode.dispose();
  }

  Future<void> pushAndRemoveUntilToOwnerApartment() async {
    await mypopAndPushNamed(context, MyPagesRoutes.apartmentsOwner);
  }
}
