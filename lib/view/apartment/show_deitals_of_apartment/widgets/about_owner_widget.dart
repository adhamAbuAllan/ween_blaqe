import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';

class AboutOwnerWidget extends ConsumerStatefulWidget {
  const AboutOwnerWidget({super.key, required this.oneApartment});

  final DataOfOneApartment oneApartment;

  @override
  ConsumerState<AboutOwnerWidget> createState() =>
      _AboutOwnerContainerWidgetState();
}

class _AboutOwnerContainerWidgetState extends ConsumerState<AboutOwnerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          10, getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("about_owner"),
              style: TextStyle(
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode,
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: widget.oneApartment.owner?.profile == "images/profile/"
                    ? CircleAvatar(
                        radius: getIt<AppDimension>().isSmallScreen(context)
                            ? 26
                            : 28,
                        backgroundColor: Colors.grey.shade700,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: getIt<AppDimension>().isSmallScreen(context)
                              ? 26
                              : 28,
                        ),
                      )
                    : CircleAvatar(
                        radius: getIt<AppDimension>().isSmallScreen(context)
                            ? 26
                            : 28,
                        backgroundColor: themeMode.isLight
                            ? kBackgroundAppColorLightMode
                            : kBackgroundAppColorDarkMode,
                        backgroundImage: NetworkImage(
                            //for localhost
                            "http://192.168.1.16:8000/${widget.oneApartment.owner?.profile ?? "images/profile/user.png"}"),
                        //for server
                        //   "https://weenbalaqee.com/${widget.oneApartment.owner?.profile ?? "images/profile/user.png"}"),
                        child: ref.watch(fetchApartmentNotifier).isLoading
                            ? const CircularProgressIndicator()
                            : null),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.oneApartment.owner?.name ?? "",
                    style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context)
                          ? 15
                          : 18,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                  ),
                  Text(
                    widget.oneApartment.owner?.phone ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
