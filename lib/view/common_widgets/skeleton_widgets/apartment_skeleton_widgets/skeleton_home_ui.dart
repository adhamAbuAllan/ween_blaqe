import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/view/common_widgets/skeleton_widgets/apartment_skeleton_widgets/skeleton_apartment_list_widget.dart';

import '../../../../controller/provider_controllers/providers/color_provider.dart';
import 'skeleton_city_widget.dart';
class SkeletonHomeUi extends ConsumerStatefulWidget {
  const SkeletonHomeUi({super.key,this.hasCitiesBar, this.scrollController});
  final bool? hasCitiesBar;
  final ScrollController? scrollController;

  @override
  ConsumerState createState() => _HomeSkeletonWidgetState();
}

class _HomeSkeletonWidgetState extends ConsumerState<SkeletonHomeUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        backgroundColor:ref.read(themeModeNotifier.notifier)
            .backgroundAppTheme(ref: ref),
        body: SingleChildScrollView(
          controller: widget.scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              widget.hasCitiesBar ?? false
                  ? const Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //cities skeleton
                  SkeletonCityWidget(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
                  : const SizedBox(),

              const SkeletonApartmentListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
