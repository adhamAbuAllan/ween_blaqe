import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/image_provider.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../constants/nums.dart';
import '../../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../../../controller/provider_controllers/providers/snack_bar_provider.dart';
import '../../../../../../core/utils/styles/button.dart';

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
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
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
                      context: context,
                      message: SetLocalization.of(context)!.getTranslateValue(
                          "please_wait_while_saving_changes"),
                    );
                return;
              }

              ref.read(fetchApartmentNotifier.notifier).fetchApartments(
                    isOwnerApartments: true,
                  );
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
          child: ElevatedButton(
            onPressed: () async {


      List<int> advantagesApi = [];


      for (var i in widget.oneApartment.advantages ?? []) {
        advantagesApi.add(i.id ?? -1);
      }








              if(ref.watch(hasChanged.notifier).state ||  listEquals(advantagesApi, ref.read(advantagesNotifer).chosen)){
                ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                      context: context,
                      message:
                          SetLocalization.of(context)!.getTranslateValue
                            ("changes_saved"),
                    );
              }else{
                ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                      context: context,
                      message:
                          SetLocalization.of(context)!.getTranslateValue
                            ("no_changes_made_yet"),
                    );
              }
              debugPrint("advantagesApi : $advantagesApi");
              debugPrint("ref.read(advantagesNotifer).chosen : ${ref.read(advantagesNotifer).chosen}");
      debugPrint("isListEquals : ${ listEquals(advantagesApi,
          ref.read(advantagesNotifer).chosen)}");


      debugPrint("hasChanged : ${ref.read(hasChanged)}");
return;


              if (ref.read(updateApartmentNotifier).isUpdating) {
                ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                      context: context,
                      message:
                          SetLocalization.of(context)!.getTranslateValue(""),
                    );
                return;
              }

              var apartmentsOfOwnerNotifer = ref
                  .read(fetchApartmentNotifier)
                  .apartmentsList
                  .data
                  ?.where((e) => e.id == widget.oneApartment.id);
              var imagesApi = apartmentsOfOwnerNotifer?.first.photos;

              if (ref.read(advantagesNotifer).chosen.length < 5) {
                ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
                    context: context,
                    message: SetLocalization.of(context)!.getTranslateValue(
                        "should_be_at_least_five_advantages"));
                return;
              }

              ref.read(updateApartmentNotifier.notifier).updateApartment(
                  ref: ref,
                  apartmentId: widget.oneApartment.id ?? -1,
                  imagesApi: imagesApi);
            },
            style: fullButton(),
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
      backgroundColor: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,
    );
  }
}
