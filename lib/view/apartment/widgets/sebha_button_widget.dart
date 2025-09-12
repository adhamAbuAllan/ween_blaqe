import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/view/apartment/widgets/types_of_apartments_widgets/show_types_button_widget.dart';

import '../../../constants/localization.dart';
import '../../../constants/strings.dart';
import '../../../core/utils/funcations/route_pages/push_routes.dart';


class SebhaButtonWidget extends ConsumerWidget {
  const SebhaButtonWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the isBoxVisible state
    final isBoxVisible = ref.watch(isSebhaVisibleNotifier);

    return Padding(
      padding: const EdgeInsets.only(top: 102, right: 15, left: 15),
      child: AnimatedOpacity(
        opacity: isBoxVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: isBoxVisible
            ? BtnShowTypesOfApartments(
          onPressed: () {
            // Assuming `myPushName` is a function that pushes a route
            myPushName(context, MyPagesRoutes.noInternet);
          },
          text: SetLocalization.of(context)!
              .getTranslateValue("tasbih"),
        )
            : const SizedBox(),
      ),
    );
  }
}
