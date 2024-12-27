import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
class EmptyScreenWidget extends ConsumerStatefulWidget {
  const EmptyScreenWidget({super.key, required this.centerIcon,
    required this.centerText,
    this.underCenterText,
    this.centerIconInUnderCenterText,
    this.underCenterTextAfterIcon,
    this.underCenterTextBeforeIcon,});
  final IconData centerIcon;
  final String centerText;
  final String ?underCenterText;
  final IconData? centerIconInUnderCenterText;
  final String ?underCenterTextAfterIcon;
  final String? underCenterTextBeforeIcon;

  @override
  ConsumerState createState() => _EmptyScreenWidgetState();
}

class _EmptyScreenWidgetState extends ConsumerState<EmptyScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,

        // textDirection: TextDirection.rtl,

        children: [
          Icon(
            size: 100 * 2,
            widget.centerIcon,
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          ),
          Text(
            widget.centerText,
            style: TextStyle(
              fontSize: 18,

              color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

            ),
          ),
          widget.centerIconInUnderCenterText != null
              ? CustomTextUnderCenterWidget(
            centerIconInUnderCenterText: widget
                .centerIconInUnderCenterText??Icons.emoji_emotions_outlined,
            underCenterTextBeforeIcon: widget.underCenterTextBeforeIcon??"",
            underCenterTextAfterIcon: widget.underCenterTextAfterIcon??"",)
              : Text(
            widget.underCenterText??"put your under center text here",
            style: TextStyle(
              fontSize: 16,

              color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextUnderCenterWidget extends ConsumerWidget {
  const CustomTextUnderCenterWidget({super.key,     required this.centerIconInUnderCenterText,
      required this.underCenterTextBeforeIcon,
      required this.underCenterTextAfterIcon});
  final IconData centerIconInUnderCenterText;
  final String underCenterTextAfterIcon;
  final String underCenterTextBeforeIcon;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: "$underCenterTextBeforeIcon ",style:
          TextStyle(
            fontSize: 16,

            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          )),
          TextSpan(
            children: [
              WidgetSpan(
                child: Icon(centerIconInUnderCenterText, size: 20,
                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              ),
              ) ],
          ),
          TextSpan(text: " $underCenterTextAfterIcon", style:
          TextStyle(
            fontSize: 16,

            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          )),
        ],
      ),
    ) ;
  }
}