import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../session/new_session.dart';

class ServerImageWidget extends ConsumerWidget {
  const ServerImageWidget({super.key,this.radius});
final double? radius ;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      radius: radius,
      // Set the background color of the avatar
      backgroundColor: ref.read(themeModeNotifier.notifier)
          .containerTheme
        (ref: ref),
      backgroundImage: NetworkImage("https://weenbalaqee"
          ".com/${NewSession.get("profile", "def")}"),
    );
  }
}
