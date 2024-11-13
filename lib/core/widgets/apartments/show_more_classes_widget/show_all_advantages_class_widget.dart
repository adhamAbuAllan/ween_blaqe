import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../../../../api/advantages.dart';
import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/nums.dart';

class ShowAllAdvantages extends StatefulWidget {
  const ShowAllAdvantages({super.key, required this.features});

  final List<Advantages> features;

  @override
  State<ShowAllAdvantages> createState() => _ShowAllAdvantagesState();
}

class _ShowAllAdvantagesState extends State<ShowAllAdvantages> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        appBar: AppBar(
          title: Text(
              SetLocalization.of(context)!.getTranslateValue("all_advantages"),
              style: TextStyle(
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode,
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                fontWeight: FontWeight.w600,
              )),
          backgroundColor: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode,
          // centerTitle: false,
        ),
        body: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 0),
                    itemCount: widget.features.length,
                    itemBuilder: ((c, i) {
                      return ListTile(
                          title: Text(
                            widget.features[i].advName!,
                            style: TextStyle(
                                fontSize:
                                    getIt<AppDimension>().isSmallScreen(context)
                                        ? 14
                                        : 16,
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode),
                          ),
                          trailing: widget.features[i].icon!.isEmpty
                              ? SizedBox(
                                  child: CircularProgressIndicator(
                                  color: themeMode.isLight
                                      ? kPrimaryColorLightMode
                                      : kPrimaryColorDarkMode,
                                  strokeWidth: 3,
                                ))
                              : Image.network(
                                  widget.features[i].icon!,
                                  height: getIt<AppDimension>()
                                          .isSmallScreen(context)
                                      ? 26
                                      : 30,
                                  width: getIt<AppDimension>()
                                          .isSmallScreen(context)
                                      ? 26
                                      : 30,
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode,
                                ));
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
