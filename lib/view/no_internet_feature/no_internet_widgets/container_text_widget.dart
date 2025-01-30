
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

class CounterTextWidget extends ConsumerWidget {
  const CounterTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(children: [
     ImageNoInternetWidget(),
      TextNoInternetWidget()
    ]);
  }
}

class ImageNoInternetWidget extends ConsumerWidget {
  const ImageNoInternetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
        child: Image(
          image: const AssetImage("assets/images/error_images/no network.png"),
          height: getIt<AppDimension>().isSmallScreen(context) ? 60 / 1.5 : 60,
          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          width: getIt<AppDimension>().isSmallScreen(context) ? 60 / 1.5 : 60,
        ),
      );
  }
}
class TextNoInternetWidget extends ConsumerWidget {
  const TextNoInternetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 5, 0),
            child: RichText(
              softWrap: true,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: SetLocalization.of(context)!
                        .getTranslateValue("no_internet_connection"),
                    style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                      inherit: true,
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .textTheme(ref: ref),
                    ),
                  ),
                ],
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: SetLocalization.of(context)!
                        .getTranslateValue("try_enabling_mobile_data_or_wifi"),
                    style:  TextStyle(
                        fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                        inherit: true,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      );
  }
}