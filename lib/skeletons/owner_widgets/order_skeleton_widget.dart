import 'package:flutter/material.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/order_of_owner_skeleton_ready.dart';
import 'package:ween_blaqe/skeletons/owner_widgets/skeletons_ready/text_skeleton_ready.dart';
class OrderSkeletonWidget extends StatelessWidget {
  const OrderSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              TitleTextSkeletonReady(),
              RequestReservationWidgetReady(),
              ResponseReservationWidgetReady(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
