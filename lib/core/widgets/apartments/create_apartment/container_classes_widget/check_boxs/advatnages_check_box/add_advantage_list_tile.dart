import 'package:flutter/material.dart';
// import 'package:skeletons/skeletons.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';

import '../../../../../../../api/advantages.dart';
import '../../../../../../../constants/nums.dart';
class AddAdvantageListTile extends StatefulWidget {
  const AddAdvantageListTile({super.key,
     this.advantages
  });
  final List<Advantages>? advantages;
  @override
  State<AddAdvantageListTile> createState() => _AddAdvantageListTileState();
}

class _AddAdvantageListTileState extends State<AddAdvantageListTile> {

  @override
  Widget build(BuildContext context) {
    return Column(
    children: _advantageItemsWidget(advantages:widget.advantages )
        .toList()
        // .take(10)
        // .toList(),
    );
  }
  Iterable<Padding> _advantageItemsWidget({List<Advantages>? advantages}) {
    return advantages?.map((entry) {
      return Padding(

        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: ListTile(
          leading: const Icon(Icons.ac_unit),
          title: Text(entry.advName?? "",
              style: TextStyle(
                  
                  fontSize: 16,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode)),
          // trailing: entry.icon!.isEmpty
          //     ? const SizedBox(
          //     child: SkeletonAvatar(
          //         style: SkeletonAvatarStyle(width: 28, height: 28)))
          //     : Image.network(
          //   entry.icon??,
          //   height: 30,
          //   width: 30,
          //   errorBuilder: (context, error, stackTrace) {
          //     return const SizedBox(
          //         child: SkeletonAvatar(
          //             style: SkeletonAvatarStyle(
          //               width: 28,
          //               height: 28,
          //             )));
          //   },
          //   color: themeMode.isDark
          //       ? kTextColorLightMode
          //       : kTextColorDarkMode,
          // ),
        ),
      );
    }) ??
        [].map((e) => const Padding(
          padding: EdgeInsets.all(0),
          child: SizedBox(),
        ));
  }

}
/*
  Iterable<Padding> _advantageItemsWidget({List<Advantages>? advantages}) {
    return advantages?.map((entry) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: ListTile(
              title: Text(entry.advName,
                  style: TextStyle(
                      
                      fontSize: 16,
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode)),
              trailing: entry.icon.isEmpty
                  ? const SizedBox(
                      child: SkeletonAvatar(
                          style: SkeletonAvatarStyle(width: 28, height: 28)))
                  : Image.network(
                      entry.icon,
                      height: 30,
                      width: 30,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                            child: SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                          width: 28,
                          height: 28,
                        )));
                      },
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
            ),
          );
        }) ??
        [].map((e) => const Padding(
              padding: EdgeInsets.all(0),
              child: SizedBox(),
            ));
  }

 */
