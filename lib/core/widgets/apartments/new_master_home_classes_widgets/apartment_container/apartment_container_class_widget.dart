import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class ApartmentContainer extends StatelessWidget {
  const ApartmentContainer({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
      // width: 373,
      /*
      this is  wrong don't add height in the container
      that will do huge error when use another screens in future
      so delete the height attribute and add the padding  widget instead
       */
      //----------
      //you should delete the height attribute and add the padding widget instead
      height: 355,
      // <- delete height attribute
      //----------
      //decoration of show apartment style
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: kContainerColor,
      ),
      child: child,
    );
  }
}
