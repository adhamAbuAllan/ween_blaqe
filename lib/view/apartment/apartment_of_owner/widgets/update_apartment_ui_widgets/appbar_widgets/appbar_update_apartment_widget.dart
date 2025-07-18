import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/api/advantages.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/image_provider.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/elevated_button_widget.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../../../../controller/provider_controllers/providers/snack_bar_provider.dart';

class AppbarUpdateApartmentWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppbarUpdateApartmentWidget({super.key, required this.oneApartment});

  final DataOfOneApartment oneApartment;

  @override
  ConsumerState createState() => _AppbarEditApartmentWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarEditApartmentWidgetState
    extends ConsumerState<AppbarUpdateApartmentWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
          SetLocalization.of(context)!.getTranslateValue("edit_apartment_ad"),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : null,
          )),
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: BackButton(
          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
          style: const ButtonStyle(
            // iconSize : WidgetStateProperty.all(34),
            //    maximumSize: WidgetStateProperty.all(Size(32,
            //        32)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () async {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              if (ref.watch(updateApartmentNotifier).isUpdating) {
                ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                  backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                  textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  context: context,
                      message: SetLocalization.of(context)!.getTranslateValue(
                          "please_wait_while_saving_changes"),
                    );
                return;
              }
            });

            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: getIt<AppDimension>().isSmallScreen(context) ? 10 : 8,
              horizontal: 8),
          child: ElevatedButtonWidget(
            onPressed: () async {
              var advantagesApiNotifier =
                  ref.read(advantagesApi.notifier).state;
              advantagesApiNotifier.clear();
              var hasApartmentDataChanged =
                  ref.watch(isApartmentDataChangedNotifier.notifier);

              for (Advantages advantage
                  in widget.oneApartment.advantages ?? []) {
                ref.read(advantagesApi).add(advantage.id ?? -1);
              }

              debugPrint(
                  "isApartmentImagesUpdated : ${ref.watch(isApartmentImagesUpdated.notifier).state}");
              if (hasApartmentDataChanged.hasAnyChange(ref)) {
                if (ref.watch(updateApartmentNotifier).isUpdating) {
                  ref.watch(showSnackBarNotifier.notifier).showNormalSnackBar(
                    backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                    textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                    context: context,
                        message: SetLocalization.of(context)!.getTranslateValue(
                            "please_wait_while_saving_changes"),
                      );
                  return;
                }
                var apartmentsOfOwnerNotifier = ref
                    .read(fetchApartmentNotifier)
                    .apartmentsList
                    .data
                    ?.where((e) => e.id == widget.oneApartment.id);
                var imagesApi = apartmentsOfOwnerNotifier?.first.photos;

                if (ref.read(advantagesNotifier).chosen.length < 5) {
                  ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                      backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                      textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                      context: context,
                      message: SetLocalization.of(context)!.getTranslateValue(
                          "should_be_at_least_five_advantages"));
                  return;
                }
                if (ref.watch(updateApartmentNotifier).isUpdating) {
                  ref.watch(showSnackBarNotifier.notifier).showNormalSnackBar(
                      backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                      textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                      context: context,
                      message: SetLocalization.of(context)!
                          .getTranslateValue("saving_changes"));
                }
                ref.watch(updateApartmentNotifier.notifier).updateApartment(
                    ref: ref,
                    apartmentId: widget.oneApartment.id ?? -1,
                    imagesApi: imagesApi??[],
                    context: context);
                if (ref.read(badResponse)) {
                  debugPrint("response bad");
                  ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                    backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                    textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                    context: context,
                        message: SetLocalization.of(context)!
                            .getTranslateValue("error"),
                      );
                  return;
                }
                ref.watch(showSnackBarNotifier.notifier).showNormalSnackBar(
                  backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                  textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  context: context,
                      message: SetLocalization.of(context)!
                          .getTranslateValue("changes_saved"),
                    );
                setState(() {

                });

              } else {
                if (advantagesApiNotifier.isNotEmpty) {
                  advantagesApiNotifier.clear();
                }
                if (ref.read(isApartmentImagesUpdated)) {
                  ref.read(isApartmentImagesUpdated.notifier).state = false;
                }
                if (ref.read(hasChanged)) {
                  ref.read(hasChanged.notifier).state = false;
                }

                ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                  backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
                  textColor: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  context: context,
                      message: SetLocalization.of(context)!
                          .getTranslateValue("no_changes_made_yet"),
                    );
                return;
              }
            },
            context: context,
            child: ref.watch(updateApartmentNotifier).isUpdating
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(SetLocalization.of(context)!.getTranslateValue("save")),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
      backgroundColor: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
    );
  }
}
