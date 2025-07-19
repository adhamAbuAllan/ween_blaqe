// lib/animations/animate_factory.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'dart:math';

/// Factory that builds a repeated Animate instance with default timing.
///
/// You must pass the [child] widget (usually a container).

Animate buildAnimatedWidget( {
  required Widget child,
  Duration totalDuration = const Duration(milliseconds: 1125),
  Duration effectDelay = const Duration(milliseconds: 375),
  Duration effectDuration = const Duration(milliseconds: 750),
}) {
  return child
      .animate()
      .effect(duration: totalDuration) // Pads out the duration
      .effect(delay: effectDelay, duration: effectDuration); // Default effect timing
}


// file: build_animation_widget.dart



enum SlideDirection { x, y, xy }

class FadeInOnVisible extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration? delay;

  const FadeInOnVisible({
    super.key,
    required this.child,
    this.direction = SlideDirection.xy,
    this.delay,
  });

  @override
  State<FadeInOnVisible> createState() => _FadeInOnVisibleState();
}

class _FadeInOnVisibleState extends State<FadeInOnVisible> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? UniqueKey(),
      onVisibilityChanged: (info) {
        if (!_visible && info.visibleFraction > .5) {
          setState(() => _visible = true);
        }
      },
      child: _visible
          ? _animatedWidget(widget.child)
          : Opacity(opacity: 0, child: widget.child),
    );
  }

  Widget _animatedWidget(Widget child) {
    final animate = child.animate().fadeIn(duration: 700.ms,delay:widget
        .delay );

    switch (widget.direction) {
      case SlideDirection.x:
        return animate.slideX(duration: 700.ms, curve: Curves.easeOutCubic);
      case SlideDirection.y:
        return animate.slideY(duration: 700.ms, curve: Curves.easeOutCubic);
      case SlideDirection.xy:
        return animate.slide(duration: 700.ms, curve: Curves.easeOutCubic);
    }
  }
}



class AnimateEffects {
  static Widget fadeTintBlurScale({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return child
        .animate()
        .fadeIn(curve: Curves.easeOutCirc, duration: duration)
        .untint(color: Colors.white)
        .blurXY(begin: 16)
        .scaleXY(begin: 1.5);
  }

  static Widget fadeBlurSlide({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1200),
    Duration delay = const Duration(milliseconds: 0),
  }) {
    return child
        .animate()
        .fadeIn(curve: Curves.easeOutExpo, duration: duration,delay: delay)
        .blurY(begin: 32)
        .slideY(begin: -0.4, end: 0.4);
  }

  static Widget shimmerFlip({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    return child
        .animate()
        .shimmer(angle: -pi / 2, size: 3, curve: Curves.easeOutCubic, duration: duration)
        .elevation(begin: 24, end: 2)
        .flip();
  }

  static Widget shakeSlideTint({
    required Widget child,
    Duration duration = const Duration(milliseconds: 800),
  }) {
    return child
        .animate()
        .shake(curve: Curves.easeInOutCubic, hz: 3, duration: duration)
        .scaleXY(begin: 0.8)
        .tint(color: Colors.red, end: 0.6);
  }

  static Widget slideFlipTintScale({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    return child
        .animate()
        .slideX(begin: 1, duration: duration)
        .flipH(begin: -1, alignment: Alignment.centerRight)
        .scaleXY(begin: 0.75, curve: Curves.easeInOutQuad)
        .untint(begin: 0.6);
  }

  static Widget shimmerRotate({
    required Widget child,
    Duration delay = const Duration(milliseconds: 0),

    Duration duration = const Duration(milliseconds: 1200,),
  }) {
    return child
        .animate()
        .shimmer(
      blendMode: BlendMode.dstIn,
      angle: pi / 4,
      size: 3,
      curve: Curves.easeInOutCirc,
      duration: duration,
      delay: delay,
    )
        .rotate(begin: -pi / 12);
  }

  static Widget shimmer({
    required Widget child,
    Duration delay = const Duration(milliseconds: 0),

    Duration duration = const Duration(milliseconds: 5500),
    Curve curve = Curves.easeInOut,
    double angle = (pi * pi )/4,
    double size = 2,
    BlendMode blendMode = BlendMode.plus,
  }) {
    return child.animate(onPlay: (controller) => controller.repeat()).shimmer(
      duration: duration,
      curve: curve,
      angle: angle,
      size: size,
      blendMode: blendMode,
      delay: delay
    );
  }
}