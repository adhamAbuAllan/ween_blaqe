import 'package:flutter/material.dart';

class ApartmentShowTypesContainer extends StatelessWidget {
  const ApartmentShowTypesContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 7,
                color: Colors.grey.shade200,
                strokeAlign: BorderSide.strokeAlignOutside),
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(7),
          ),
          height: 200,
          width: 150,
          child: child),
    );
  }
}
