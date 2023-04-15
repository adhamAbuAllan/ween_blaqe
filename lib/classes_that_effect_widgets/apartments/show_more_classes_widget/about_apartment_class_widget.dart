import 'package:flutter/material.dart';
import '../../../styles/show_more_widget/about_apartment_style.dart';

class AboutApartment extends StatelessWidget {
  AboutApartment(
      {Key? key, required this.title, required this.image, required this.value})
      : super(key: key);
  String title;
  String image;
  int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 80,
        height: 80,
        child: OutlinedButton(
          onPressed: null,
          style: outlineBox,
          child: Column(
            children: [
              const Expanded(child: Text(""),),

              Text(
                title,
                style: const TextStyle(color: Colors.black87),
              ),
              const Expanded(
                child: Text(""),
              ),
              Row(
                children: [
                  //Cubic meters
                  const Expanded(child: Text(""),),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      "$value",
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  Image(
                    image: AssetImage(image),
                    width: 32,
                    height: 32,
                  ),
                  const Expanded(child: Text(""),),
                ],
              ),
              const Expanded(
                flex: 2,
                child: Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutApartmentSquareMeter extends StatelessWidget {
  String title;
  String image;
  int value;

  AboutApartmentSquareMeter(
      {Key? key, required this.title, required this.image, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 100,
        height: 80,
        child: OutlinedButton(
          onPressed: null,
          style: outlineBox,
          child: Column(
            children: [
              const Expanded(child: Text(""),),

              Text(
                title,
                style: const TextStyle(color: Colors.black87),
              ),
              const Expanded(
                child: Text(""),
              ),
              Row(
                children: [
                  //Cubic meters
                  const Expanded(child: Text(""),),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      "$value" "m",
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  Image(
                    image: AssetImage(image),
                    width: 32,
                    height: 32,
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              const Expanded(
                flex: 2,
                child: Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
