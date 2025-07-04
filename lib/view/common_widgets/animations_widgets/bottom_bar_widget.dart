import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../controller/provider_controllers/providers/animation_provider.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';

class CustomBottomNavBarCarved extends ConsumerStatefulWidget {
  const CustomBottomNavBarCarved({super.key});

  @override
  ConsumerState<CustomBottomNavBarCarved> createState() =>
      _CustomBottomNavBarCarvedState();
}

class _CustomBottomNavBarCarvedState
    extends ConsumerState<CustomBottomNavBarCarved>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  final List<IconData> _icons = [Icons.home, Icons.bookmark, Icons.settings];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      _icons.length,
      (_) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 3000),
      ),
    );
    // _controllers[0].repeat();
    // _controllers[0].forward();
  }

  void _onTap(int index) {
    final previousIndex = ref.read(bottomNavProvider);
    if (previousIndex == index) {
      // If it's the same icon, animate again (repeat or restart)
      final controller = _controllers[index];
      controller.reset();
      controller.forward(); // or .repeat() if you want loop
      return;
    }

    // Otherwise: switch state and animate only the new one
    ref.read(bottomNavProvider.notifier).state = index;

    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].reverse();
      // _controllers[i].reset(); // stop all animations
    }

    final controller = _controllers[index];
    controller.forward(); // animate only the new selected icon
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(bottomNavProvider);

    return Container(
      height: 50,
      // width: 300,

      // margin: const EdgeInsets.only(left: 70,),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 12, offset: Offset(0, -2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 50,
        children: List.generate(_icons.length, (index) {
          final controller = _controllers[index];
          final isActive = currentIndex == index;

          return GestureDetector(
            onTap: () => _onTap(index),
            child: Animate(
              controller: controller,
              autoPlay: false,
              effects: [
                Effect(duration: 2250.ms),
                Effect(delay: 750.ms, duration: 1500.ms),
                ScaleEffect(end: const Offset(1, 1), curve: Curves.easeOutBack),
                MoveEffect(end: Offset(0, -5)),
                ElevationEffect(
                    end: _controllers[index].isForwardOrCompleted ? 30 : 0),
              ],
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isActive ? Colors.blue.shade50 : Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  _icons[index],
                  color:isActive ? Colors.blue : Colors.grey,
                  // color: isActive
                  //     ? ref
                  //         .read(themeModeNotifier.notifier)
                  //         .primaryTheme(ref: ref)
                  //     : Colors.grey,
                  size: 30,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }
}
