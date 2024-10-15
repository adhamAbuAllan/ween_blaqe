import 'package:flutter/material.dart';

// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/widgets/apartments/home_screen/bar_cities.dart';

// import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/whole_widgets_class_widget.dart';

class ApartmentsList extends StatefulWidget {
  const ApartmentsList(
      {super.key,
      required this.apartmentsRes,
      this.scrollController,
      this.isDeleteMode = false,
      this.onPressed,
      this.onClick,
      required this.haveCitiesBar,
      });

  final OneApartment apartmentsRes;
  final ScrollController? scrollController;
  final bool isDeleteMode;
  final Function()? onClick;
  final void Function()? onPressed;
  final bool haveCitiesBar;

  @override
  State<ApartmentsList> createState() => _ApartmentsListState();
}

class _ApartmentsListState extends State<ApartmentsList> {
  @override
  void initState() {
    super.initState();
    if (apartmentModelController.apartment.data?.isNotEmpty ?? false) {
      connectivityController.isSnackBarShow.value = false; // that if false,
      // the snack bar will show
    }
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast),
      controller: widget.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: widget.haveCitiesBar
              ? SizedBox(
                  height: 70,
                  child: CitiesBar(
                    onClick: widget.onClick,
                  ))
              : const SizedBox(
                  height: 10,
                ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return RepaintBoundary(
                child: WholeWidgetOfApartment(
                  index: index,
                  apartmentsRes: widget.apartmentsRes,
                  isDarkMode: widget.isDeleteMode,
                  onPressed: widget.onPressed,
                ),
              );
            },
            childCount: widget.apartmentsRes.data?.length,
          ),
        ),
      ],
    );
//// a list of apartment without cities bar
//       ListView.builder(
//
//       shrinkWrap: true,
//       // addAutomaticKeepAlives: true,
//       //   clipBehavior: Clip.antiAliasWithSaveLayer,
//
//         // addRepaintBoundaries: true,
//         // addSemanticIndexes: true,
//         // cacheExtent: 2,
// // findChildIndexCallback: (key) {
// //         print("yes you do that !");
// // },
// //     reverse: true,
//       physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
//       controller: scrollController,
//
//         itemCount: apartmentsRes.data?.length,
//         itemBuilder:(ctx,index){
//         if(apartmentsRes.data?[index].type?.name.isEmpty??false ){
//           return const SizedBox();
//         }
//         if(apartmentsRes.data?[index].photos?.isEmpty??true  ){
//           return const SizedBox();
//         }
//
//        return  WholeWidgetOfApartment(index: index,apartmentsRes:
//        apartmentsRes,isDarkMode: isDeleteMode,onPressed: onPressed,);}
//     );
  }
}
