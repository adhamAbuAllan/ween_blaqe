// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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
//             style: TextStyle(fontFamily: 'IBM', fontSize:16,color: Colors.grey.shade800),
//           ),
//           Expanded(child: Text("")),
//           Image(image: AssetImage(icon),width: 32,height: 32,)
//         ],),
//       );
//
//   }
// }
class AddAdvantages extends StatefulWidget {
  const AddAdvantages({Key? key}) : super(key: key);

  @override
  State<AddAdvantages> createState() => _AddAdvantagesState();
}

class Feature{
  int id;
  String name;
  String icon;
  bool checked = false;
  Feature({required this.id,required this.name,required this.icon,this.checked=false});
}
class _AddAdvantagesState extends State<AddAdvantages> {

  List<Feature> features = [];
  List<int> chosen = [];
  @override
  void initState() {
    super.initState();
    features.add(Feature(id: 1, name: "كاميرات مرافبة", icon: "assets/images/apartments_images/advantages/casino-cctv.png",checked: false));
    features.add(Feature(id: 2, name: "كاميرات مراقبة داخلية", icon: "assets/images/apartments_images/advantages/cctv.png"));
    features.add(Feature(id: 3, name: "ادوات مطبخ", icon: "assets/images/apartments_images/advantages/cutlery1.png"));
    features.add(Feature(id: 4, name: "مكتب", icon: "assets/images/apartments_images/advantages/desktop.png"));
    features.add(Feature(id: 5, name: "غسلة صحون", icon: "assets/images/apartments_images/advantages/dishes-washer.png"));
  }

  @override
  Widget build(BuildContext context) {

    return  Column(
        children: features.map((feature){
          return Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.6)),
                  focusColor: Colors.orange,
                  checkColor: Colors.white,
                  hoverColor: Colors.orange,
                  activeColor: Colors.orange,
                  side: BorderSide(color: Colors.orange.shade300),
                  splashRadius: 20,
                  // autofocus: false,
                  // tristate: true,
                  overlayColor: MaterialStateProperty.all(Colors.orange),

                  value: feature.checked, onChanged: (a){
                if(a!=null) {

                  setState(() {
                    feature.checked = a;
                    // _isTapped = feature.checked;
                    // feature.checked = _isTapped;



                  });
                  if(feature.checked == true){
                    chosen.add(feature.id);
                  }else{
                    var index = chosen.indexOf(feature.id);
                    chosen.removeAt(index);
                  }
                }
              }),
              Text(feature.name,
                style: TextStyle(fontFamily: 'IBM',fontSize: 16,color: Colors.grey.shade800),
              ),
              const Expanded(child: Text("") ),
              Image( image: AssetImage(feature.icon),width: 30,height: 30,)
            ],
          );
        }).toList(),
    );
  }
}