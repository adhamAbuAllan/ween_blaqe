import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../../api/advantages.dart';
import '../../../core/widgets/apartments/show_more_classes_widget/advantages_class_widget.dart';
  class ShowAllAdvantages extends StatelessWidget {
  const ShowAllAdvantages({Key? key,required this.features}) : super(key: key);
  final List<Advantages> features;

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent ,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //back arrow button
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black87,
                        )),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              //all advantages in this container
              Container(
                margin: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: kContainerColor,
                ),
                child:   Column(
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(305, 0, 10, 0),
                          child: Text("المزايا",
                              style: TextStyle(
                                color: Colors.black87,
                                 fontSize: 20,
                                fontFamily: 'IBM',
                              )),
                        ),
                        Expanded(child: Text("")),
                      ],
                    ),
                    AdvantagesClassWidget(features: features,)
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
