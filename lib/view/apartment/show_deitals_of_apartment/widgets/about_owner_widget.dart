import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/auth_provider.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../user/owner/widgets/change_user_image_widgets/default_image_widget.dart';
import '../../apartment_of_owner/apartments_of_owner_ui.dart';

class AboutOwnerWidget extends ConsumerStatefulWidget {
  const AboutOwnerWidget(
      {super.key, required this.oneApartment, this.isForListHome});

  final bool? isForListHome;
  final DataOfOneApartment oneApartment;

  @override
  ConsumerState<AboutOwnerWidget> createState() =>
      _AboutOwnerContainerWidgetState();
}

class _AboutOwnerContainerWidgetState extends ConsumerState<AboutOwnerWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isForListHome ?? false
        ? GestureDetector(
            onTap: () async {
              if (ref.read(isShowOwnerApartmentMode)) {
                return;
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  ref.read(ownerIdNotifier.notifier).state =
                      widget.oneApartment.owner?.id ?? 0;
                });
                myPush(
                    context: context,
                    ui: ApartmentsOfOwnerUi(
                      ownerIdToShow: widget.oneApartment.owner?.id,
                      ownerName: widget.oneApartment.owner?.name,
                    ));
              }
            },
            child: dataOfUserWidget(context,
                isForListHome: widget.isForListHome ?? false),
          )
        : Container(
            margin: EdgeInsets.fromLTRB(10,
                getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color:
                  ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
            ),
            child: GestureDetector(
              onTap: () {
                if (ref.read(isShowOwnerApartmentMode)) {
                  return;
                } else {
                  myPush(
                      context: context,
                      ui: ApartmentsOfOwnerUi(
                        ownerIdToShow: widget.oneApartment.owner?.id,
                        ownerName: widget.oneApartment.owner?.name,
                      ));
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      SetLocalization.of(context)!
                          .getTranslateValue("about_owner"),
                      style: TextStyle(
                        color: ref
                            .read(themeModeNotifier.notifier)
                            .textTheme(ref: ref),
                        fontSize: getIt<AppDimension>().isSmallScreen(context)
                            ? 18
                            : 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  dataOfUserWidget(context),
                ],
              ),
            ),
          );
  }

  Row dataOfUserWidget(BuildContext context, {bool isForListHome = false}) {
    return Row(
      children: [
        Padding(
          padding: isForListHome
              ? const EdgeInsets.only(left: 10, top: 15, bottom: 15)
              : const EdgeInsets.all(10),
          child:
          // ref.watch(profileImageFile)?.path != null
          //     ? MobileStorageImageWidget(
          //         radius: isForListHome
          //             ? 20
          //             : getIt<AppDimension>().isSmallScreen(context)
          //                 ? 26
          //                 : 28,
          //       )
          //     :
          // (NewSession.get("profile", "def") != "images/profile/user.png"
          //         ? ServerImageWidget(
          //             urlImage:
          //                 "http://softapps.website/${widget.oneApartment.owner?.profile ?? "images/profile/user.png"}",
          //             radius: isForListHome
          //                 ? 20
          //                 : getIt<AppDimension>().isSmallScreen(context)
          //                     ? 26
          //                     : 28,
          //           )
          //         :
          DefaultImageWidget(
                      radius: isForListHome
                          ? 20
                          : getIt<AppDimension>().isSmallScreen(context)
                              ? 26
                              : 28,
                    )
    // ),
          // child: widget.oneApartment.owner?.profile == "images/profile/"
          //     ? CircleAvatar(
          //         radius: isForListHome
          //             ? 20
          //             : getIt<AppDimension>().isSmallScreen(context)
          //                 ? 26
          //                 : 28,
          //         backgroundColor: Colors.grey.shade700,
          //         child: Icon(
          //           Icons.person,
          //           color: Colors.white,
          //           size:
          //               getIt<AppDimension>().isSmallScreen(context) ? 26 : 28,
          //         ),
          //       )
          //     : CircleAvatar(
          //         radius: isForListHome
          //             ? 20
          //             : getIt<AppDimension>().isSmallScreen(context)
          //                 ? 26
          //                 : 28,
          //         backgroundColor: ref
          //             .read(themeModeNotifier.notifier)
          //             .backgroundAppTheme(ref: ref),
          //         backgroundImage: NetworkImage(
          //
          //             //for localhost
          //             "http://softapps.website/${widget.oneApartment.owner?.profile ?? "images/profile/user.png"}"),
          //         //for server
          //         //   "https://weenbalaqee.com/${widget.oneApartment.owner?.profile ?? "images/profile/user.png"}"),
          //         child: ref.watch(fetchApartmentNotifier).isLoading
          //             ? const CircularProgressIndicator()
          //             : null),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 5,
              children: [
                Text(
                  widget.oneApartment.owner?.name ?? "",
                  style: TextStyle(
                    fontSize: isForListHome
                        ? 15
                        : getIt<AppDimension>().isSmallScreen(context)
                            ? 15
                            : 18,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  ),
                ),
                Text(
                  "- ${getTypeOfUser(id: widget.oneApartment.owner?.typeId)}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  ),
                )
              ],
            ),
            isForListHome
                ? const SizedBox()
                : Row(
                    children: [
                      Text(
                        widget.oneApartment.owner?.phone ?? "",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ],
    );
  }

  String getTypeOfUser({int? id}) {
    debugPrint("current ownerId $id");
    switch (id) {
      case 1:
        return "بائع";
      case 2:
        return "مكتب عقاري";
      case 3:
        return "محمع سكني";
      default:
        return "بائع";
    }
  }
}
