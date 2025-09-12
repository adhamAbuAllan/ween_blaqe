import 'package:flutter/material.dart';
import 'build_animation_widget.dart';

/// A small wrapper that provides a fading animation for AppBar instances.
/// Use just like an [AppBar] but as [FadeAppBar(...)] which returns a
/// [PreferredSizeWidget]. It uses the project's existing [FadeInOnVisible]
/// animation helper.
class FadeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double elevation;

  const FadeAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.leading,
    this.bottom,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInOnVisible(
      // App bars are part of the scaffold layout, they should animate even
      // when there is scrolling in the body, so opt out of the visibility
      // detector's scroll gating by setting isUIHaveScroll to false.
      isUIHaveScroll: false,
      child: AppBar(
        backgroundColor: backgroundColor,
        title: title,
        actions: actions,
        leading: leading,
        bottom: bottom,
        elevation: elevation,
      ),
    );
  }

  @override
  Size get preferredSize => bottom != null
      ? Size.fromHeight(kToolbarHeight + bottom!.preferredSize.height)
      : const Size.fromHeight(kToolbarHeight);
}
