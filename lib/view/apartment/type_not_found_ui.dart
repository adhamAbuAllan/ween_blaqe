import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/nums.dart';
import 'widgets/not_found_type_widgets/button_not_found_widget.dart';
import 'widgets/not_found_type_widgets/image_not_found_widget.dart';
import 'widgets/not_found_type_widgets/title_screen_wdiget.dart';

class TypeNotFoundUi extends ConsumerWidget {
  const TypeNotFoundUi({super.key, this.type});

  final String? type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TitleNotFoundWidget(),
                ImageNotFoundWidget(),
                ButtonNotFoundWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}