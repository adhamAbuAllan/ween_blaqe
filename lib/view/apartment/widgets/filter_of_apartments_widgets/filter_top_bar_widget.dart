import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/elevated_button_widget.dart'
    as btn_widget;

import '../../apartment_of_owner/create_apartment/widgets/create_apartment_buttons_widgets.dart';

class FilterTopBarWidget extends ConsumerWidget {
  final VoidCallback onSavePressed;

  const FilterTopBarWidget({
    super.key,
    required this.onSavePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Back button
        const   OutlinedBackButtonWidget(
        
          ),
          const Spacer(),
          // Save button
          btn_widget.ElevatedButtonWidget(
            onPressed: onSavePressed,
            context: context,
            child: const Text("حفظ"),
          ),
        ],
      ),
    );
  }
}
