import 'package:image_picker/image_picker.dart';
import 'package:ween_blaqe/features/statuses/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/user/provider/auth_provider.dart';
class ImageProfilePickerNotifier extends StateNotifier<AuthState> {
  ImageProfilePickerNotifier() : super(AuthState());

  Future<void> pickImage(ImageSource source,WidgetRef ref) async {
    ref.watch(profileImageFile.notifier).state = await ref.watch(imagePicker)
        ?.pickImage(source:
    source);
  }

}
