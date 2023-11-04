import 'package:flutter/material.dart';

import 'skeletons_ready/order_of_owner_skeleton_ready.dart';
import 'skeletons_ready/text_skeleton_ready.dart';

class OrderSkeletonWidget extends StatelessWidget {
  const OrderSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: const SingleChildScrollView(
          child: Column(
            children: [
              TitleTextSkeletonReady(),
              RequestReservationWidgetReady(),
              ResponseReservationWidgetReady(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
