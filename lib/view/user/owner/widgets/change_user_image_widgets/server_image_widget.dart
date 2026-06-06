import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../constants/strings.dart';
import '../../../../../session/new_session.dart';

bool hasServerProfileImage(String? value) {
  final profile = value?.trim() ?? "";
  return profile.isNotEmpty && !profile.endsWith("images/profile/user.png");
}

class ServerImageWidget extends ConsumerWidget {
  const ServerImageWidget({super.key, this.radius, this.urlImage});

  final double? radius;
  final String? urlImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileUrl = urlImage ?? NewSession.get(PrefKeys.profile, "");
    final normalizedProfileUrl =
        ServerWeenBalaqee.normalizePublicUrl(profileUrl);

    return CircleAvatar(
      radius: radius,
      // Set the background color of the avatar
      backgroundColor:
          ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      backgroundImage: hasServerProfileImage(normalizedProfileUrl)
          ? NetworkImage(normalizedProfileUrl)
          : null,
    );
  }
}
