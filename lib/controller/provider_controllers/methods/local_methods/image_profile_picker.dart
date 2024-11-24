import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart';
import '../../statuses/auth_state.dart';
class ImageProfilePickerNotifier extends StateNotifier<AuthState> {
  ImageProfilePickerNotifier() : super(AuthState());

  Future<void> pickImage(ImageSource source,WidgetRef ref) async {
    ref.watch(profileImageFile.notifier).state = await ref.watch(imagePicker)
        ?.pickImage(source:
    source);
  }

}
