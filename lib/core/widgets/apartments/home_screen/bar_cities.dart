import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';

// import '../../../../constants/nums.dart';
import '../../../../constants/nums.dart';
import '../../cities/cities_class_widget.dart';

class CitiesBar extends StatefulWidget {
  const CitiesBar({
    super.key,
    this.onClick,
  });

  final Function()? onClick;

  @override
  State<CitiesBar> createState() => _CitiesBarState();
}

class _CitiesBarState extends State<CitiesBar> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // dragStartBehavior: DragStartBehavior.down,
      // reverse: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        return Card(
          // shadowColor: ,
          // surfaceTintColor: Colors.grey,

          color: Colors.transparent,
          elevation: 0,
          child: cityModelController.isLoading.value == true
              ? const CitiesBarSkeleton()
              : Row(
                  children: cityModelController.cities
                      .map((c) => city(c, () async {
                            setState(() {
                              cityModelController.isLoading.value = true;
                            });
                            await cityModelController.getCity();
                            if (widget.onClick != null) {
                              setState(() {
                                cityModelController.cityId.value == c.id
                                    ? cityModelController.cityId.value = 0
                                    : cityModelController.cityId.value =
                                        c.id ?? 0;
                              });
                              await widget.onClick!();
                            }
                            setState(() {
                              cityModelController.isLoading.value = false;
                            });
                          },
                              style: c.id == cityModelController.cityId.value &&
                                      cityModelController.cityId.value != 0
                                  ? fullButton().copyWith(
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                              )
                      : outlinedButton(themeMode:themeMode)))
                      .toList()),
        );
      }),
    );
  }
}
