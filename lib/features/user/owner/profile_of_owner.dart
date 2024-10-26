import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/widgets/buttons/social_media_connection_button.dart';
import 'package:ween_blaqe/core/widgets/skeletons/owner_widgets/profile_skeleton.dart';
import 'package:ween_blaqe/sesstion/new_session.dart';
import 'package:ween_blaqe/features/user/owner/update_data_of_user.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
// ignore: duplicate_import
import '../../../api/apartments_api/one_apartment.dart';
import '../../../api/users.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:http/http.dart' as http;

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../core/utils/styles/button.dart';

// import '../../../main.dart';
import '../../../main.dart';
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
  // @override
  // void deactivate() {
  //   super.deactivate();
  //
  // }
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
  var isPop = false;
  String formattedPhone = NewSession.get("phone", "def").startsWith("972")
      ? "0${NewSession.get("phone", "def").substring(3)}"
      : NewSession.get("phone", "def").startsWith("970")
          ? "0${NewSession.get("phone", "def").substring(3)}"
          : NewSession.get("phone", "def");

  @override
  void initState() {
    super.initState();
    imagesModelController.loadProfileImage();
    createSocialConnectionController.phoneController.text = formattedPhone;
    createSocialConnectionController.whatsappController.text =
        NewSession.get("phone", "def");
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
          body: imagesModelController.isLoadingProfile.value && isPop == false
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
                                onPressed: () {
                                  isPop = true;
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) async {
                                    imagesModelController.loadProfileImage();
                                    setState(() {});
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ),
                            const Expanded(child: Text(""))
                          ],
                        ),
                      ),
                      //image
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
                            //name and phone
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
                                            style: fullButton(),
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
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: themeMode.isLight
                                    ? kContainerColorLightMode
                                    : kContainerColorDarkMode,
                              ),
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Row(children: [],),

                                  Text("وسائل التواصل المتاحة لديك",
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
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10 * 2),
                                      child: OverflowBar(
                                        alignment: MainAxisAlignment.start,
                                        overflowAlignment:
                                            OverflowBarAlignment.center,
                                        spacing: 10,
                                        overflowSpacing: 10,
                                        children: [
                                          SocialMediaConnectionButton(
                                            check: () {
                                              sendMessageToWhatsApp(
                                                  createSocialConnectionController
                                                      .whatsappController.text,
                                                  "رقم الواتس صحيح"
                                                  );
                                            },
                                            labelUserName: " رقم الواتس اب ",
                                            socialDialogName: "واتس اب",
                                            controller:
                                                createSocialConnectionController
                                                    .whatsappController,
                                            userName:
                                                NewSession.get("phone", "def"),
                                            isActive:
                                                createSocialConnectionController
                                                    .whatsAppIsActive.value,
                                            socialName: "واتس اب",
                                            socialIcon:
                                                FontAwesomeIcons.whatsapp,
                                          ),
                                          SocialMediaConnectionButton(
                                              isActive:
                                                  createSocialConnectionController
                                                      .facebookIsActive.value,
                                              labelUserName: "اسم المستخدم",
                                              socialDialogName: "فيس بوك",
                                              socialName: "فيس بوك",
                                              check: () async {
                                                final Uri url = Uri.parse(
                                                    'https://m'
                                                    '.me/${createSocialConnectionController.facebookController.text}');
                                                if (!await launchUrl(url)) {
                                                  throw Exception(
                                                      'Could not launch $url');
                                                }
                                              },
                                              userName:
                                                  createSocialConnectionController
                                                      .facebookController.text,
                                              controller:
                                                  createSocialConnectionController
                                                      .facebookController,
                                              socialIcon:
                                                  FontAwesomeIcons.facebook,
                                              onChanged: (value) {
                                                createSocialConnectionController
                                                    .facebookController
                                                    .text = value;
                                              },
                                              onSaved: () {
                                                if (createSocialConnectionController
                                                        .facebookController
                                                        .text ==
                                                    "") {
                                                  createSocialConnectionController
                                                      .facebookController
                                                      .text = "user_name";
                                                  createSocialConnectionController
                                                      .facebookIsActive
                                                      .value = false;
                                                }
                                                updateSocialConnectionData();
                                                Navigator.pop(context);
                                              }),
                                        ],
                                      ),
                                    );
                                  }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: OverflowBar(
                                        spacing: 10,
                                        overflowSpacing: 10,
                                        children: [
                                          SocialMediaConnectionButton(
                                              labelUserName:
                                                  " البريد الالكتروني "
                                                  "الخاص بك",
                                              socialDialogName: "جيميل",
                                              isActive:
                                                  createSocialConnectionController
                                                      .emailIsActive.value,
                                              userName:
                                                  createSocialConnectionController
                                                      .emailController.text,
                                              controller:
                                                  createSocialConnectionController
                                                      .emailController,
                                              socialName: "جيميل",
                                              socialIcon:
                                                  FontAwesomeIcons.envelope,
                                              onSaved: () {
                                                if (createSocialConnectionController
                                                        .emailController.text ==
                                                    "") {
                                                  createSocialConnectionController
                                                      .emailController
                                                      .text = "user_email";
                                                  createSocialConnectionController
                                                      .emailIsActive
                                                      .value = false;
                                                }
                                                updateSocialConnectionData();
                                                Navigator.pop(context);
                                              },
                                              check:
                                                  createSocialConnectionController
                                                              .emailController
                                                              .text !=
                                                          "user_e"
                                                              "mail"
                                                      ? () async {
                                                          final Uri emailUri =
                                                              Uri(
                                                            scheme: 'mailto',
                                                            path: createSocialConnectionController
                                                                .emailController
                                                                .text,
                                                          );

                                                          if (await canLaunchUrl(
                                                              emailUri)) {
                                                            await launchUrl(
                                                                emailUri);
                                                          } else {
                                                            throw 'Could not launch email client';
                                                          }
                                                        }
                                                      : null,
                                              onChanged: (value) {
                                                createSocialConnectionController
                                                    .emailController
                                                    .text = value;
                                              }),
                                          SocialMediaConnectionButton(
                                            isActive:
                                                createSocialConnectionController
                                                    .phoneIsActive.value,
                                            socialName: "هاتف",
                                            labelUserName: "رق"
                                                "م الهاتف",
                                            socialDialogName: " الهاتف",
                                            socialIcon: FontAwesomeIcons.phone,
                                            userName: formattedPhone,
                                            controller:
                                                createSocialConnectionController
                                                    .phoneController,
                                          ),
                                        ],
                                      ),
                                    );
                                  })

                                  // const SocialMediaConnectionButton(isActive:
                                  // false, socialName: "soicalName",
                                  //     socialIcon: FontAwesomeIcons.whatsapp),
                                  // const SocialMediaConnectionButton(isActive:
                                  // true, socialName: "soicalName",
                                  //     socialIcon: FontAwesomeIcons.whatsapp)
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

  Future<void> updateSocialConnectionData() async {
    final ownerId = (await sp).get("id");
    if (createSocialConnectionController.emailController.text != "" ||
        createSocialConnectionController.facebookController.text != "") {
      (await sp).remove("facebook");
      (await sp).remove("email");
      debugPrint("user id -- $ownerId");

      final url = Uri.parse(ServerWeenBalaqee.userUpdate);
      // Replace with your API endpoint
      final response = await http.post(
        url,
        body: jsonEncode({
          'id': ownerId,
          'email': createSocialConnectionController.emailController.text,
          'facebook': createSocialConnectionController.facebookController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        if (createSocialConnectionController.emailController.text !=
            "user_email") {
          (await sp).setString(
              "email", createSocialConnectionController.emailController.text);
          createSocialConnectionController.emailIsActive.value = true;
          debugPrint(
              "emailController -- ${createSocialConnectionController.emailController.text}");
          debugPrint(
              "email active value -- ${createSocialConnectionController.emailIsActive.value}");
        } else {
          (await sp).remove("email");
          // createSocialConnectionController.emailController.text = "user_email";
          // createSocialConnectionController.emailIsActive.value = false;
        }
        if (createSocialConnectionController.facebookController.text !=
            "user"
                "_name"
                "") {
          (await sp).setString("facebook",
              createSocialConnectionController.facebookController.text);
          createSocialConnectionController.facebookIsActive.value = true;
          debugPrint(
              "faceBookController -- ${createSocialConnectionController.facebookController.text}");
          debugPrint(
              "facebook active value -- ${createSocialConnectionController.facebookIsActive.value}");
        } else {
          (await sp).remove("facebook");
          // createSocialConnectionController.facebookController.text = "user_na"
          //     "me";
          // createSocialConnectionController.facebookIsActive.value = false;
        }

        debugPrint('User updated successfully');
      } else {
        debugPrint('Failed to update user');
      }
    }
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
