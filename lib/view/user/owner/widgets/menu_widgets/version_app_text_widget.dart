import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../../../core/utils/funcations/get_app_version.dart';
class VersionAppTextWidget extends ConsumerWidget {
  const VersionAppTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return   Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: FutureBuilder<String>(
          future: getAppVersion(),
          builder:
              (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Text(
                "${SetLocalization.of(context)!.getTranslateValue("beta_version")}: ${snapshot.data} ",
                style: TextStyle(
      
                    color: ref.watch(themeModeNotifier.notifier).textTheme
                      (ref: ref,withOpacity: .5)),
                // textDirection: TextDirection.rtl,
              );
            } else if (snapshot.hasError) {
              return Text(
                  "${snapshot.error}${SetLocalization.of(context)!.getTranslateValue("error")}: ");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
