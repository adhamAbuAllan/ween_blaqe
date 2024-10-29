import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';




class AboutApartment extends StatefulWidget {
  const AboutApartment(
      {super.key, required this.title, required this.image, required this.value});
 final String title;
  final String image;
  final int value;

  @override
  State<AboutApartment> createState() => _AboutApartmentState();
}

class _AboutApartmentState extends State<AboutApartment> {
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
                widget.title,
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
                      "${widget.value}",
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  Image(
                    image: AssetImage(widget.image),
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

class AboutApartmentSquareMeter extends StatefulWidget {
  final String title;
  final String image;
  final int value;

 const AboutApartmentSquareMeter(
      {super.key, required this.title, required this.image, required this.value});

  @override
  State<AboutApartmentSquareMeter> createState() => _AboutApartmentSquareMeterState();
}

class _AboutApartmentSquareMeterState extends State<AboutApartmentSquareMeter> {
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
                widget.title,
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
                      "${widget.value}" "m",
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  Image(
                    image: AssetImage(widget.image),
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
