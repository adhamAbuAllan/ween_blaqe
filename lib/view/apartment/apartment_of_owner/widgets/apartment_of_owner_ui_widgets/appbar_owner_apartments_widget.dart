import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/nums.dart';
import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';

class AppBarOwnerApartmentsWidget extends ConsumerStatefulWidget implements
    PreferredSizeWidget {
  const AppBarOwnerApartmentsWidget({super.key,required this
      .animationController,required this.iconColorAnimation});
final AnimationController animationController;
final  Animation<Color?> iconColorAnimation;
  @override
  ConsumerState createState() => _AppbarOwnerApartmentsWidgetState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarOwnerApartmentsWidgetState extends ConsumerState<AppBarOwnerApartmentsWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(



      backgroundColor: themeMode.isLight
          ? kPrimaryColorLightMode
          : kPrimaryColorDarkMode,
      title: Text(SetLocalization.of(context)!.getTranslateValue
        ("your_apartments"),
          style: TextStyle(
              fontSize:
              getIt<AppDimension>().isSmallScreen(context) ? 16 : null,
              color: themeMode.isLight
                  ? kTextColorLightMode
                  : kTextColorDarkMode)),
      actions: ref.read(fetchApartmentNotifier).isOwnerHaveApartments
          ? [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getIt<AppDimension>().isSmallScreen(context)
                  ? 10
                  : 8),
          child: AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, child) => IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder:
                    (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                      scale: animation, child: child);
                },
                child: Icon(
                  ref.watch(toggleOwnerButtonsNotifier).isDelete
                      ? Icons.delete
                      : Icons.edit,
                  key: ValueKey<bool>(
                      ref.watch(toggleOwnerButtonsNotifier).isDelete),
                  color:  widget.iconColorAnimation.value,
                ),
              ),
              onPressed: (){
                ref.read(toggleOwnerButtonsNotifier.notifier).toggleDeleteMode
                  (widget.animationController);
              }
            ),
          ),
        ),
      ]
          : [],
    )
    ;
  }


}

