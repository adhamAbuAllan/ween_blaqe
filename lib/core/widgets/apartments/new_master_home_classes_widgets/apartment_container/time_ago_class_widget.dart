import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../api/apartments_api/one_apartment.dart';
class TimeAgoWidget extends StatefulWidget {
  const TimeAgoWidget(
      {super.key, required this.apartmentsRes, required this.index});

  final Apartments apartmentsRes;
  final int index;

  @override
  State<TimeAgoWidget> createState() => _TimeAgoWidgetState();
}

class _TimeAgoWidgetState extends State<TimeAgoWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: 5,
      child: ClipRRect(
        // Add ClipRRect
        borderRadius: BorderRadius.circular(1.7),
        child: BackdropFilter(
          // Add BackdropFilter
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          // Adjust blur intensity
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(1.7),
            ),
            child: Text(
              "${widget.apartmentsRes.data?[widget.index].timeAgo ?? "التاريخ"} ",
              style: TextStyle(
                color: Colors.grey.shade300,
                
                fontSize: 14,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 2,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
