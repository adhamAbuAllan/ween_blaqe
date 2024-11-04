import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    darkTheme: ThemeData(
      useMaterial3: false,

      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),

      // brightness: Brightness.darkf
    ),

    // themeMode: ThemeMode.system,

    theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'IBM',

        // brightness: Brightness.,

        // scaffoldBackgroundColor: Colors.grey.shade200,
        switchTheme: const SwitchThemeData(),
        colorSchemeSeed: const Color(0xffff9800),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(size: 26))),
    //make screen rtl
    localizationsDelegates: const [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale("en", "US"),
      Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    locale: const Locale("ar", "SA"),
    // locale: Locale("en", "US"),
    // localizationsDelegates: context.localizationDelegates,
    // supportedLocales: context.supportedLocales,
    // locale: context.locale,

// home: (),
    home: const WhatTheInfoReqToCreateAd(),
  ));
}

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
          backgroundColor:
              themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        ),
        body: !isDataLoaded
            ? const LongParagraphReadySkeleton()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //title
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 20, 20),
                          child: SizedBox(
                            height: 100,
                            width: 300,
                            child: Text(
                              SetLocalization.of(context)!.getTranslateValue("required_data_for_listing"),
                              style: TextStyle(
                                fontSize: 28.0,
                                fontFamily: 'IBM',
                                inherit: true,
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //for apartment
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
                      child: Text(
                        SetLocalization.of(context)!.getTranslateValue("apartment_data"),
                        style: TextStyle(
                          fontSize: 26.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    //info apartment
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
                          child: Text(
                            SetLocalization.of(context)!.getTranslateValue("general_info"),
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //paragraph of info and use that
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: Text(
                        "العلومات العامة هي العلومات التي تحتوي على عنوان الإعلان و مكان الشقة و عدد الافراد او الطلاب المسوح به و الصنف-طلاب ، طالبات ، عائلات...- و الإجرة الشهرية ",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 10.0
                                  : 25),
                      child: DataTable(
                        border: TableBorder(
                          horizontalInside: BorderSide(
                              width: .5,
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode
                              // Change this to your desired color
                              ),
                        ),
                        dataRowColor: WidgetStatePropertyAll(themeMode.isLight
                            ? kContainerColorLightMode
                            : kContainerColorDarkMode),
                        headingRowColor: WidgetStatePropertyAll(themeMode.isLight
                            ? kContainerColorLightMode
                            : kContainerColorDarkMode),
                        horizontalMargin: 35,
                        sortAscending: false,
                        sortColumnIndex: 0,
                        columns: [
                          DataColumn(
                            numeric: false,
                            label: Text(SetLocalization.of(context)!.getTranslateValue("name"),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode)),
                            tooltip: SetLocalization.of(context)!.getTranslateValue("required_info_name"),
                          ),
                          DataColumn(
                            label: Text(SetLocalization.of(context)!
                                .getTranslateValue("example"),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode)),
                            tooltip: "مثال على العلومة المطلوبة",
                          ),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(SetLocalization.of(context)!.getTranslateValue("listing_title"),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode))),
                            DataCell(Text(
                              SetLocalization.of(context)!.getTranslateValue(
                                  "furnished_apartment_example"),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode),
                            )),
                            // DataCell(Text("عنوان الإعلان الخاص بالشقة")),
                          ]),
                          DataRow(cells: [
                            DataCell(
                                showEditIcon: false,
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "IBM",
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode,
                                    ),
                                    SetLocalization.of(context)!
                                        .getTranslateValue("location")),
                                placeholder: false),
                            DataCell(Text(
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode),
                                "الخليل-واد الهرية-بالقرب من جامعة بولتكنك")),
                          ]),
                          DataRow(cells: [
                            DataCell(
                                showEditIcon: false,
                                Text(
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "IBM",
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode),
                                  SetLocalization.of(context)!.getTranslateValue("allowed_students"),
                                ),
                                placeholder: false),
                            DataCell(Text("3",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode))),
                          ]),
                          DataRow(cells: [
                            DataCell(
                                showEditIcon: false,
                                Text(SetLocalization.of(context)!.getTranslateValue("housing_type_students"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "IBM",
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode,
                                    )),
                                placeholder: false),
                            DataCell(Text(SetLocalization.of(context)!
                                .getTranslateValue("students"),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode))),
                          ]),
                          DataRow(cells: [
                            DataCell(
                                showEditIcon: false,
                                Text(SetLocalization.of(context)!.getTranslateValue("monthly_rent"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "IBM",
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode,
                                    )),
                                placeholder: false),
                            DataCell(Text("800",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode))),
                          ]),
                        ],
                      ),
                    ),
                    //about apartment info

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
                      child: Text(
                        "حول الشقة",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: Text(
                        "حول الشقة أي المعومات التي تحتوي على ارقام وهي كالاتي: المساحة بالمتر مربع ، عدد الغرف ، و عدد الحمامات",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    DataTable(
                      border: TableBorder(
                        horizontalInside: BorderSide(
                            width: .5,
                            color: themeMode.isLight
                                ? kTextColorLightMode
                                : kTextColorDarkMode
                            // Change this to your desired color
                            ),
                      ),
                      dataRowColor: WidgetStatePropertyAll(themeMode.isLight
                          ? kContainerColorLightMode
                          : kContainerColorDarkMode),
                      headingRowColor: WidgetStatePropertyAll(themeMode.isLight
                          ? kContainerColorLightMode
                          : kContainerColorDarkMode),
                      horizontalMargin: 35,
                      sortAscending: false,
                      sortColumnIndex: 0,
                      columns: [
                        DataColumn(
                            numeric: false,
                            label: Text(SetLocalization.of(context)!.getTranslateValue("name"),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode)),
                            tooltip: SetLocalization.of(context)!.getTranslateValue("required_info_name")),
                        DataColumn(
                            label: Text(SetLocalization.of(context)!
                                .getTranslateValue("example"),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode)),
                            tooltip: "مثال على العلومة المطلوبة")
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(SetLocalization
                              .of(context)!.getTranslateValue("apartment_area"),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode))),
                          DataCell(Text("70م",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode))),
                          // DataCell(Text("عنوان الإعلان الخاص بالشقة")),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text(                                SetLocalization
                                  .of(context)!.getTranslateValue("number_of_rooms"),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode,
                                  )),
                              placeholder: false),
                          DataCell(Text("3",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode))),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text(
                                SetLocalization
                                    .of(context)!.getTranslateValue("number_of_bathrooms") ,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode),
                              ),
                              placeholder: false),
                          DataCell(Text("1",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode))),
                        ]),
                      ],
                    ),
                    //advantages of apartment
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!.getTranslateValue("apartment_features"),
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: Text(
                        "وهي ما توفر الشقة من خدماء و سائل راحة و ادوات اخرى موجودة مسبقًا في الشقة،وهذه الميزات المتوفرة في التطبيق حتى الان، يمكنك إضافة الميزات التي تريدها",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    DataTable(
                      border: TableBorder(
                        horizontalInside: BorderSide(
                            width: .5,
                            color: themeMode.isLight
                                ? kTextColorLightMode
                                : kTextColorDarkMode
                            // Change this to your desired color
                            ),
                      ),
                      dataRowColor: WidgetStatePropertyAll(themeMode.isLight
                          ? kContainerColorLightMode
                          : kContainerColorDarkMode),
                      headingRowColor: WidgetStatePropertyAll(themeMode.isLight
                          ? kContainerColorLightMode
                          : kContainerColorDarkMode),
                      horizontalMargin: 35,
                      sortColumnIndex: 0,
                      columns: [
                        DataColumn(
                            numeric: false,
                            label: Text(
                              SetLocalization.of(context)!.getTranslateValue("name"),
                              style: TextStyle(
                                  fontFamily: "IBM",
                                  fontSize: 16,
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode),
                            ),
                            tooltip:                               SetLocalization
                                .of(context)!.getTranslateValue("feature_name")),
                        DataColumn(
                            label: Text(
                              SetLocalization
                                  .of(context)!.getTranslateValue("feature_icon"),
                              style: TextStyle(
                                  fontFamily: "IBM",
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode),
                            ),
                            tooltip: "الايقونة التي تظهر بجانب الميزة")
                      ],
                      rows: List<DataRow>.generate(
                          apartmentRes?.data!.last.advantages!.length ?? 1,
                          (index) => DataRow(cells: [
                                DataCell(Text(
                                    "${apartmentRes?.data?.last.advantages?[index].advName}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "IBM",
                                        color: themeMode.isLight
                                            ? kTextColorLightMode
                                            : kTextColorDarkMode))),
                                DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      "${apartmentRes?.data?.last.advantages![index].icon ?? 1}",
                                      width: 24,
                                      height: 24,
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode,
                                    )))
                              ])),
                    ),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
                      child: Text(
                        "وصف الشقة",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: Text(
                        "اي المزيد من التفاصيل ، مثل هل الشقة في مكان هادئ ام في مركز المدينة ، و في اي طابق ، هل يوجد بالقرب منها بقالة ، هل المواصلات إليها سهلة... .",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
                      child: Text(
                        SetLocalization
                            .of(context)!.getTranslateValue("owner_data"),
                        style: TextStyle(
                          fontSize: 26.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: Text(
                        " بيانات المالك هي تلك البيانات التي تخص مالك الشقة مثل اسمه و رقم الهاتف الخاص به.",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        ),
                      ),
                    ),

                    DataTable(
                      border: TableBorder(
                        horizontalInside: BorderSide(
                            width: .5,
                            color: themeMode.isLight
                                ? kTextColorLightMode
                                : kTextColorDarkMode
                            // Change this to your desired color
                            ),
                      ),
                      dataRowColor: WidgetStatePropertyAll(themeMode.isLight
                          ? kContainerColorLightMode
                          : kContainerColorDarkMode),
                      headingRowColor: WidgetStatePropertyAll(themeMode.isLight
                          ? kContainerColorLightMode
                          : kContainerColorDarkMode),
                      horizontalMargin: 35,
                      sortAscending: false,
                      sortColumnIndex: 0,
                      columns: [
                        DataColumn(
                            numeric: false,
                            label: Text(SetLocalization.of(context)!.getTranslateValue("name"),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode)),
                            tooltip: SetLocalization.of(context)!.getTranslateValue("required_info_name")),
                        DataColumn(
                            label: Text(SetLocalization.of(context)!
                                .getTranslateValue("example"),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode)),
                            tooltip: "مثال على العلومة المطلوبة")
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("اسم المالك",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode))),
                          DataCell(Text("أدهم أنور أبوعلان",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode))),
                          // DataCell(Text("عنوان الإعلان الخاص بالشقة")),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text("رقم الهاتف",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode,
                                  )),
                              placeholder: false),
                          DataCell(Text(
                            "+97256*****3",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "IBM",
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode),
                            textDirection: TextDirection.ltr,
                          )),
                        ]),
                      ],
                    ),
                    //   const SizedBox(
                    //   height: 30,
                    // ),
                    // aline,
                    const SizedBox(
                      height: 30,
                    ),
                    //   Text("إقرأ ايضًا",
                    //     style: TextStyle(fontSize: 18, fontFamily: "IBM",color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode)),
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
                    //             fontFamily: "IBM",
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
                    //             fontFamily: "IBM",
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
