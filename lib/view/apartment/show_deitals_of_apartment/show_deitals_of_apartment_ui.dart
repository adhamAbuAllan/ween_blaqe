import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment'
    '/show_deitals_of_image/show_detials_of_image_ui.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment/widgets'
    '/about_apartment_widget.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment/widgets'
    '/about_owner_widget.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment/widgets'
    '/advantages_widget.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment/widgets'
    '/description_apartment_widget.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment/widgets'
    '/for_query_widget.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment/widgets'
    '/general_info_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/carousel_slider_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/map_widgets/map_ui.dart';
import 'package:ween_blaqe/view/apartment/widgets/pointer_of_image_widget.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/back_button_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';

class ShowDeitalsOfApartmentUi extends ConsumerStatefulWidget {
  const ShowDeitalsOfApartmentUi({
    super.key,
    this.oneApartment,
  });

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState<ShowDeitalsOfApartmentUi> createState() =>
      _ShowDeitalsOfApartmentUiState();
}

class _ShowDeitalsOfApartmentUiState
    extends ConsumerState<ShowDeitalsOfApartmentUi> {
  bool _isGirlStudent = false;
  bool _isBoyStudent = false;
  bool _isFamilies = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(ownerIdNotifier.notifier).state =
          widget.oneApartment?.owner?.id ?? 0;
      debugPrint("type id of owner ${widget.oneApartment?.owner?.typeId}");
      debugPrint(
          "isShowOwnerApartmentMode ${ref.read(isShowOwnerApartmentMode)}");
      debugPrint("owner id ${ref.read(ownerIdNotifier)}");
    });
    if (widget.oneApartment?.type?.name == "طلاب") {
      _isBoyStudent = true;
    }
    if (widget.oneApartment?.type?.name == "طالبات") {
      _isGirlStudent = true;
    }
    if (widget.oneApartment?.type?.name == "عائلات") {
      _isFamilies = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        child: Column(
          children: [
            SizedBox(
              height:
                  getIt<AppDimension>().isSmallScreen(context) ? 50 / 1.6 : 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: FadeInOnVisible(

                    direction: SlideDirection.x,
                    child: BackButtonWidget(
                      style: ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FadeInOnVisible(
                    direction: SlideDirection.y,
                    child: Text(
                      "${widget.oneApartment?.timeAgo}",
                      style: TextStyle(
                        color: ref
                            .read(themeModeNotifier.notifier)
                            .textTheme(ref: ref),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getIt<AppDimension>().isSmallScreen(context) ? 10 : 20,
            ),
            GestureDetector(
              onTap: () async {
                final currentIndex = ref
                    .read(imageSliderNotifier.notifier)
                    .getCurrentIndex(widget.oneApartment?.id ?? -1);

                final newIndex = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowDetialsOfImageUi(
                      context: context,
                      imageList: widget.oneApartment?.photos ?? [],
                      initialIndex: currentIndex,
                      oneApartment: widget.oneApartment ?? DataOfOneApartment(),
                    ),
                  ),
                );

                if (newIndex != null) {
                  ref
                      .read(imageSliderNotifier.notifier)
                      .updateIndex(widget.oneApartment?.id ?? -1, newIndex);
                }
              },
              child: Column(
                children: [
                  FadeInOnVisible(
                    direction: SlideDirection.x,
                    child: CoursolSliderWidget(
                      marageBetweenImages: .85,
                      imageList: widget.oneApartment!.photos!,
                      apartmentId: widget.oneApartment!.id ?? 1,
                      oneApartment: widget.oneApartment!,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInOnVisible(
                    direction: SlideDirection.xy,
                    child: PointerOfImageWidget(
                      imageList: widget.oneApartment?.photos ?? [],
                      apartmentId: widget.oneApartment?.id ?? -1,
                    ),
                  ),
                ],
              ),
            ),
            FadeInOnVisible(
              direction: SlideDirection.y,
              child: GeneralInfoWidget(
                oneApartment: widget.oneApartment,
                isGirlStudent: _isGirlStudent,
                isBoyStudent: _isBoyStudent,
                isFamilies: _isFamilies,
              ),
            ),
            FadeInOnVisible(
              direction: SlideDirection.x,
              child: AboutApartmentWidget(
                oneApartment: widget.oneApartment ?? DataOfOneApartment(),
                imageAboutApartmentRoom:
                    "assets/images/apartments_images/about_apartment/room.png",
              ),
            ),
            FadeInOnVisible(
                direction: SlideDirection.x,
                child: AdvantagesWidget(oneApartment: widget.oneApartment)),
            FadeInOnVisible(
              child: ApartmentDescriptionWidget(

                apartment: widget.oneApartment ?? DataOfOneApartment(),
              ),
            ),
            FadeInOnVisible(
              direction: SlideDirection.x,
              child: MapUi(

                oneApartment: widget.oneApartment ?? DataOfOneApartment(),
              ),
            ),
            FadeInOnVisible(
              direction: SlideDirection.x,
              child: ForInquiriesWidget(
                  apartment: widget.oneApartment ?? DataOfOneApartment()),
            ),
            ref.read(isShowOwnerApartmentMode)
                ? SizedBox()
                : FadeInOnVisible(
                  child: AboutOwnerWidget(
                      oneApartment: widget.oneApartment ?? DataOfOneApartment()),
                ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
