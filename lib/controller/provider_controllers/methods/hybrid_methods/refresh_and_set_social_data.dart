import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart';
import '../../statuses/auth_state.dart';

class RefreshAndSetSocialDataNotifier extends StateNotifier<AuthState> {
  RefreshAndSetSocialDataNotifier() : super(AuthState());

  Future<void> refreshAndSetSocialData(WidgetRef ref) async {



    state = state.copyWith(isLoading: true);
    if(ref.read(userData)?.email != "user_email"){
    ref.read(emailIsActive.notifier).state = true;
    ref.read(emailController.notifier).state.text = ref.read(userData)?.email ?? "";
    }
    if(ref.read(userData)?.facebook != "user_name"){
      ref.read(facebookIsActive.notifier).state = true;
      ref.read(facebookController.notifier).state.text = ref.read(userData)?.facebook ?? "";
    }
    ref.read(whatsappController.notifier).state.text =
        ref.read(userData)?.phone ?? "97000000000";
    ref.read(phoneLoginController.notifier).state.text =
        ref.read(userData)?.phone ?? "";
    // .replaceFirst(RegExp("97"), "")


    state = state.copyWith(isLoading: false);
  }
}
