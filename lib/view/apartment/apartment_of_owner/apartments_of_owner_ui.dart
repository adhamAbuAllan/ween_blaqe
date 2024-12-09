import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/apartment_of_owner_ui_widgets/appbar_owner_apartments_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/apartment_of_owner_ui_widgets/list_owner_apartments_widget.dart';
import 'package:ween_blaqe/view/common_widgets/floating_action_button_widget'
    '.dart';
import '../../../constants/nums.dart';
import '../../../controller/provider_controllers/providers/apartment_provider.dart';
import 'widgets/apartment_of_owner_ui_widgets/start_add_apartment_widget.dart';
class ApartmentsOfOwnerUi extends ConsumerStatefulWidget {
  const ApartmentsOfOwnerUi({super.key});
  @override
  ConsumerState createState() => _ApartmentsOfOwnerUiState();
}

class _ApartmentsOfOwnerUiState extends ConsumerState<ApartmentsOfOwnerUi>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _iconColorAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(fetchApartmentNotifier.notifier)
          .fetchApartments(isOwnerApartments: true,);
      ref.read(toggleOwnerButtonsNotifier).isEdit = true;

    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _iconColorAnimation = ColorTween(
            begin: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            end: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode)
        .animate(_animationController);
    _animationController.forward();
  }
  @override
  void deactivate() {
    ref.read(toggleOwnerButtonsNotifier).isDelete = false;
    ref.read(toggleOwnerButtonsNotifier).isEdit = false;
    super.deactivate();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        appBar:  AppBarOwnerApartmentsWidget(animationController:
        _animationController, iconColorAnimation: _iconColorAnimation),
        body: ref.watch(fetchApartmentNotifier).isLoading
            ? const Center(child: CircularProgressIndicator())
            : ref.watch(fetchApartmentNotifier).isOwnerHaveApartments == false
                ? const StartAddApartmentWidget()
                :  const ListOwnerApartmentsWidget(),
        floatingActionButton: const FloatingActionButtonWidget());
  }
}
