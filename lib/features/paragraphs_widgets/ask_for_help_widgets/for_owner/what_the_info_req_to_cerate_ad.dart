import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/core/widgets/skeletons/general_skeleton_ready_widgets/paragraph_ready_skeleton.dart';

import '../../../../api/apartments_api/one_apartment.dart';
import '../../../../constants/strings.dart';

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

  @override
  void initState() {
    super.initState();
    callAPIandAssignData();
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: kBackgroundAppColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: !isDataLoaded
            ? const LongParagraphReadySkeleton()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 20, 20),
                          child: SizedBox(
                            height: 100,
                            width: 300,
                            child: Text(
                              "ما هي البيانات المطلوبة لإنشاء إعلان؟",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontFamily: 'IBM',
                                inherit: true,
                                color: kTextColor,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //for apartment
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 10),
                      child: Text(
                        "بيانات الشقة",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    //info apartment
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 25, 10),
                          child: Text(
                            "معلومات عامة",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //paragraph of info and use that
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: const Text(
                        "العلومات العامة هي العلومات التي تحتوي على عنوان الإعلان و مكان الشقة و عدد الافراد او الطلاب المسوح به و الصنف-طلاب ، طالبات ، عائلات...- و الإجرة الشهرية ",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    DataTable(
                      border:  const TableBorder(
                        horizontalInside: BorderSide(
                          width: .5,
                          color: kTextColor
                          // Change this to your desired color
                        ),
                      ),

                      dataRowColor: const MaterialStatePropertyAll(kContainerColor),
                      headingRowColor: const MaterialStatePropertyAll(kContainerColor),
                      horizontalMargin: 35,
                      sortAscending: false,
                      sortColumnIndex: 0,
                      columns: const [
                        DataColumn(
                          numeric: false,
                          label: Text("الاسم",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "IBM",
                                  color: kTextColor)),
                          tooltip: "إسم المعلومة المطلوبة",
                        ),
                        DataColumn(
                          label: Text("مثال",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "IBM",
                                  color: kTextColor)),
                          tooltip: "مثال على العلومة المطلوبة",
                        ),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text("عنوان الإعلان",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                          DataCell(Text(
                            "شقة مفروشة بالقرب من جامعة بولتكنك",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "IBM",
                                color: kTextColor),
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
                                    color: kTextColor,
                                  ),
                                  "المكان"),
                              placeholder: false),
                          DataCell(Text(
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor),
                              "الخليل-واد الهرية-بالقرب من جامعة بولتكنك")),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text(
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "IBM",
                                    color: kTextColor),
                                "عدد الطلاب المسموح به",
                              ),
                              placeholder: false),
                          DataCell(Text("3",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text("نوع السكن",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: kTextColor,
                                  )),
                              placeholder: false),
                          DataCell(Text("طلاب",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text("الأجرة الشهرية",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: kTextColor,
                                  )),
                              placeholder: false),
                          DataCell(Text("800",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                        ]),
                      ],
                    ),
                    //about apartment info

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
                      child: const Text(
                        "حول الشقة",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: const Text(
                        "حول الشقة أي المعومات التي تحتوي على ارقام وهي كالاتي: المساحة بالمتر مربع ، عدد الغرف ، و عدد الحمامات",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    DataTable(
                      border:  const TableBorder(
                        horizontalInside: BorderSide(
                            width: .5,
                            color: kTextColor
                          // Change this to your desired color
                        ),
                      ),

                      dataRowColor: const MaterialStatePropertyAll(kContainerColor),
                      headingRowColor: const MaterialStatePropertyAll(kContainerColor),
                      horizontalMargin: 35,
                      sortAscending: false,
                      sortColumnIndex: 0,
                      columns: const [
                        DataColumn(
                            numeric: false,
                            label: Text("الاسم",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: kTextColor)),
                            tooltip: "إسم المعلومة المطلوبة"),
                        DataColumn(
                            label: Text("مثال",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: kTextColor)),
                            tooltip: "مثال على العلومة المطلوبة")
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text("مساحة الشقة",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                          DataCell(Text("70م",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                          // DataCell(Text("عنوان الإعلان الخاص بالشقة")),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text("عدد الغرف",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: kTextColor,
                                  )),
                              placeholder: false),
                          DataCell(Text("3",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text(
                                "عدد الحمامات",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: kTextColor),
                              ),
                              placeholder: false),
                          DataCell(Text("1",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                        ]),
                      ],
                    ),
                    //advantages of apartment
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
                      child: const Text(
                        "مزايا الشقة",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: const Text(
                        "وهي ما توفر الشقة من خدماء و سائل راحة و ادوات اخرى موجودة مسبقًا في الشقة،وهذه الميزات المتوفرة في التطبيق حتى الان، يمكنك إضافة الميزات التي تريدها",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    DataTable(
                      border:  const TableBorder(
                        horizontalInside: BorderSide(
                            width: .5,
                            color: kTextColor
                          // Change this to your desired color
                        ),
                      ),

                      dataRowColor: const MaterialStatePropertyAll(kContainerColor),
                      headingRowColor: const MaterialStatePropertyAll(kContainerColor),
                      horizontalMargin: 35,
                      sortColumnIndex: 0,
                      columns: const [
                        DataColumn(
                            numeric: false,
                            label: Text(
                              "الاسم",
                              style: TextStyle(
                                  fontFamily: "IBM",
                                  fontSize: 16,
                                  color: kTextColor),
                            ),
                            tooltip: "إسم الميزة"),
                        DataColumn(
                            label: Text(
                              "ايقونة الميزة",
                              style: TextStyle(
                                  fontFamily: "IBM", color: kTextColor),
                            ),
                            tooltip: "الايقونة التي تظهر بجانب الميزة")
                      ],
                      rows: List<DataRow>.generate(
                          apartmentRes?.data!.last.advantages!.length ?? 1,
                          (index) => DataRow(cells: [
                                DataCell(Text(
                                    "${apartmentRes?.data?.last.advantages?[index].advName}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: "IBM",
                                        color: kTextColor))),
                                DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      "${apartmentRes?.data?.last.advantages![index].icon ?? 1}",
                                      width: 24,
                                      height: 24,
                                      color: kTextColor,
                                    )))
                              ])),
                    ),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
                      child: const Text(
                        "وصف الشقة",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: const Text(
                        "اي المزيد من التفاصيل ، مثل هل الشقة في مكان هادئ ام في مركز المدينة ، و في اي طابق ، هل يوجد بالقرب منها بقالة ، هل المواصلات إليها سهلة... .",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 10),
                      child: Text(
                        "بيانات المالك",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                      child: const Text(
                        " بيانات المالك هي تلك البيانات التي تخص مالك الشقة مثل اسمه و رقم الهاتف الخاص به.",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: kTextColor,
                        ),
                      ),
                    ),

                    DataTable(
                      border:  const TableBorder(
                        horizontalInside: BorderSide(
                            width: .5,
                            color: kTextColor
                          // Change this to your desired color
                        ),
                      ),

                      dataRowColor: const MaterialStatePropertyAll(kContainerColor),
                      headingRowColor: const MaterialStatePropertyAll(kContainerColor),
                      horizontalMargin: 35,
                      sortAscending: false,
                      sortColumnIndex: 0,
                      columns: const [
                        DataColumn(
                            numeric: false,
                            label: Text("الاسم",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: kTextColor)),
                            tooltip: "إسم المعلومة المطلوبة"),
                        DataColumn(
                            label: Text("مثال",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "IBM",
                                    color: kTextColor)),
                            tooltip: "مثال على العلومة المطلوبة")
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text("اسم المالك",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                          DataCell(Text("أدهم أنور أبوعلان",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "IBM",
                                  color: kTextColor))),
                          // DataCell(Text("عنوان الإعلان الخاص بالشقة")),
                        ]),
                        DataRow(cells: [
                          DataCell(
                              showEditIcon: false,
                              Text("رقم الهاتف",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    color: kTextColor,
                                  )),
                              placeholder: false),
                          DataCell(Text(
                            "+97256*****3",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "IBM",
                              color: kTextColor
                            ),
                            textDirection: TextDirection.ltr,
                          )),
                        ]),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    aline,
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("إقرأ ايضًا",
                        style: TextStyle(fontSize: 18, fontFamily: "IBM",color: kTextColor)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          myPushName(context, MyPagesRoutes.theAdIsFreeOrNot);
                        },
                        child: const Text(
                            " كم تكلفة نشر إعلان على تطبيق 'وين بلاقي'",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "IBM",
                                color: Colors.orange))),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          myPushName(context, MyPagesRoutes.howCreateAd);
                        },
                        child: const Text(
                            " كيف انشر إعلاني على تطبيق 'وين بلاقي'",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "IBM",
                                color: Colors.orange)))
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
