import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/core/widgets/apartments/home_screen/bar_cities.dart';

// import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/whole_widgets_class_widget.dart';

class ApartmentsList extends StatefulWidget {
  const ApartmentsList(
      {super.key,
      required this.apartmentsRes,
      this.scrollController,
      this.isDeleteMode = false,
      this.onPressed,  this.onClick});

  final OneApartment apartmentsRes;
  final ScrollController? scrollController;
  final bool isDeleteMode;
  final Function() ?onClick;
  final void Function()? onPressed;

  @override
  State<ApartmentsList> createState() => _ApartmentsListState();
}

class _ApartmentsListState extends State<ApartmentsList> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
      
      controller: widget.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 70, child: CitiesBar(onClick: widget
              .onClick,)),
        ),
        SliverList(

          delegate: SliverChildBuilderDelegate(

            (context, index) {
              if (widget.apartmentsRes.data?[index].type?.name.isEmpty ?? false) {
                return const SizedBox();
              }
              if (widget.apartmentsRes.data?[index].photos?.isEmpty ?? true) {
                return const SizedBox();
              }

              return WholeWidgetOfApartment(
                index: index,
                apartmentsRes: widget.apartmentsRes,
                isDarkMode: widget.isDeleteMode,
                onPressed: widget.onPressed,
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
