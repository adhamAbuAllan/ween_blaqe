import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/widgets/skeletons/owner_widgets/profile_skeleton.dart';
import 'package:ween_blaqe/sesstion/new_session.dart';
import 'package:ween_blaqe/features/user/owner/update_data_of_user.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
// ignore: duplicate_import
import '../../../api/apartments_api/one_apartment.dart';
import '../../../api/users.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../core/utils/styles/button.dart';

// import '../../../main.dart';
import 'change_user_image.dart';
// import '../../../main.dart';

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
  var isLoading = false;

  @override
  void initState() {
    super.initState();
      apartmentModelController.fetchApartments(isOwnerApartments: true);
      debugPrint("the profile of user : ${widget.userInfo?.profile}");
      debugPrint("the profile of SP  : ${NewSession.get("profile", "def")}");
      debugPrint("the profile of SP with Server  : ${"https://weenbalaqee"
          ".com/${NewSession.get("profile", "def")}"}");
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Obx(() {
        return Scaffold(
          backgroundColor: themeMode.isLight
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          body: imagesModelController.isLoadingProfile.value
              ? UserProfileSkeleton(isLightMode: themeMode.isLight)
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //backButton
                      Container(
                        color: themeMode.isLight
                            ? kContainerColorLightMode
                            : kContainerColorDarkMode,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: BackButton(
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
                              ),
                            ),
                            const Expanded(child: Text(""))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 15),
                        alignment: Alignment.bottomRight,
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              (themeMode.isLight
                                  ? kBackgroundAppColorLightMode
                                  : kBackgroundAppColorDarkMode),
                              (themeMode.isLight
                                  ? kBackgroundAppColorLightMode
                                  : kBackgroundAppColorDarkMode),
                              (themeMode.isLight
                                  ? kContainerColorLightMode
                                  : kContainerColorDarkMode)
                            ],
                            // Three colors
                            begin:
                                Alignment.bottomCenter, // Horizontal gradient
                            end: Alignment.topCenter,
                            stops: const [0, 0.25, 0.0], // Color stops
                          ),
                        ),
                        child: Obx(() {
                          imagesModelController.isLoadingProfile.value;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangeUserImage()));
                            },
                            child: NewSession.get("profile", "def") ==
                                    "images/profile/user.png"
                                ? CircleAvatar(
                                    radius: 40,
                                    //put a normal person Icon
                                    backgroundColor: Colors.grey.shade700,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 40,
                                    ))
                                : CircleAvatar(
                                    radius: 40,
                                    // backgroundImage: NetworkImage(NewSession.get("profile","def")),
                                    // Adjust the radius as needed
                                    backgroundColor: Colors.grey.shade700,
                                    // Set the background color of the avatar
                                    backgroundImage: NetworkImage(
                                        "https://weenbalaqee"
                                        ".com/${NewSession.get("profile", "def")}"),
                                    child: imagesModelController
                                            .isLoadingProfile.value
                                        ? const CircularProgressIndicator()
                                        : null,
                                  ),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // const SizedBox(
                            //   height: 50,
                            // ),

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
                                color: themeMode.isLight
                                    ? kContainerColorLightMode
                                    : kContainerColorDarkMode,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row(children: [],),

                                  Text(NewSession.get("name", "def"),
                                      style: TextStyle(
                                        color: themeMode.isLight
                                            ? kTextColorLightMode
                                            : kTextColorDarkMode,
                                        fontFamily: "IBM",
                                        fontSize: 20,
                                      )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(NewSession.get("phone", "def"),
                                      style: TextStyle(
                                          color: themeMode.isLight
                                              ? kTextColorLightMode
                                              : kTextColorDarkMode,
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
                                                const UpdateUserData(),
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
                                            style: fullButton(
                                                themeMode: themeMode),
                                            onPressed: () {
                                              myPushName(context,
                                                  MyPagesRoutes.updateUserInfo);
                                            },
                                            child: const Text("تعديل البيانات",
                                                style: TextStyle(
                                                    fontFamily: "IBM"))),
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
                                color: themeMode.isLight
                                    ? kContainerColorLightMode
                                    : kContainerColorDarkMode,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Row(children: [],),

                                  Text("وقت الإنضمام",
                                      style: TextStyle(
                                          color: themeMode.isLight
                                              ? kTextColorLightMode
                                              : kTextColorDarkMode,
                                          fontSize: 18,
                                          fontFamily: "IBM")),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                      " أنشأت حسابك  ${NewSession.get("createdAt", "def")} حتى الآن ",
                                      style: TextStyle(
                                          color: themeMode.isLight
                                              ? kTextColorLightMode
                                              : kTextColorDarkMode,
                                          fontSize: 16,
                                          fontFamily: "IBM")),
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
                                color: themeMode.isLight
                                    ? kContainerColorLightMode
                                    : kContainerColorDarkMode,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row(children: [],),

                                  Text("عدد الإعلانات العروضة",
                                      style: TextStyle(
                                          color: themeMode.isLight
                                              ? kTextColorLightMode
                                              : kTextColorDarkMode,
                                          fontSize: 18,
                                          fontFamily: "IBM")),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Obx(() {
                                    return Text(
                                        "لديك"
                                        " ${apartmentModelController.apartments.value.data?.length} "
                                        " من الإعلانات المعروضة",
                                        style: TextStyle(
                                            color: themeMode.isLight
                                                ? kTextColorLightMode
                                                : kTextColorDarkMode,
                                            fontSize: 16,
                                            fontFamily: "IBM"));
                                  })
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
        );
      }),
    );
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
