import 'package:flutter/material.dart';
import 'custom_floating_action_button.dart';
import 'floaw_menu_delegate.dart';

Flow customFlow({
  required Animation<double> menuAnimation,
  required List<IconData> menuItems,
  required IconData lastIconClicked,
  required AnimationController menuAnimationController,
  // required IconData icon,
}) {
  return Flow(
    delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
    children: menuItems
        .map<Widget>((IconData icon) => Padding(
              padding: const EdgeInsets.all(7),
              child: CustomFlatingActoinButton(
                icon: icon,
                menuAnimation: menuAnimationController,
                lastIconClicked: lastIconClicked,
              ),
            ))
        .toList(),
  );
}
