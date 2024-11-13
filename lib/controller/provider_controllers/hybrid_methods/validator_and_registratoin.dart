import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/strings.dart';

// import '../../../features/statuses/validate_text_form_field_state.dart';
import '../../../features/user/provider/auth_provider.dart';

void validateAndRegistration(WidgetRef ref, String userName , String phone,
String password,BuildContext
context) async {
  // final formState = ref.read(formFieldsProvider);
  // Check if all fields are valid
  bool isValid = true ;

  // ref.read(formFieldsProvider.notifier).updateValue(e, value);
  // If valid, call login
  if (isValid) {

    await ref.read(registerProvider.notifier).register(userName,phone,phone,
        1,1,ref);


    await Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
  }
}
