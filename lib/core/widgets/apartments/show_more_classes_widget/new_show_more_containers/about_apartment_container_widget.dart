import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/session/new_session.dart';

class AboutApartmentContainerWidget extends StatefulWidget {
  const AboutApartmentContainerWidget({super.key,
    required this.oneApartment,
    required this.imageAboutApartmentRoom});

  final DataOfOneApartment oneApartment;
  final String imageAboutApartmentRoom;

  @override
  State<AboutApartmentContainerWidget> createState() =>
      _AboutApartmentContainerWidgetState();
}

class _AboutApartmentContainerWidgetState
    extends State<AboutApartmentContainerWidget> {
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
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //about apartment  text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("about_apartment"),
              style: TextStyle(
                  fontSize:
                  getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                  fontWeight: FontWeight.w600,

                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode),
            ),
          ),

          //about apartment items
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AnimateRoomBox(oneApartment: widget.oneApartment,
                    imageAboutApartmentRoom: widget.imageAboutApartmentRoom,),
                ),
                Flexible(child: AnimateBathRoomBox(oneApartment: widget.oneApartment,)),
                Flexible(child: AnimateAreaBox(oneApartment: widget.oneApartment,)),


              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimateRoomBox extends StatefulWidget {
  const AnimateRoomBox(
      {super.key, required this.oneApartment, required this.imageAboutApartmentRoom});

  final DataOfOneApartment oneApartment;
  final String imageAboutApartmentRoom;

  @override
  State<AnimateRoomBox> createState() => _AnimateRoomBoxState();
}

class _AnimateRoomBoxState extends State<AnimateRoomBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FittedBox(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 700),
          curve: Curves.linear,
          reverseDuration: const Duration(milliseconds: 700),
          clipBehavior: Clip.antiAlias,
          child: Obx(() {
            return OutlinedButton(
              onPressed: () {
                animationBoxController.isRoomSizeChange.value =
                !animationBoxController.isRoomSizeChange.value;
              },
              style: outlinedButton(themeMode: themeMode,context: context)
                  .copyWith(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.all(10)),
                  overlayColor: const WidgetStatePropertyAll(
                      Colors.transparent),
                  side: WidgetStatePropertyAll(BorderSide(
                      width: !animationBoxController
                          .isRoomSizeChange.value
                          ? 1
                          : 2,
                      color: animationBoxController
                          .isRoomSizeChange.value
                          ? themeMode.isLight
                          ? kPrimaryColorLightMode
                          : kPrimaryColorDarkMode
                          : themeMode.isLight
                          ? kPrimaryColor300LightMode
                          : kPrimaryColor300DarkMode))),
              child: Column(
                children: [
                  Text(
                    SetLocalization.of(context)!
                        .getTranslateValue("rooms"),
                    style: TextStyle(
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode),
                  ),
                  Row(
                    children: [
                      //Cubic meters

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: animationBoxController
                            .isRoomSizeChange.value
                            ? FittedBox(
                          child: animationBoxController
                              .buildAnimatedTextKit(
                              "${widget.oneApartment.rooms ??
                                  0}"),
                        )
                            : Text(
                          "${widget.oneApartment.rooms ?? 0}",
                          style: TextStyle(
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode),
                        ),
                      ),
                      Image(
                        image: AssetImage(
                            widget.imageAboutApartmentRoom),
                        width: 32,
                        height: 32,
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class AnimateBathRoomBox extends StatefulWidget {
  const AnimateBathRoomBox({super.key, required this.oneApartment});

  final DataOfOneApartment oneApartment;

  @override
  State<AnimateBathRoomBox> createState() => _AnimateBathRoomBoxState();
}


class _AnimateBathRoomBoxState extends State<AnimateBathRoomBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FittedBox(
        // clipBehavior: Clip.antiAlias,
        // alignment: Alignment.topCenter,
        // fit: BoxFit.none,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 700),
          curve: Curves.linear,
          reverseDuration: const Duration(milliseconds: 700),
          clipBehavior: Clip.antiAlias,
          child: Obx(() {
            return OutlinedButton(
              onPressed: () {
                animationBoxController.isRoomBathSizeChange
                    .value =
                !animationBoxController
                    .isRoomBathSizeChange.value;
              },
              style: outlinedButton(themeMode: themeMode,context: context)
                  .copyWith(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.all(10)),
                  overlayColor: const WidgetStatePropertyAll(
                      Colors.transparent),
                  side: WidgetStatePropertyAll(BorderSide(
                      width: !animationBoxController
                          .isRoomBathSizeChange.value
                          ? 1
                          : 2,
                      color: animationBoxController
                          .isRoomBathSizeChange.value
                          ? themeMode.isLight
                          ? kPrimaryColorLightMode
                          : kPrimaryColorDarkMode
                          : themeMode.isLight
                          ? kPrimaryColor300LightMode
                          : kPrimaryColor300DarkMode))),
              child: Column(
                children: [
                  // const Expanded(
                  //   child: Text(""),
                  // ),
                  Text(
                    SetLocalization.of(context)!
                        .getTranslateValue("bathrooms"),
                    style: TextStyle(
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode),
                  ),
                  // const Expanded(
                  //   child: Text(""),
                  // ),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      //Cubic meters
                      // const Expanded(
                      //   child: Text(""),
                      // ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: animationBoxController
                            .isRoomBathSizeChange.value
                            ? FittedBox(
                          child: animationBoxController
                              .buildAnimatedTextKit(
                              "${widget.oneApartment.bathrooms ??
                                  0}"),
                        )
                            : Text(
                          "${widget.oneApartment.bathrooms ?? 0}",
                          style: TextStyle(
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode),
                        ),
                      ),
                      Image(
                        image: const AssetImage(
                            "assets/images/apartments_images/about_apartment/bathroom.png"),
                        width: 32,
                        height: 32,
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class AnimateAreaBox extends StatefulWidget {
  const AnimateAreaBox({super.key, required this.oneApartment});

  final DataOfOneApartment oneApartment;

  @override
  State<AnimateAreaBox> createState() => _AnimateAreaBoxState();
}

class _AnimateAreaBoxState extends State<AnimateAreaBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FittedBox(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 700),
          curve: Curves.linear,
          reverseDuration: const Duration(milliseconds: 700),
          clipBehavior: Clip.antiAlias,
          child: Obx(() {
            return OutlinedButton(
              onPressed: () {
                animationBoxController.isAreaSizeChange.value =
                !animationBoxController.isAreaSizeChange.value;
              },
              style: outlinedButton(themeMode: themeMode,context: context)
                  .copyWith(
                  padding: const WidgetStatePropertyAll(
                    //10
                      EdgeInsets.all(10)), // ),
                  overlayColor: const WidgetStatePropertyAll(
                      Colors.transparent),
                  side: WidgetStatePropertyAll(BorderSide(
                      width: !animationBoxController
                          .isAreaSizeChange.value
                          ? 1
                          : 2,
                      color: animationBoxController
                          .isAreaSizeChange.value
                          ? themeMode.isLight
                          ? kPrimaryColorLightMode
                          : kPrimaryColorDarkMode
                          : themeMode.isLight
                          ? kPrimaryColor300LightMode
                          : kPrimaryColor300DarkMode))),
              child: Column(
                children: [
                  Text(
                    SetLocalization.of(context)!
                        .getTranslateValue("area"),
                    style: TextStyle(
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode),
                  ),
                  Row(
                    children: [
                      //Cubic meters

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: NewSession.get(
                            "language",
                            ""
                                "def") ==
                            "en"
                            ? (animationBoxController
                            .isAreaSizeChange.value
                            ? FittedBox(
                          child: animationBoxController
                              .buildAnimatedTextKit(
                              "${widget.oneApartment
                                  .squareMeters ?? 0} "
                                  "${SetLocalization.of(context)!
                                  .getTranslateValue("m2")} "),
                        )
                            : Text(
                          "${widget.oneApartment.squareMeters ??
                              0} "
                              "${SetLocalization.of(context)!
                              .getTranslateValue("m2")} ",
                          style: TextStyle(
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode),
                        ))
                            : animationBoxController
                            .isAreaSizeChange.value
                            ? FittedBox(
                          child: animationBoxController
                              .buildAnimatedTextKit(
                              " ${widget.oneApartment
                                  .squareMeters ??
                                  0} ${SetLocalization.of(
                                  context)!.getTranslateValue(
                                  "m2")}"),
                        )
                            : Text(
                          " ${widget.oneApartment.squareMeters ??
                              0} ${SetLocalization.of(context)!
                              .getTranslateValue("m2")}",
                          style: TextStyle(
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode),
                        ),
                      ),

                      Image(
                        image: const AssetImage(
                          "assets/images/apartments_images/about_apartment/area.png",
                        ),
                        width: 32,
                        height: 32,
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

