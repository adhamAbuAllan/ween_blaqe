import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'package:skeletons/skeletons.dart';

// import 'package:ween_blaqe/controller/get_controllers.dart';

// import 'package:ween_blaqe/core/widgets/buttons/social_media_connection_button.dart';
import 'package:ween_blaqe/view/user/owner/widgets/profile_widgets/back_button_with_container_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/profile_widgets/circle_image_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/profile_widgets/count_of_ad_shown_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/profile_widgets/data_of_owner_and_button_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/profile_widgets/join_date_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/profile_widgets/social_media_widget.dart';
import 'package:ween_blaqe/session/new_session.dart';
// import 'package:ween_blaqe/testing_code/find_the_fastest_way_in_state_managment/riverpod/login_and_register_section/get_providers_test.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
// ignore: duplicate_import
import '../../../api/apartments_api/apartments.dart';
import '../../../api/users.dart';

// import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';

// import '../../../main.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../main.dart';
import '../../../controller/provider_controllers/providers/auth_provider.dart';
// import '../../../main.dart';

// import '../../../core/widgets/profile_classs_widget/profile_image.dart';
// import '../../../sesstion/new_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/skeleton_widgets/user_skeleton_widgets/skeleton_user_profile_ui.dart';

class ProfileUi extends ConsumerStatefulWidget {
  const ProfileUi({super.key, this.userInfo, this.apartments});

  final User? userInfo;
  final DataOfOneApartment? apartments;

  @override
  ConsumerState createState() => _ProfileOfOwnerConsumerState();
}

class _ProfileOfOwnerConsumerState extends ConsumerState<ProfileUi> {
  var countOfApartmentsOfOwner = 0;

  void initializeValue() async {
    (await sp).setString("name", ref.read(userData)?.name ?? "user name");
    ref.read(updateUsernameController.notifier).state.text =
        (await sp).getString("name") ?? "user name";
    (await sp).setString("phone", ref.read(userData)?.phone ?? "9700000000");

    ref.read(updatePhoneNumberController.notifier).state.text =
        (await sp).getString("phone")?.substring(3) ??
            "97000000000".substring(3);

    ref.read(userData)?.phone?.startsWith("970") ?? true
        ? ref.read(selectedCountryCode.notifier).state = "+970"
        : ref.read(selectedCountryCode.notifier).state = "+972";
  }

  @override
  void initState() {
    super.initState();

    // Schedule modification after the first frame is drawn
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(loadProfileImageNotifier.notifier).loadProfileImage(ref);

      await ref
          .read(refreshUserDataNotifier.notifier)
          .refreshUserData(userId: NewSession.get("id", -1), ref: ref);

      await ref
          .read(refreshAndSetSocialDataNotifier.notifier)
          .refreshAndSetSocialData(ref);
    });
    initializeValue();
    // apartmentModelController.fetchApartments(isOwnerApartments: true);
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        body: ref.watch(loadProfileImageNotifier).isLoading != false ||
                ref.watch(compressAndUploadImageNotifier).isLoading
            // &&
            //       ref.watch(isPop) == false
            ? const UserProfileSkeletonUi()
            : const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButtonWithContainerWidget(),
                    CircleImageWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          //name and phone
                          DataOfOwnerAndButtonWidget(),
                          SizedBox(height: 10),
                          SocialMediaWidget(),
                          SizedBox(
                            height: 10,
                          ),
                          JoinDateWidget(),
                          SizedBox(
                            height: 10,
                          ),
                          CountOfAdShownWidget()

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
