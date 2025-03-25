import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../api/advantages.dart';
import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../common_widgets/containers_widgets/container_load_widget.dart';

class AdvantagesCheckBoxWidget extends ConsumerStatefulWidget {
  const AdvantagesCheckBoxWidget({
    super.key,
  });

  @override
  ConsumerState createState() => _AdvantagesUpdateWidgetState();
}

class _AdvantagesUpdateWidgetState
    extends ConsumerState<AdvantagesCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final advantageState = ref.watch(advantagesNotifier);
    final advantageNotifier = ref.read(advantagesNotifier.notifier);

    return ContainerLoadWidget(
        isLoading: advantageState.isDataLoading,
        title:
            SetLocalization.of(context)!.getTranslateValue("select_advantages"),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            ...advantageState.advantages.map((advantage) {
              return ListTile(
                horizontalTitleGap: 2.5,
                dense: false,
                onTap: () {
                  setState(() {
                    advantageNotifier.toggleChecked(advantage.id ?? 0);
                    advantageNotifier.chooseAdvantage(advantage.id ?? 0);
                  });
                },
                leading: CheckBoxWidget(
                  advantage: advantage,
                ),
                title: AdvantageNameWidget(advantage: advantage),
                trailing: AdvantageIconWidget(advantage: advantage),
              );
            }),
          ]),
        ));
  }
}

class AdvantageNameWidget extends ConsumerWidget {
  const AdvantageNameWidget({super.key, required this.advantage});

  final Advantages advantage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      advantage.advName ?? "",
      style: TextStyle(
          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref)),
    );
  }
}

class CheckBoxWidget extends ConsumerStatefulWidget {
  const CheckBoxWidget({super.key, required this.advantage});

  final Advantages advantage;

  @override
  ConsumerState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends ConsumerState<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final advantageNotifier = ref.read(advantagesNotifier.notifier);

    return Checkbox(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.6)),
      focusColor: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      checkColor: Colors.white,
      hoverColor: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      activeColor: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      side: BorderSide(
          color:
              ref.read(themeModeNotifier.notifier).primary300Theme(ref: ref)),
      splashRadius: 20,
      value: widget.advantage.checked,
      onChanged: (value) {
        setState(() {
          advantageNotifier.toggleChecked(widget.advantage.id ?? 0);
          advantageNotifier.chooseAdvantage(widget.advantage.id ?? 0);
        });
      },
    );
  }
}

class AdvantageIconWidget extends ConsumerStatefulWidget {
  const AdvantageIconWidget({super.key, required this.advantage});

  final Advantages advantage;

  @override
  ConsumerState createState() => _AdvantageIconWidgetState();
}

class _AdvantageIconWidgetState extends ConsumerState<AdvantageIconWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.advantage.icon?.isEmpty ?? true
        ? const SizedBox(
            child: SkeletonAvatar(
                style: SkeletonAvatarStyle(width: 28, height: 28)))
        : Image.network(
            /*
            entry.icon!.startsWith("1")
                          ? "http://${entry.icon!}"
                          : entry.icon!,
          */

            widget.advantage.icon!.startsWith("1")
                ? "http://${widget.advantage.icon}"
                : widget.advantage.icon!,
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
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          );
  }
}
