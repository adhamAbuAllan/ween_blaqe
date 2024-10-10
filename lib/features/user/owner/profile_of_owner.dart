import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/sesstion/new_session.dart';
import 'package:ween_blaqe/testing_code/update_data_of_user_test.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
// ignore: duplicate_import
import '../../../api/apartments_api/one_apartment.dart';
import '../../../api/users.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/coordination.dart';
import '../../../constants/injection.dart';
import '../../../core/utils/styles/button.dart';

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

  @override
  void initState() {
    super.initState();
    setState(() {
      apartmentModelController.fetchApartments(isOwnerApartments: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ColorfulSafeArea(
        bottomColor: Colors.transparent,
        color: kPrimaryColorDarkMode,
        child: Scaffold(
          backgroundColor: themeMode.isDark
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 520,
                  //
                  // Adjust the bottom position to center the background behind the placeholder
                  child: Container(
                    color: themeMode.isDark
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                ),
                Column(
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

                           CircleAvatar(//put an icon , that if not user
                            // changed it , will keep icon
                            radius: 40, // Adjust the radius as needed
                            backgroundColor: Colors.grey.shade700, // Set the
                            // background color of the avatar
                            child: const SizedBox(height: 30 * 2,
                              width: 30 * 2,
                              child: Center(
                                child: Icon(Icons.person,color:
                                  Colors.white,size: 50,),
                              ),
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row(children: [],),

                                Text(NewSession.get("name", "def"),
                                    style:
                                        TextStyle(color: themeMode
                                              .isDark ?
                                        kTextColorLightMode :kTextColorDarkMode ,
                                        fontFamily: "IBM",
                                          fontSize: 20,
                                        )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    NewSession.get("phone", "def"),
                                    style:
                                        TextStyle(color: themeMode.isDark
                                        ? kTextColorLightMode: kTextColorDarkMode,
                                            fontFamily: "IBM",
                                            fontSize: 16)),
                                const SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UpdateUserWidgetTest(),
                                        ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        20,
                                        getIt<AppDimension>()
                                                .isSmallScreen(context)
                                            ? 20 / 1.5
                                            : 20,
                                        20,
                                        0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: getIt<AppDimension>()
                                              .isSmallScreen(context)
                                          ? 55 / 1.2
                                          : 55,
                                      child: ElevatedButton(
                                          style:
                                              fullButton(themeMode: themeMode),
                                          onPressed: () {
                                            myPushName(context,
                                                MyPagesRoutes.updateUserInfo);
                                          },
                                          child: const Text("تعديل البيانات")),
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Row(children: [],),

                                const Placeholder(
                                  color: Colors.white54,
                                  child: SizedBox(
                                    height: 20,
                                    width: 250,
                                    child: Center(
                                      child: Text("",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Placeholder(
                                  color: Colors.white54,
                                  child: SizedBox(
                                    height: 25,
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                          "sience owner text ${apartmentModelController.apartments.value.data?.first.owner?.timeAgoCreated}"
                                          "",
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row(children: [],),

                                const Placeholder(
                                  color: Colors.white54,
                                  child: SizedBox(
                                    height: 20,
                                    width: 250,
                                    child: Center(
                                      child: Text(
                                          "title of count apartment owner text",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Placeholder(
                                  color: Colors.white54,
                                  child: SizedBox(
                                    height: 25,
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                          "count apartment text "
                                          "${apartmentModelController.apartments.value.data?.length}",
                                          style: const TextStyle(
                                              color: Colors.white)),
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
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<int> countOfApartmentOfOwner() async {
    apartmentModelController.fetchApartments(isOwnerApartments: true);
    var apartments = apartmentModelController.apartments.value;

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
}
