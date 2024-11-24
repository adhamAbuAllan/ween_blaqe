// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/core/widgets/apartments/show_more_classes_widget/show_all_advantages_class_widget.dart';

import '../../../../api/advantages.dart';
import '../../../../api/apartments_api/apartments.dart';
import '../../../../constants/nums.dart';
import '../../../utils/styles/button.dart';

class GetAdvantages extends StatefulWidget {
  const GetAdvantages({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  State<GetAdvantages> createState() => _GetAdvantagesState();
}

class _GetAdvantagesState extends State<GetAdvantages> {
  late List<Advantages>? advantages = widget.oneApartment?.advantages;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          10, getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 0),
      decoration: BoxDecoration(
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
                SetLocalization.of(context)!.getTranslateValue("advantages"),
                style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Column(
            children: _advantageItemsWidget(advantages: advantages)
                .toList()
                .take(10)
                .toList(),
          ),

//button to show more advantages
          (advantages?.length ?? 0) > 10
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 55 / 1.2
                        : 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ShowAllAdvantages(features: advantages!);
                          }),
                        );
                      },
                      style: fullButton(),
                      child: Text(
                        "${SetLocalization.of(context)!.getTranslateValue("view_other_advantages")} ${(advantages?.length ?? 0) - 10} ${SetLocalization.of(context)!.getTranslateValue("other")}",
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 15
                              : null,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Iterable<Padding> _advantageItemsWidget({List<Advantages>? advantages}) {
    return advantages?.map((entry) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: ListTile(
              title: Text(entry.advName!,
                  style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context)
                          ? 15
                          : 16,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode)),
              trailing: entry.icon!.isEmpty
                  ? const SizedBox(
                      child: SkeletonAvatar(
                          style: SkeletonAvatarStyle(width: 28, height: 28)))
                  : Image.network(
                      entry.icon!,
                      height: getIt<AppDimension>().isSmallScreen(context)
                          ? 26
                          : 30,
                      width: getIt<AppDimension>().isSmallScreen(context)
                          ? 26
                          : 30,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                            child: SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                          width: 28,
                          height: 28,
                        )));
                      },
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
            ),
          );
        }) ??
        [].map((e) => const Padding(
              padding: EdgeInsets.all(0),
              child: SizedBox(),
            ));
  }
}
