// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/view/common_widgets/containers_widgets/container_widget.dart';

import '../../../../../../../api/users.dart';
import '../../../../../../../constants/nums.dart';

import 'feature_of_check_box.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// class AddAdvantages extends StatefulWidget {
//   String advantageName;
//   String advantageIcon;
//   bool isChecked;
//    AddAdvantages({Key? key,
//     required this.advantageName,
//     required this.advantageIcon,
//      required this.isChecked
//
//   }) : super(key: key);
//
//   @override
//   State<AddAdvantages> createState() => _AddAdvantagesState();
// }

// class _AddAdvantagesState extends State<AddAdvantages> {
//   @override
//   Widget build(BuildContext context) {
//     var name = widget.advantageName;
//     var icon = widget.advantageIcon;
//     bool isChecked = widget.isChecked;
//     @override
//       Color getColor(Set<MaterialState> states) {
//         const Set<MaterialState> interactiveStates = <MaterialState>{
//           MaterialState.pressed,
//           MaterialState.hovered,
//           MaterialState.focused,
//         };
//         if (states.any(interactiveStates.contains)) {
//           return Colors.blue;
//         }
//         return Colors.red;
//       }
//
//     return
//
//       Padding(
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
//         child: Row(children: [
//           Checkbox(
//             checkColor: Colors.white,
//             fillColor: MaterialStateProperty.resolveWith(getColor),
//             value: isChecked,
//             onChanged: (bool? value) {
//               setState(() {
//                 isChecked = value!;
//               });
//             },
//           ),
//
//           Text(name,
//             style: TextStyle( fontSize:16,color: Colors.grey.shade800),
//           ),
//           Expanded(child: Text("")),
//           Image(image: AssetImage(icon),width: 32,height: 32,)
//         ],),
//       );
//
//   }
// }
class AddAcontact extends StatefulWidget {
  const AddAcontact({super.key, this.userInfo});
  final User? userInfo;

  @override
  State<AddAcontact> createState() => _AddAcontactState();
}

class _AddAcontactState extends State<AddAcontact> {
  ChangeThemeMode themeMode = Get.find();

  List<FeatureOfCheckBox> features = [];
  List<int> chosen = [];
  @override
  void initState() {
    super.initState();
    // features.add(FeatureOfCheckBox(
    //     id: 1, name: "واتساب", icon: "assets/images/whatsapp.png",data: widget.userInfo!.phone),);
    // features.add(FeatureOfCheckBox(
    //     id: 2,
    //     name: "Gmail",
    //     icon: "assets/images/gmail.png",
    //     data: widget.userInfo?.email ?? ""));
    features.add(FeatureOfCheckBox(
        id: 3,
        name: SetLocalization.of(context)!.getTranslateValue("phone"),
        icon: "assets/images/phone-call.png",
        data: "0${234
            // widget.userInfo!.phone
            }"));
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(child: Column(
      children: features.map((feature) {
        return Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.6)),
                focusColor: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
                checkColor: Colors.white,
                // hoverColor: kPrimaryColor,
                activeColor: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
                side:  BorderSide(color: themeMode.isLight ? kPrimaryColor300LightMode : kPrimaryColor300DarkMode),
                splashRadius: 20,
                // autofocus: false,
                // tristate: true,
                overlayColor: WidgetStateProperty.all(themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode),
                value: feature.checked,
                onChanged: (a) {
                  if (a != null) {
                    setState(() {
                      feature.checked = a;
                      // _isTapped = feature.checked;
                      // feature.checked = _isTapped;
                    });
                    if (feature.checked == true) {
                      if (features[1].data.isNotEmpty &&
                          features[1].data.isNotEmpty &&
                          features[1].data != "") {
                        chosen.add(features[1].id);
                      } else {
                        showSnakBar(context, "الرجاء إضافة الايميل الخاص بك");
                        myPushName(context, MyPagesRoutes.profile);
                      }
                      chosen.add(feature.id);
                    } else {
                      var index = chosen.indexOf(feature.id);
                      chosen.removeAt(index);
                    }
                    debugPrint("$chosen");
                  }
                }),
            Text(
              feature.name,
              style: TextStyle(

                  fontSize: 16,
                  color: Colors.grey.shade800),
            ),
            const Expanded(child: Text("")),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Image(
                image: AssetImage(feature.icon),
                width: 30,
                height: 30,
              ),
            )
          ],
        );
      }).toList(),
    ));
  }
}
