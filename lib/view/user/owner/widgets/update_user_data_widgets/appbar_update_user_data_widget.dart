import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/nums.dart';
import '../../../../../main.dart';
import '../../../../../controller/provider_controllers/providers/auth_provider.dart';

class AppBarUpdateUserDataWidget extends ConsumerWidget
    implements PreferredSizeWidget {
  const AppBarUpdateUserDataWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      // toolbarHeight: 77,
      backgroundColor:
          ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      centerTitle: false,
      leading: BackButton(
        onPressed: () async {
          ref.read(updatePhoneValidate.notifier).state = null;

          if (ref.watch(updaterDataUserNotifier).isLoading) {
            return;
          }
          if (ref.watch(dataHasChanged.notifier).state != true) {
            if (ref.read(updateUsernameController).text.isEmpty) {
              ref.read(updateUsernameController.notifier).state.text =
                  (await sp).getString("name") ?? "user name";
            }
            if (ref.read(updatePhoneNumberController).text.isEmpty) {
              ref.read(updatePhoneNumberController.notifier).state.text =
                  (await sp).getString("phone")?.substring(3) ??
                      "97000000000".substring(3);
            }
          }

          Navigator.pop(context);
        },
      ),
      elevation: 0,
      title: Row(
        children: [
          StreamBuilder<String>(
            stream:
                ref.watch(streamUpdateUserDataController.notifier).state.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                debugPrint("Snapshot: ${snapshot.data}");

                return Text(
                  snapshot.data ?? "",
                  // Display the stream value as the subtitle
                  style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context)
                          ? 12
                          : 14,
                      color: Colors.white,
                      fontFamily: "IBM"),
                );
              } else {
                return const Text(""); // Hide the subtitle if
                // there's no data
              }
            },
          ),
        ],
      ),
      actions: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    getIt<AppDimension>().isSmallScreen(context) ? 10 : 8),
            child: IconButton(
              onPressed: () {
                debugPrint(
                    "phone number value ${ref.read(updatePhoneNumberController).text}");
                ref.watch(updatePhoneValidate.notifier).state = "";

                if (ref.watch(updaterDataUserNotifier).isLoading) {
                  return;
                }
                ref
                    .watch(validatorAndUpdateDataOfUserNotifier.notifier)
                    .validateAndUpdateUserData(ref, context);
              },
              icon: ref.watch(changePasswordMethodNotifier).isLoading ||
                      ref.watch(changeDataOfUserMethodNotifier).isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Icon(
                      (Icons.check),
                      size: 28,
                    ),
            ))
      ],
    );
  }
}
