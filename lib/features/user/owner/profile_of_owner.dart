import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
// ignore: duplicate_import
import '../../../api/apartments_api/one_apartment.dart';
import '../../../api/users.dart';
import 'package:ween_blaqe/constants/nums.dart';
// import '../../../core/widgets/profile_classs_widget/profile_image.dart';
// import '../../../sesstion/new_session.dart';

class ProfileOfOwner extends StatefulWidget {
  const ProfileOfOwner({super.key, this.userInfo, this.apartments});

  final User? userInfo;
  final DataOfOneApartment? apartments;

  @override
  State<ProfileOfOwner> createState() => _ProfileOfOwnerState();
}

class _ProfileOfOwnerState extends State<ProfileOfOwner> {
  var image = "https://robohash.org/hicveldicta.png/";

  // var name =;

  var titleOfAdcount = "عدد الإعلانات التي قمت بنشرها";

  // var countOfAd = 0;
  var titleOfacseptOreer = "عدد قبول طلبات الحجز ";
  var titleOfdisaccsecptOfOrder = "عدد رفض طلبات الحجز";
  var countOfOrders = " عدد طلبات الحجز";

  // var joinDate = "2020/3/3";
  var countOfApartmentsOfOwner = 0;

  Future<int> countOfApartmentOfOwner(OneApartment apartments) async {
    var apartmentOfOwner = widget.apartments?.id;
    for (var i = 0; i < apartments.data!.length;) {
      if (apartmentOfOwner == apartments.data!.first.id) {
        countOfApartmentsOfOwner += 1;
        i++;
      }
      return countOfApartmentsOfOwner;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isDark
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: BackButton(
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                  ),
                  const Expanded(child: Text(""))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),

                    const Placeholder(
                      color: Colors.blue,
                      child: SizedBox(
                        height: 30 * 2,
                        width: 30 * 2,
                        child: Center(
                            child: Text(
                          "image",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      // height: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: themeMode.isDark
                            ? kContainerColorLightMode
                            : kContainerColorDarkMode,
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Row(children: [],),

                          Placeholder(
                            color: Colors.white54,
                            child: SizedBox(
                              height: 30,
                              width: 300,
                              child: Center(
                                child: Text(
                                    "name Of user "
                                    "Text ",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Placeholder(
                            color: Colors.white54,
                            child: SizedBox(
                              height: 20,
                              width: 250,
                              child: Center(
                                child: Text(
                                    "number Phone Of user "
                                    "Text ",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Placeholder(
                            color: Colors.orange,
                            child: SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Center(
                                    child: Text(
                                  textDirection: TextDirection.ltr,
                                  softWrap: true,
                                  "button to Update Data Or To Go"
                                  " Screen Update Data",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      // height: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: themeMode.isDark
                            ? kContainerColorLightMode
                            : kContainerColorDarkMode,
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Row(children: [],),

                          Placeholder(
                            color: Colors.white54,
                            child: SizedBox(
                              height: 20,
                              width: 250,
                              child: Center(
                                child: Text(
"title seince owner text",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Placeholder(
                            color: Colors.white54,
                            child: SizedBox(
                              height: 25,
                              width: 200,
                              child: Center(
                                child: Text(
"sience owner text",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Container(
                    //   margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                    //   // height: 140,
                    //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    //
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(7),
                    //     color: themeMode.isDark ? kContainerColorLightMode : kContainerColorDarkMode,
                    //   ),
                    //
                    //   child: Column(mainAxisSize: MainAxisSize.min, children: [
                    //     DataOfOnwer(
                    //       title: titleOfAdcount,
                    //       number: countOfApartmentsOfOwner,
                    //     ),
                    //     DataOfOnwer(
                    //       title: titleOfacseptOreer,
                    //       number: 8,
                    //     ),
                    //     DataOfOnwer(
                    //       title: titleOfdisaccsecptOfOrder,
                    //       number: 4,
                    //     ),
                    //     DataOfOnwer(
                    //       title: countOfOrders,
                    //       number: 10,
                    //     ),
                    //   ]),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
