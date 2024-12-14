import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../../api/advantages.dart';
import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/nums.dart';
import '../../../../../common_widgets/containers_widgets/container_load_widget.dart';

class AdvantagesUpdateWidget extends ConsumerStatefulWidget {
  const AdvantagesUpdateWidget({super.key, required this.alreadyAdv});
  final List<Advantages> alreadyAdv;
  @override
  ConsumerState createState() => _AdvantagesUpdateWidgetState();
}

class _AdvantagesUpdateWidgetState extends ConsumerState<AdvantagesUpdateWidget> {
  @override
  Widget build(BuildContext context) {
    final advantageState = ref.watch(advantagesNotifer);
    final advantageNotifier = ref.read(advantagesNotifer.notifier);

    return ContainerLoadWidget(
        isLoading:advantageState.isDataLoading ,
        title:  SetLocalization.of(context)!
            .getTranslateValue("select_advantages"),
        childWidget:  Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children:
            advantageState.advantages.map((advantage) {
              return
                ListTile(
                horizontalTitleGap: 2.5,
                dense: false,
                onTap: () {
                  setState(() {
                    advantageNotifier.toggleChecked(advantage.id!);
                    advantageNotifier.chooseAdvantage(advantage.id!);
                  });

                },
                leading: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(2.6)),
                  focusColor: themeMode.isLight
                      ? kPrimaryColorLightMode
                      : kPrimaryColorDarkMode,
                  checkColor: Colors.white,
                  hoverColor: themeMode.isLight
                      ? kPrimaryColorLightMode
                      : kPrimaryColorDarkMode,
                  activeColor: themeMode.isLight
                      ? kPrimaryColorLightMode
                      : kPrimaryColorDarkMode,
                  side: BorderSide(
                      color: themeMode.isLight
                          ? kPrimaryColor300LightMode
                          : kPrimaryColor300DarkMode),
                  splashRadius: 20,
                  value: advantage.checked,
                  onChanged: (value) {
                    setState(() {
                      advantageNotifier.toggleChecked(advantage.id!);
                      advantageNotifier.chooseAdvantage(advantage.id!);
                    });

                  },
                ),
                title: Text(advantage.advName ?? "",
                  style: TextStyle(fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 :
                  16, color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode),
                ),
                trailing: advantage.icon?.isEmpty ?? true
                    ? const SizedBox(
                    child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(width: 28, height: 28)))
                    : Image.network(
                  advantage.icon!,
                  height: getIt<AppDimension>().isSmallScreen(context)
                      ? 26
                      : 30,
                  width: getIt<AppDimension>().isSmallScreen(context)
                      ? 26
                      : 30,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                        child: SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: 28,
                              height: 28,
                            )));
                  },
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                ),
              );
            }).toList(),
          ),
        ));
  }
}

// class AdvantagesUpdateWidget extends ConsumerWidget {
//   final List<Advantages> alreadyAdv;
//
//   const AdvantagesUpdateWidget({super.key, required this.alreadyAdv});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final advantageState = ref.watch(advantagesNotifer);
//     final advantageNotifier = ref.read(advantagesNotifer.notifier);
//
//     return ContainerLoadWidget(
//       isLoading:advantageState.isDataLoading ,
//       title:  SetLocalization.of(context)!
//           .getTranslateValue("select_advantages"),
//         childWidget:  Container(
//       margin: const EdgeInsets.all(10),
//       child: Column(
//         children: [
//           // Advantages List
//           ...advantageState.advantages.map((advantage) {
//             return ListTile(
//               horizontalTitleGap: 2.5,
//               dense: false,
//               onTap: () {
//
//                 advantageNotifier.toggleChecked(advantage.id!);
//                 advantageNotifier.chooseAdvantage(advantage.id!);
//                 },
//               leading: Checkbox(
//                 shape: RoundedRectangleBorder(
//                     borderRadius:
//                     BorderRadius.circular(2.6)),
//                 focusColor: themeMode.isLight
//                     ? kPrimaryColorLightMode
//                     : kPrimaryColorDarkMode,
//                 checkColor: Colors.white,
//                 hoverColor: themeMode.isLight
//                     ? kPrimaryColorLightMode
//                     : kPrimaryColorDarkMode,
//                 activeColor: themeMode.isLight
//                     ? kPrimaryColorLightMode
//                     : kPrimaryColorDarkMode,
//                 side: BorderSide(
//                     color: themeMode.isLight
//                         ? kPrimaryColor300LightMode
//                         : kPrimaryColor300DarkMode),
//                 splashRadius: 20,
//                 value: advantage.checked,
//                 onChanged: (value) {
//                   advantageNotifier.toggleChecked(advantage.id!);
//                 },
//               ),
//               title: Text(advantage.advName ?? "",
//                 style: TextStyle(fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 :
//                 16, color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode),
//               ),
//               trailing: advantage.icon?.isEmpty ?? true
//                   ? const SizedBox(
//                   child: SkeletonAvatar(
//                       style: SkeletonAvatarStyle(width: 28, height: 28)))
//                   : Image.network(
//                 advantage.icon!,
//                 height: getIt<AppDimension>().isSmallScreen(context)
//                     ? 26
//                     : 30,
//                 width: getIt<AppDimension>().isSmallScreen(context)
//                     ? 26
//                     : 30,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const SizedBox(
//                       child: SkeletonAvatar(
//                           style: SkeletonAvatarStyle(
//                             width: 28,
//                             height: 28,
//                           )));
//                 },
//                 color: themeMode.isLight
//                     ? kTextColorLightMode
//                     : kTextColorDarkMode,
//               ),
//             );
//           }),
//           // Chosen IDs
//           if (advantageState.chosen.isNotEmpty)
//             Text("Chosen: ${advantageState.chosen.join(", ")}"),
//         ],
//       ),
//     ));
//   }
// }

