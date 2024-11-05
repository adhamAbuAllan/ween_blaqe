
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
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: IconButton(
                        padding: const EdgeInsets.only(right: 10),
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                        )),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(SetLocalization.of(context)!.getTranslateValue("features"),
                              style: TextStyle(
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
                                fontSize: 20,
                                fontFamily: 'IBM',
                              )),
                        ),
                        const Expanded(child: Text("")),
                      ],
                    ),
                    SizedBox(
                      height: getIt<AppDimension>()
                          .isSmallScreen(context)
                          ? 525/1.1:585,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: widget.features.length,
                          itemBuilder: ((c, i) {
                            return ListTile(
                                title: Text(
                                  widget.features[i].advName!,
                                  style: TextStyle(
                                      fontFamily: 'IBM',
                                      fontSize: 16,
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
                                  height: 30,
                                  width: 30,
                                  color: themeMode.isLight
                                      ? kTextColorLightMode
                                      : kTextColorDarkMode,
                                ));
                          })),
                    ),
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
