import 'package:flutter/material.dart';

import '../../../../../api/apartments_api/apartments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/provider_controllers/providers/color_provider.dart';
class ApartmentLocatoinTextWidget extends ConsumerWidget {
  const ApartmentLocatoinTextWidget({super.key,required this.index, required
  this.apartmentsRes});
  final Apartments apartmentsRes;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "المكان: ${apartmentsRes.data?[index].city?.name ?? ""

              // data.
              } - ${apartmentsRes.data?[index].location ?? ""
              // .data

              }",
              softWrap: true,
              // textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 16,
                color:
                ref.read(themeModeNotifier.notifier).textTheme(ref: ref)
                ,
                wordSpacing: 1,
                height: 1.7,
                fontWeight: FontWeight.w300,

              ),
            ),
          ),
        ),
      ],
    );
  }
}
