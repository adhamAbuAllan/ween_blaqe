import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/nums.dart';

class ShowAllAdvantagesWidget extends ConsumerWidget {
  const ShowAllAdvantagesWidget({super.key,
  this.oneApartment
  });
final DataOfOneApartment ? oneApartment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final features = oneApartment?.advantages ?? [];
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 0),
      itemCount: features.length,
      itemBuilder: (context, index) {
        return ListTile(
          title:features[index].advName?.isNotEmpty??true ? Text(features[index].advName??"",
              style: TextStyle(
                  fontSize: getIt<AppDimension>().isSmallScreen(context)
                      ? 15
                      : 16,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode)):
          const SizedBox(
              child: SkeletonLine(
                  style: SkeletonLineStyle(width: 50, height: 10)))
          ,
          trailing:features[index].icon?.isEmpty ?? false
              ? const SizedBox(
              child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(width: 28, height: 28)))
              : Image.network(
            features[index].icon??"",
            height: getIt<AppDimension>().isSmallScreen(context) ? 26 : 30,
            width: getIt<AppDimension>().isSmallScreen(context) ? 26 : 30,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                  child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: 28,
                        height: 28,
                      )));
            },
            color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
          ),
        );
      },
    );
  }
}
