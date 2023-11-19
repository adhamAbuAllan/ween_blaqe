import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

class ApartmentTypeText extends StatefulWidget {
 const ApartmentTypeText({super.key, required this.index, required this.apartmentsRes});
  final OneApartment apartmentsRes;
  final int index;

  @override
  State<ApartmentTypeText> createState() => _ApartmentTypeTextState();
}

class _ApartmentTypeTextState extends State<ApartmentTypeText> {
  @override
  Widget build(BuildContext context) {
    return           Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            " سكن :${widget.apartmentsRes.data?[widget.index].type ?? ""}",
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'IBM',
                color: Colors.black.withOpacity(.9)),
          ),
        ),
        const Expanded(child: Text("")),
        // Padding(
        //     padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //     child:
        //     // clicked
        //     //     ?
        //     isCodeActive
        //         ? IconButton(
        //         onPressed: () {
        //           setState(() {
        //             clicked = !clicked;
        //           });
        //         },
        //         icon: Icon(
        //           clicked
        //               ? Icons.bookmark
        //               : Icons.bookmark_outline,
        //           size: 28,
        //         ))
        //         : const SizedBox()
        //   // : IconButton(
        //   //     onPressed: () {
        //   //       setState(() {
        //   //         clicked = !clicked;
        //   //       });
        //   //     },
        //   //     icon: const Icon(
        //   //       Icons.bookmark,
        //   //       size: 28,
        //   //     )),
        // ),
      ],
    );
  }
}
