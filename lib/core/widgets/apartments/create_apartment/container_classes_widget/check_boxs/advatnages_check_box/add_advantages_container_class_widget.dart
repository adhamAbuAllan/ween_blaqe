// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';

import '../../../../../../../api/advantages.dart';
import '../../../../../../../constants/nums.dart';
import 'feature_of_advatnages.dart';

String msg = "";

class AddAdvantages extends StatefulWidget {
  const AddAdvantages({Key? key}) : super(key: key);

  @override
  State<AddAdvantages> createState() => _AddAdvantagesState();
}

class _AddAdvantagesState extends State<AddAdvantages> {
  var turnOnLocalFeatures = false;

  List<Advantages> advantages = [];
  Advantages? advantage;

  bool checked = false;
  List<FeatureOfAdvantagesCheckBox> features = [];
  List<AdvantageRes> allFeatures = [];
  List<int> featuresChosen = [];

  List<int> chosen = [];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await go();
    });
    features.add(FeatureOfAdvantagesCheckBox(
      id: 1,
      name: "كاميرات مراقبة",
      icon: "assets/images/apartments_images/advantages/casino-cctv.png",
    ));
    features.add(FeatureOfAdvantagesCheckBox(
      id: 2,
      name: "كاميرات مراقبة داخلية",
      icon: "assets/images/apartments_images/advantages/cctv.png",
    ));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 3,
        name: "ادوات مطبخ",
        icon: "assets/images/apartments_images/advantages/cutlery1.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 4,
        name: "مكتب",
        icon: "assets/images/apartments_images/advantages/desktop.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 5,
        name: "غسلة صحون",
        icon: "assets/images/apartments_images/advantages/dishes-washer.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 7,
        name: "طفاية",
        icon:
            "assets/images/apartments_images/advantages/fire-extinguisher.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 8,
        name: "إسعافات أولية",
        icon: "assets/images/apartments_images/advantages/first-aid-box.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 9,
        name: "غاز",
        icon: "assets/images/apartments_images/advantages/gas-stove.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 10,
        name: "مياه ساخنة",
        icon: "assets/images/apartments_images/advantages/hot-water.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 11,
        name: "مطبخ",
        icon: "assets/images/apartments_images/advantages/kitchen-set.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 12,
        name: "ميكرويف",
        icon: "assets/images/apartments_images/advantages/microwave.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 13,
        name: "فرن",
        icon: "assets/images/apartments_images/advantages/oven.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 14,
        name: "أدوات مطبخ",
        icon: "assets/images/apartments_images/advantages/plate.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 15,
        name: "ثلاجة",
        icon: "assets/images/apartments_images/advantages/refrigerator-.png",
        checked: checked));
    features.add(FeatureOfAdvantagesCheckBox(
        id: 15,
        name: "واي فاي",
        icon: "assets/images/apartments_images/advantages/wifi.png",
        checked: checked));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children:
              // turnOnLocalFeatures == true ?
              features.map((feature) {
        return Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.6)),
          focusColor:  themeMode.isDark ?kPrimaryColorLightMode: kPrimaryColorDarkMode,
                checkColor: Colors.white,
                hoverColor: themeMode.isDark ?kPrimaryColorLightMode: kPrimaryColorDarkMode,
                activeColor: themeMode.isDark ?kPrimaryColorLightMode: kPrimaryColorDarkMode,
              side:  BorderSide(color:themeMode.isDark  ?kPrimaryColor300LightMode: kPrimaryColor300DarkMode),
                splashRadius: 20,
                // autofocus: false,
                // tristate: true,
                // overlayColor: MaterialStateProperty.all(kPrimaryColor),
                value: feature.checked,
                onChanged: (a) {
                  // features.first;
                  if (a != null) {
                    setState(() {
                      // advantage?.checkedId == 1 ? a: a;
                      feature.checked = a;

                      // feature.checked = a;
                      // _isTapped = feature.checked;
                      // feature.checked = _isTapped;
                    });
                    if (checked == true) {
                      chosen.add(feature.id);
                      // chosen.add(advantage?.id??1);
                    } else {
                      var index = chosen.indexOf(feature.id);
                      chosen.removeAt(index + 1);
                    }
                  } else {
                    debugPrint(
                        "you input null values check you database or and check url is ture or not !");
                  }
                }),
            Text(
              feature.name,
              // feature.advName,
              style: TextStyle(
                  fontFamily: 'IBM', fontSize: 16, color: Colors.grey.shade800),
            ),
            const Expanded(child: Text("")),
            Image(
              image: AssetImage(feature.icon),
              width: 30,
              height: 30,
            )
          ],
        );
      }).toList()),
    );
  }

  go() async {
    setState(() {
      advantages.clear();
    });
    var url = Uri.parse('http://10.0.2.2:8000/api/advantages/all');
    // var response = await http.post(url,body:{"adv_name": "apartment",
    //   // "icon":"assets/images/apartments_images/apartment.jpg"
    // });
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    var data = json["data"] as List<dynamic>;
    advantages.clear();
    for (var value in data) {
      advantages.add(Advantages(
          id: value['id'],
          advName: value['adv_name'],
          icon: value['icon'],
          // checkedId: value['checked_id']
      ));
      debugPrint("this is data :$data");
      setState(() {
        advantages.first;
        if (checked == false) {
          value['checked_id'] = 0;

          // data[4] = 0;
        } else {
          value['checked_id'] = 1;
          debugPrint("$checked");
        }
      });
    }
  }

  goInsert(String name) async {
    var url = Uri.parse(ServerLocalDiv.advantagesAdd);

    var response = await http.post(url, body: {
      "adv_name": name,
    });
    var json = jsonDecode(response.body);
    var data = json["data"] as List<dynamic>;
    for (var value in data) {
      advantages.add(Advantages(
          id: value['id'],
          advName: value['adv_name'],
          icon: value['icon'],
          // checkedId: value['checked_id']
      ));
      setState(() {
        advantages.first;
        // advantages = chosen;
        if (checked == false) {
          // data[4] = 0;
        } else {}
      });
    }
  }
}
//
// print(currentType?.productName??"");
// print(currentArea?.name??"");
// focusNodeOfFullName;
// FocusScope.of(context).requestFocus();
// :
//
// allFeatures.map((feature){
//   return
//     Row(
//       // mainAxisAlignment: MainAxisAlignment.spaceAround,
//       // mainAxisSize: MainAxisSize.min,
//       children: [d
//         Checkbox(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.6)),
//             focusColor: kPrimaryColor,
//             checkColor: Colors.white,
//             hoverColor: kPrimaryColor,
//             activeColor: kPrimaryColor,
//             side: BorderSide(color: kPrimaryColor300),
//             splashRadius: 20,
//             // autofocus: false,
//             // tristate: true,
//             // overlayColor: MaterialStateProperty.all(kPrimaryColor),
//             value:if( feature.data.checkedId == 0){
//               return false;
//   }, onChanged: (a){
//           // features.first;
//           if(a!=null) {
//             setState(() {
//               // advantage?.checkedId == 1 ? a: a;
//               feature.checked = a;
//
//               // feature.checked = a;
//               // _isTapped = feature.checked;
//               // feature.checked = _isTapped;
//             });
//             if(checked == true){
//               chosen.add(feature.id);
//               // chosen.add(advantage?.id??1);
//             }else{
//               var index = chosen.indexOf(feature.id);
//               chosen.removeAt(index);
//             }
//           }else{
//             print("you input null values check you database or and check url is ture or not !");
//           }
//         }),
//         Text(
//           feature.name,
//           // feature.advName,
//           style: TextStyle(fontFamily: 'IBM',fontSize: 16,color: Colors.grey.shade800),
//         ),
//         const Expanded(child: Text("") ),
//         Image( image: AssetImage(feature.icon),width: 30,height: 30,)
//       ],
//     );
// }).toList(),
// if(response.body.isEmpty){
//   print('they body is empty');
// }else{
//   print('they body is NotEmpty');
//
// }
// var res = AdvantageRes.fromJson(json);
// if(res.status==false){
//   setState(() {
//     msg = res.msg;
//     print("status is false : $msg");
//   });
//
// }else{
//   setState(() {
//     msg = "";
//     print("status is true :$msg");
//   });
// }
//
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
//
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
//             style: TextStyle(fontFamily: 'IBM', fontSize:16,color: Colors.grey.shade800),
//           ),
//           Expanded(child: Text("")),
//           Image(image: AssetImage(icon),width: 32,height: 32,)
//         ],),
//       );
//
//   }
// }