import 'package:flutter/material.dart';

class ArrowNextImageClassWidget extends StatefulWidget {
  const ArrowNextImageClassWidget({
    super.key,
    this.onPressed,
    this.isRight,
  });

  final void Function()? onPressed;
  final bool? isRight;

  @override
  State<ArrowNextImageClassWidget> createState() =>
      _ArrowNextImageClassWidgetState();
}

class _ArrowNextImageClassWidgetState extends State<ArrowNextImageClassWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        foregroundColor: Colors.white.withOpacity(.6),
        radius: 14,
        backgroundColor: Colors.white.withOpacity(.6),
        child: IconButton(

          splashRadius: 14,
          style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
          splashColor: Colors.transparent,
          onPressed: widget.onPressed,
          icon: widget.isRight ?? false
              ? const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              : const Icon(
                  Icons.arrow_back_ios_new,
                  size: 14,
                ),
        ));
  }
}
