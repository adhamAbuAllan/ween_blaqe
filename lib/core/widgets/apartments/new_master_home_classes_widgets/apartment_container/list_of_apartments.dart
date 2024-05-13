import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/whole_widgets_class_widget.dart';

class ApartmentList extends StatelessWidget {
  const ApartmentList({super.key,required this.apartmentsRes,required this.scrollController,});
  final OneApartment apartmentsRes;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      shrinkWrap: true,
      // addAutomaticKeepAlives: true,
      //   clipBehavior: Clip.antiAliasWithSaveLayer,

        // addRepaintBoundaries: true,
        // addSemanticIndexes: true,
        // cacheExtent: 2,
// findChildIndexCallback: (key) {
//         print("yes you do that !");
// },
//     reverse: true,
      physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
      controller: scrollController,

        itemCount: apartmentsRes.data?.length,
        itemBuilder:(ctx,index){
        if(apartmentsRes.data?[index].type?.name.isEmpty??false ){
          return const SizedBox();
        }
        if(apartmentsRes.data?[index].photos?.isEmpty??true  ){
          return const SizedBox();
        }

       return  WholeWidgetOfApartment(index: index,apartmentsRes: apartmentsRes,);} );
  }
}
