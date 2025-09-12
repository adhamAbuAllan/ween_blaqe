import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/apartment_of_owner_ui_widgets/appbar_owner_apartments_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/apartment_of_owner_ui_widgets/list_owner_apartments_widget.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/floating_action_button_widget.dart';
import '../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../controller/provider_controllers/statuses/status_of_apartment/apartment_state.dart';
import '../../../main.dart';
import '../widgets/types_of_apartments_widgets/show_types_button_widget.dart';
import 'widgets/apartment_of_owner_ui_widgets/start_add_apartment_widget.dart';

class ApartmentsOfOwnerUi extends ConsumerStatefulWidget {
  const ApartmentsOfOwnerUi({super.key,this.ownerName, this.ownerIdToShow});

  final int? ownerIdToShow;
  final String ?ownerName;

  @override
  ConsumerState createState() => _ApartmentsOfOwnerUiState();
}

class _ApartmentsOfOwnerUiState extends ConsumerState<ApartmentsOfOwnerUi>
    with SingleTickerProviderStateMixin, RouteAware {
  late AnimationController _animationController;
  late Animation<Color?> _iconColorAnimation;
  late ScrollController scrollController;
  ApartmentState apartmentState = ApartmentState();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   ref.read(isShowOwnerApartmentMode.notifier).state = true;
    // });

    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        Future.delayed(const Duration(milliseconds: 350), () {
          if (scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            if (!apartmentState.isLoading) {
              ref.watch(isSebhaVisibleNotifier.notifier).state = true;
            }
            ref.watch(isVisibleNotifier.notifier).state = true;
          } else if (scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            if (!apartmentState.isLoading) {
              ref.watch(isSebhaVisibleNotifier.notifier).state = false;
            }
            ref.watch(isSebhaVisibleNotifier.notifier).state = false;
          }
        });
      });
      ref
          .read(fetchApartmentNotifier.notifier)
          .fetchApartments(isOwnerApartments: true, ref: ref);
      if (ref.read(ownerIdNotifier) != 0) {
        ref.read(toggleOwnerButtonsNotifier).isEdit = false;
      } else {
        ref.read(toggleOwnerButtonsNotifier).isEdit = true;
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _iconColorAnimation = ColorTween(
            begin: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
            end: ref.read(themeModeNotifier.notifier).textTheme(ref: ref))
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _animationController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();

    if (ref.read(advantagesNotifier).chosen.isNotEmpty) {
      ref.read(advantagesNotifier).chosen.clear();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      ref.read(isShowOwnerApartmentMode.notifier).state = false;
    });
    ref.read(toggleOwnerButtonsNotifier).isDelete = false;
    ref.read(toggleOwnerButtonsNotifier).isEdit = false;
  }

  @override
  void didPush() {
    if (widget.ownerIdToShow == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      ref.read(isShowOwnerApartmentMode.notifier).state = true;
    });
  }

  @override
  void didPopNext() {
    if (widget.ownerIdToShow == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(isShowOwnerApartmentMode.notifier).state = true;
    });
  }

  @override
  void didPop() {
    if (widget.ownerIdToShow == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(isShowOwnerApartmentMode.notifier).state = false;
    });
  }

  @override
  void didPushNext() {
    if (widget.ownerIdToShow == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(isShowOwnerApartmentMode.notifier).state = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isApartmentUpdated = ref.read(isApartmentUpdatedNotifier);
    return Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        appBar: AppBarOwnerApartmentsWidget(
            animationController: _animationController,
            iconColorAnimation: _iconColorAnimation,

            ownerName: widget.ownerName),
        body: ref.watch(fetchApartmentNotifier).isLoading
            ? Center(
                child: CircularProgressIndicator(
                color:
                    ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
              ))
            : ref.watch(fetchApartmentNotifier).isOwnerHaveApartments == false
                ? const StartAddApartmentWidget()
                : Stack(children: [
                    ListOwnerApartmentsWidget(
                      scrollController: scrollController,
                    ),
                    if (isApartmentUpdated)
                      ShowTypesButtonWidget(
                        onPressed: () {
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) async {
                            await ref
                                .read(fetchApartmentNotifier.notifier)
                                .fetchApartments(
                                  isOwnerApartments: true,
                                  ref: ref,
                                );
                          });
                        },
                        text: SetLocalization.of(context)!
                            .getTranslateValue("latest_updates"),
                      )
                    else
                      const SizedBox(),
                  ]),
        floatingActionButton: ref.watch(isShowOwnerApartmentMode)
            ? null
            : const FloatingActionButtonWidget());
  }
}
