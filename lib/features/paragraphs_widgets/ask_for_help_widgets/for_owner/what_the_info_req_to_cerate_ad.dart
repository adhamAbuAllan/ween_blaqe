import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/localization.dart';

// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/core/widgets/skeletons/general_skeleton_ready_widgets/paragraph_ready_skeleton.dart';

import '../../../../api/apartments_api/one_apartment.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/nums.dart';
import '../../../../constants/strings.dart';
import '../../../../controller/function_controller/change_theme_mode.dart';
import '../../../../core/widgets/request_help_widgets/owner/what_data_is_required_to_post_an_ad_tables_widgets/about_apartment_data_required_table_widget.dart';
import '../../../../core/widgets/request_help_widgets/owner/what_data_is_required_to_post_an_ad_tables_widgets/apartment_features_available_table_widget.dart';
import '../../../../core/widgets/request_help_widgets/owner/what_data_is_required_to_post_an_ad_tables_widgets/general_apartment_info_data_required_table.dart';
import '../../../../core/widgets/request_help_widgets/owner/what_data_is_required_to_post_an_ad_tables_widgets/owner_data_required_table_widget.dart';


class WhatTheInfoReqToCreateAd extends StatefulWidget {
  const WhatTheInfoReqToCreateAd({super.key});

  @override
  State<WhatTheInfoReqToCreateAd> createState() =>
      _WhatTheInfoReqToCreateAdState();
}

class _WhatTheInfoReqToCreateAdState extends State<WhatTheInfoReqToCreateAd> {
  bool isDataLoaded = false; //data load from server
  String errorMessage = ''; // message of error server
  late OneApartment? apartmentRes;
  ChangeThemeMode themeMode = Get.find();

  @override
  void initState() {
    super.initState();
    callAPIandAssignData();
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        appBar: AppBar(
          backgroundColor: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode,
        ),
        body: !isDataLoaded
            ? const LongParagraphReadySkeleton()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                            child: SizedBox(
                              // height: 100,
                              // width: 300,
                              child: Text(
                                SetLocalization.of(context)!.getTranslateValue(
                                    "required_data_to_create_ad"),
                                style: TextStyle(
                                  fontSize: getIt<AppDimension>()
                                          .isSmallScreen(context)
                                      ? 22
                                      : 26,
                                  
                                  fontWeight: FontWeight.w800,
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //for apartment title
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_data"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 20
                              : 24,
                          
                          fontWeight: FontWeight.w700,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    //general info apartment data required title
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                          child: Text(
                            SetLocalization.of(context)!
                                .getTranslateValue("general_info"),
                            style: TextStyle(
                              fontSize:
                                  getIt<AppDimension>().isSmallScreen(context)
                                      ? 18
                                      : 20,
                              
                              fontWeight: FontWeight.w600,
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //general info apartment data required paragraph
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("info_of_general_info"),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          letterSpacing: .5,
                          height: 1.35,
                        ),
                      ),
                    ),

                    //general info apartment data required table
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 10.0
                                  : 25),
                      child: const GeneralApartmentInfoDataRequiredTable(),
                    ),

                    //about apartment title
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("about_apartment"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 18
                              : 20,
                          
                          fontWeight: FontWeight.w600,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    //about apartment data required paragraph
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_details"),
                        style: TextStyle(
                          fontSize: 16.0,
                          
                          fontWeight: FontWeight.w500,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          letterSpacing: .5,
                          height: 1.35,
                        ),
                      ),
                    ),

                    //about apartment data required table
                    const Center(
                      child: AboutApartmentDataRequiredTable(),
                    ),

                    //advantages of apartment section
                    //apartment advantages title
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_advantages"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 18
                              : 20,
                          
                          fontWeight: FontWeight.w600,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    //apartment advantages paragraph
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_advantages_details"),
                        style: TextStyle(
                          fontSize: 16.0,
                          
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          height: 1.35,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    //apartment advantages table
                    Center(
                      child: ApartmentFeaturesAvailableTable(
                          apartmentRes: apartmentRes),
                    ),

                    //apartment description title
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_description"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 18
                              : 20,
                          fontWeight: FontWeight.w600,
                          
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    //apartment description paragraph
                    Container(
                      //
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("example_apartment_description"),
                        style: TextStyle(
                          fontSize: 16.0,
                          
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          height: 1.35,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    //owner data title
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 30, 25, 20),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("owner_data"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 20
                              : 24,
                          
                          fontWeight: FontWeight.w700,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    //owner data required info
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("owner_data_info"),
                        style: TextStyle(
                          fontSize: 16.0,
                          
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          height: 1.35,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    //owner data table
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: OwnerDataRequiredTable(),
                      ),
                    ),
                    //   const SizedBox(
                    //   height: 30,
                    // ),
                    // aline,
                    const SizedBox(
                      height: 30,
                    ),
                    //   Text("إقرأ ايضًا",
                    //     style: TextStyle(fontSize: 18, color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode)),
                    //   const SizedBox(
                    //   height: 10,
                    // ),
                    // TextButton(
                    //     onPressed: () {
                    //       myPushName(context, MyPagesRoutes.theAdIsFreeOrNot);
                    //     },
                    //     child:   const Text(
                    //         " كم تكلفة نشر إعلان على تطبيق 'وين بلاقي'",
                    //         style: TextStyle(
                    //             fontSize: 14,
                    //             
                    //             color: Colors.orange))),
                    //   const SizedBox(
                    //   height: 10,
                    // ),
                    // TextButton(
                    //     onPressed: () {
                    //       myPushName(context, MyPagesRoutes.howCreateAd);
                    //     },
                    //     child:   const Text(
                    //         " كيف انشر إعلاني على تطبيق 'وين بلاقي'",
                    //         style: TextStyle(
                    //             fontSize: 14,
                    //             
                    //             color: Colors.orange)))
                  ],
                ),
              ),
      ),
    );
  }

  // API Call
  Future<OneApartment?> getDataFromAPI() async {
    Uri uri = Uri.parse(ServerWeenBalaqee.apartmentAll);
    uri = Uri.parse(ServerWeenBalaqee.apartmentAll);
    debugPrint("uri --$uri");
    var response = await http.get(uri);
    debugPrint("response --$response");
    if (response.statusCode == 200) {
      // All ok
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      OneApartment apartmentRes = OneApartment.fromJson(json);
      setState(() {
        isDataLoaded = true;
      });
      // debugPrint("the id is : ${apartmentsRes.data?.first.ownerId}");
      debugPrint("data : ${apartmentRes.data}");
      debugPrint("msg : ${apartmentRes.msg}");
      debugPrint("the status is ${apartmentRes.status}");
      return apartmentRes;
    } else if (apartmentRes?.msg?.isNotEmpty ?? false) {
      errorMessage = '${response.statusCode}: ${response.body} ';
      debugPrint(errorMessage);
      return OneApartment(data: null, status: false, msg: '');
    }
    return apartmentRes;
  }

  callAPIandAssignData() async {
    apartmentRes = (await getDataFromAPI());
    // debugPrint("ths is the type_id of owner ${apartmentRes?.data?.first.owner?.typeId} and the type of value is string");
    // debugPrint("ths is the country_phone_number_id of owner ${apartmentRes?.data?.first.owner?.countryPhoneNumberId} and the type of value is string");
  }
}

