import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

// import 'package:ween_blaqe/constants/nums.dart';

// import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

// import 'package:ween_blaqe/controller/auth_provider.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/apartment/show_deitals_of_apartment'
    '/show_deitals_of_apartment_ui.dart';
import 'package:ween_blaqe/view/apartment/widgets/bookmark_button_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/cities_of_apartments_widgets'
    '/bar_of_cities_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/price_text_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/time_ago_text_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets'
    '/title_of_apartment_text_widget'
    '.dart';
import 'package:ween_blaqe/view/apartment/widgets/type_text_widget.dart';

import '../../constants/nums.dart';
import '../../controller/provider_controllers/providers/apartment_provider.dart';
import 'apartment_of_owner/widgets/apartment_of_owner_ui_widgets/delete_button_widget.dart';
import 'apartment_of_owner/widgets/apartment_of_owner_ui_widgets/button_update_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/carousel_slider_widget.dart';
import 'package:ween_blaqe/view/apartment/widgets/location_text_widget.dart';

class ApartmentsListWidget extends ConsumerStatefulWidget {
  const ApartmentsListWidget(
      {super.key,
      this.scrollController,
      this.onPressed,
      this.onClick,
      this.isDeleteMode = false,
      required this.haveCitiesBar,
      required this.apartmentsRes,
      this.marageBetweenImages});

  final Apartments apartmentsRes;
  final ScrollController? scrollController;
  final bool isDeleteMode;
  final Function()? onClick;
  final void Function()? onPressed;
  final bool haveCitiesBar;
  final double? marageBetweenImages;

  @override
  ConsumerState createState() => _ApartmentsListConsumerState();
}

class _ApartmentsListConsumerState extends ConsumerState<ApartmentsListWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast),
      controller: widget.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: widget.haveCitiesBar
              ? SizedBox(
                  height: 70,
                  child: CitiesBarWidget(
                    onClick: widget.onClick,
                  ))
              : const SizedBox(
                  height: 10,
                ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: widget.apartmentsRes.data?.length,
            (context, index) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isLight
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
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
                          else if (ref.watch(toggleOwnerButtonsNotifier).isEdit)
                            ButtonUpdateClassWdiget(
                              apartmentsRes: widget.apartmentsRes,
                              apartmentId: index,
                            )
                          else if (ref.watch(toggleOwnerButtonsNotifier).isDelete == false &&
                              ref.watch(toggleOwnerButtonsNotifier).isEdit == false)
                            BookmarkButtonWidget(
                                apartmentId:
                                    widget.apartmentsRes.data?[index].id ?? 0),
                        ],
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(7 / 2),
                          child: widget.apartmentsRes.data?[index].photos?[0]
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
                                  marageBetweenImages: .95,
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
                      TimeAgoTextWidget(
                        index: index,
                        apartmentsRes: widget.apartmentsRes,
                      )
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
