import 'package:flutter/material.dart';
class CustomFlatingActoinButton extends StatefulWidget {
   CustomFlatingActoinButton({super.key, required this.icon,required this.menuAnimation,required this.lastIconClicked});
  final IconData icon;
  IconData lastIconClicked;
  late AnimationController menuAnimation;

  @override
  State<CustomFlatingActoinButton> createState() => _CustomFlatingActoinButtonState();
}

class _CustomFlatingActoinButtonState extends State<CustomFlatingActoinButton> {


  _CustomFlatingActoinButtonState();
  @override
  Widget build(BuildContext context) {
    return customFloatingActoinButton(icon: widget.icon,lastIconClicked:widget.lastIconClicked, menuAnimation: widget.menuAnimation,);
  }
  FloatingActionButton customFloatingActoinButton(
      {required IconData icon, required IconData lastIconClicked,   required AnimationController menuAnimation
      }) {
    return FloatingActionButton(
                backgroundColor:
                    widget.lastIconClicked == icon ? Colors.orange : Colors.grey,
                splashColor: Colors.orange,
                onPressed: () {
                  if (icon != Icons.menu) {
                    setState(() => lastIconClicked = icon);
                    debugPrint("the Icon is : $widget.icon");
                  }
                  setState(() {
                    menuAnimation.status == AnimationStatus.completed
                        ? menuAnimation.reverse()
                        : menuAnimation.forward();
                    debugPrint(
                        "the menuAnimation is : ${menuAnimation.status}");
                  });
                },
                child: Icon(icon),
              );
  }
}
