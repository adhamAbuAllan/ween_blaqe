import 'package:flutter/material.dart';

import '../../../../../../api/photos.dart';
import '../../../../../../constants/nums.dart';
Positioned buildPointerOfImageZoom(
    {required PageController controller,
    required BuildContext context,
    required final List<Photos> imageList,
    required int current,
    required bool isPointerVisible,
      required bool isMove,

    }) {
  return Positioned(
    bottom: 20.0,
    left: 0,
    right: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageList.asMap().entries.map((entry) {
        return
          GestureDetector(
          // onTap: () {
          //   controller.animateToPage(entry.key,
          //       duration: const Duration(milliseconds: 300),
          //       curve: Curves.easeIn);
          //
          // },
          child: AnimatedOpacity(
            // alwaysIncludeSemantics: true,
            opacity: isPointerVisible ? 1.0 : 0.0,
            // ?
            curve:Curves.ease ,
            // (current == entry.key ? 0.9 : 0.4)
            duration: const Duration(milliseconds: 300),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,

              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0 / 3.5),
                shape: BoxShape.rectangle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? kPrimaryColor300
                        : kPrimaryColor)
                    .withOpacity(


                        // isPointerVisible
                        //     ? (current == entry.key ? 0.9 : 0.4)
                        //     : 0.0

                   current == entry.key ? 0.9 : 0.4
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
