import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/provider_controllers/local_methods/validator.dart';

class TextFieldState {
  final String value;
  final String? error;

  TextFieldState({this.value = '', this.error});
}

class FormFieldsNotifier extends StateNotifier<Map<String, TextFieldState>> {
  FormFieldsNotifier() : super({});


  void updateError(String fieldKey, String? error) {
    state = {
      ...state,
      fieldKey: TextFieldState(value: state[fieldKey]?.value ?? '', error: error),
    };
  }
    void updateValue(String fieldKey, String value,{BuildContext? context, WidgetRef? ref}) {
      String? error = Validator.validateField(fieldKey, value);

      state = {
        ...state,
        fieldKey: TextFieldState(value: value, error: error),
      };
    }


    bool validateAllFields() {
      bool isValid = true;
      // Validate each field
      state.forEach((key, textFieldState) {
        final error = Validator.validateField(key, textFieldState.value);
        if (error != null) {
          isValid = false;
          state = {
            ...state,
            key: TextFieldState(value: textFieldState.value, error: error),
          };
        }
      });

      return isValid;
    }
  void updateErrors(Map<String, String?> errors) {
    state = {
      ...state,
      ...errors.map((key, value) => MapEntry(key, TextFieldState(value: state[key]?.value ?? '', error: value))),
    };
  }

}
