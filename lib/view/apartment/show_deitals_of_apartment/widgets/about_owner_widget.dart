import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';

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
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("about_owner"),
              style: TextStyle(
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
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
                        backgroundColor: ref
                            .read(themeModeNotifier.notifier)
                            .backgroundAppTheme(ref: ref),
                        backgroundImage: NetworkImage(
                            //for localhost
                            "http://192.168.1.8:8000/${widget.oneApartment.owner?.profile ?? "images/profile/user.png"}"),
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
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .textTheme(ref: ref),
                    ),
                  ),
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
      ),
    );
  }
}
