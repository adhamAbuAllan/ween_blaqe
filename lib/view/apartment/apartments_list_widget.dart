import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

// import 'package:ween_blaqe/constants/nums.dart';

// import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

// import 'package:ween_blaqe/controller/auth_provider.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment'
    '/show_deitals_of_apartment_ui.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment/widgets/about_owner_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/bookmark_button_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/cities_of_apartments_widgets'
    '/bar_of_cities_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/price_text_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/time_ago_text_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets'
    '/title_of_apartment_text_widget'
    '.dart';
import 'package:ween_blaqe/view/apartment/widgets/type_text_widget.dart';
// import 'package:ween_blaqe/view/common_widgets/animations_widgets/navigation_animation_widget.dart';

import '../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../controller/provider_controllers/providers/auth_provider.dart';
import 'apartment_of_owner/widgets/apartment_of_owner_ui_widgets/delete_button_widget.dart';
import 'apartment_of_owner/widgets/apartment_of_owner_ui_widgets/button_update_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/carousel_slider_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/location_text_widget.dart';

class ApartmentsListWidget extends ConsumerStatefulWidget {
  const ApartmentsListWidget({super.key,
    this.scrollController,
    this.onPressed,
    this.onClick,
    this.onTypePress,
    this.isDeleteMode = false,
    required this.haveCitiesBar,
    required this.apartmentsRes,
    this.onLocationPress,
    this.margeBetweenImages,
    this.isOwnerApartment,});

  final Apartments apartmentsRes;
  final ScrollController? scrollController;
  final bool isDeleteMode;
  final Function()? onClick;
  final void Function()? onPressed;
  final void Function()? onTypePress;
  final bool haveCitiesBar;
  final double? margeBetweenImages;
  final bool? isOwnerApartment;
  final Function()? onLocationPress;

  /*
  async {
                debugPrint("before void");
                await ref.watch(locationNotifier.notifier).getUserLocation(ref:
                ref);
                debugPrint("after void");
              }
   */

  @override
  ConsumerState createState() => _ApartmentsListConsumerState();
}

class _ApartmentsListConsumerState extends ConsumerState<ApartmentsListWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: widget.scrollController,
      slivers: [
        widget.haveCitiesBar
            ? SliverAppBar(
          backgroundColor: ref
              .read(themeModeNotifier.notifier)
              .backgroundAppTheme(ref: ref),
          leading: SizedBox(),
          expandedHeight: 70,
          floating: true,
          snap: true,
          // Enables smooth snapping
          pinned: false,
          stretch: true,
          // Optional: allows for stretch/bounce effect
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: SizedBox(
              height: 70,
              child: CitiesBarWidget(
                onTypePress: widget.onTypePress,
                onClick: widget.onClick,
                onLocationPress: widget.onLocationPress,
              ),
            ),
          ),
        )
            : const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: widget.apartmentsRes.data?.length,
                (context, index) {
              final distanceInMeters =
                  widget.apartmentsRes.data?[index].distance_in_meters;
              final distance = (distanceInMeters != null)
                  ? distanceInMeters > 1000
                  ? (distanceInMeters / 1000).toStringAsFixed(1)
                  : distanceInMeters.toStringAsFixed(1)
                  : null;
              final displayDistance = distance != null
                  ? "$distance ${distanceInMeters! > 1000 ? "كيلومتر" : "متر"}"
                  : null;
              return RepaintBoundary(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ShowDeitalsOfApartmentUi(
                                oneApartment: widget.apartmentsRes.data?[index],
                              )));
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 23),
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ref
                            .read(themeModeNotifier.notifier)
                            .containerTheme(ref: ref),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              TypeTextWidget(
                                  apartmentsRes: widget.apartmentsRes,
                                  index: index),
                              const Spacer(),
                              if (widget.isDeleteMode)
                                DeleteButtonWidget(
                                  apartmentId:
                                  widget.apartmentsRes.data?[index].id ?? 0,
                                  onPressed: widget.onPressed,
                                  apartmentsRes: widget.apartmentsRes,
                                  index: index,
                                )
                              else
                                if (ref
                                    .watch(toggleOwnerButtonsNotifier)
                                    .isEdit)
                                  ButtonUpdateClassWdiget(
                                    apartmentsRes: widget.apartmentsRes,
                                    apartmentId: index,
                                  )
                                else
                                  if (ref
                                      .watch(toggleOwnerButtonsNotifier)
                                      .isDelete ==
                                      false &&
                                      ref
                                          .watch(toggleOwnerButtonsNotifier)
                                          .isEdit ==
                                          false)
                                    BookmarkButtonWidget(
                                        apartmentId:
                                        widget.apartmentsRes.data?[index].id ??
                                            0),
                            ],
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(7 / 2),
                              child: widget.apartmentsRes.data?[index]
                                  .photos?[0]
                                  .url ==
                                  null
                                  ? SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    width: 367,
                                    height: 220,
                                    borderRadius:
                                    BorderRadius.circular(7 / 2)),
                              )
                                  : CoursolSliderWidget(
                                isOwnerApartment: widget.isOwnerApartment,
                                marageBetweenImages: .85,
                                imageList:
                                widget.apartmentsRes.data![index].photos!,
                                apartmentId:
                                widget.apartmentsRes.data![index].id!,
                                oneApartment:
                                widget.apartmentsRes.data![index],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          // PointerOfImageWidget(
                          //   imageList:
                          //       widget.apartmentsRes.data?[index].photos ?? [],
                          //   apartmentId: widget.apartmentsRes.data ?[index].id ?? -1,
                          // ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                ApartmentTitleTextWidget(
                                  index: index,
                                  apartmentsRes: widget.apartmentsRes,
                                ),
                                ApartmentLocatoinTextWidget(
                                  index: index,
                                  apartmentsRes: widget.apartmentsRes,
                                ),
                                ApartmentPriceTextWidget(
                                  index: index,
                                  apartmentsRes: widget.apartmentsRes,
                                ),
                                ref.watch(isShowOwnerApartmentMode)
                                    ? SizedBox()
                                    : AboutOwnerWidget(
                                    isForListHome: true,
                                    oneApartment:
                                    widget.apartmentsRes.data?[index]??DataOfOneApartment()),
                                Row(
                                  children: [
                                    TimeAgoTextWidget(
                                      index: index,
                                      apartmentsRes: widget.apartmentsRes,
                                    ),
                                    const Spacer(),
                                    widget.apartmentsRes.data?[index]
                                        .distance_in_meters !=
                                        null &&
                                        widget.apartmentsRes.data![index]
                                            .distance_in_meters! <=
                                            10000
                                        ? Text(displayDistance ?? "",
                                        style: TextStyle(
                                          color: ref
                                              .read(themeModeNotifier.notifier)
                                              .textTheme(ref: ref),
                                          fontSize: 14,
                                        ))
                                        : SizedBox()
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
