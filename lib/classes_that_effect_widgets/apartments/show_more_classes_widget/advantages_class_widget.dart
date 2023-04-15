// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
class AdvantagesClassWidget extends StatefulWidget {
  const AdvantagesClassWidget({Key? key}) : super(key: key);

  @override
  State<AdvantagesClassWidget> createState() => _AdvantagesClassWidgetState();
}

class Feature{
  int id;
  String name;
  String icon;
  Feature({required this.id,required this.name,required this.icon});
}
class _AdvantagesClassWidgetState extends State<AdvantagesClassWidget> {

  List<Feature> features = [];
  List<int> chosen = [];
  @override
  void initState() {
    super.initState();
    features.add(Feature(id: 1, name: "كاميرات مرافبة", icon: "assets/images/apartments_images/advantages/casino-cctv.png"));
    features.add(Feature(id: 2, name: "كاميرات مراقبة داخلية", icon: "assets/images/apartments_images/advantages/cctv.png"));
    features.add(Feature(id: 3, name: "ادوات مطبخ", icon: "assets/images/apartments_images/advantages/cutlery1.png"));
    features.add(Feature(id: 4, name: "مكتب", icon: "assets/images/apartments_images/advantages/desktop.png"));
    features.add(Feature(id: 5, name: "غسلة صحون", icon: "assets/images/apartments_images/advantages/dishes-washer.png"));
  }

  @override
  Widget build(BuildContext context) {

    return  Column(

      children: features.map((feature){
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            children: [
              Text(feature.name,
                style: TextStyle(fontFamily: 'IBM',fontSize: 16,color: Colors.grey.shade800),
              ),
              const Expanded(child: Text("") ),
              Image( image: AssetImage(feature.icon),width: 30,height: 30,)
            ],
          ),
        );
      }).toList(),
    );
  }
}