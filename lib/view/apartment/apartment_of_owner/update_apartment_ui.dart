import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/dropdown_fields_widgets/cities_drop_down_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/dropdown_fields_widgets/types_drop_down_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/floating_button_add_delete_image_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/add_title_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/address_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/bath_rooms_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/price_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/square_meters_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/text_form_field_containers_widgets/student_count_widget.dart';
import '../../../api/apartments_api/apartments.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../controller/provider_controllers/providers/image_provider.dart';
import '../../apartment/apartment_of_owner/widgets/update_apartment_ui_widgets'
    '/appbar_widgets/appbar_update_apartment_widget.dart';
import 'widgets/advantages_checkbox_widget.dart';
import 'widgets/text_form_field_containers_widgets/description_widget.dart';
import 'widgets/text_form_field_containers_widgets/rooms_widget.dart';

class UpdateApartmentUi extends ConsumerStatefulWidget {
  const UpdateApartmentUi({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState createState() => _UpdateApartmentUiState();
}

class _UpdateApartmentUiState extends ConsumerState<UpdateApartmentUi> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (ref.read(photoWillDeleteIds.notifier).state.isNotEmpty) {
        ref.read(photoWillDeleteIds.notifier).state.clear();
      }
      if (ref.read(cancelImagesNotifier.notifier).state.isNotEmpty) {
        ref.read(cancelImagesNotifier.notifier).state.clear();
      }
      if (ref.read(imagesFileList.notifier).state.isNotEmpty) {
        ref.read(imagesFileList.notifier).state.clear();
      }
      if (ref.read(advantagesNotifier).chosen.isNotEmpty) {
        ref.read(advantagesNotifier).chosen.clear();
        debugPrint("chosen init ${ref.read(advantagesNotifier).chosen}");
      }
      if (ref.read(isApartmentImagesUpdated)) {
        ref.read(isApartmentImagesUpdated.notifier).state = false;
      }
      if (ref.read(advantagesApi.notifier).state.isNotEmpty) {
        ref.read(advantagesApi.notifier).state.clear();
      }

      ref.read(hasChanged.notifier).state = false;
      ref.read(isApartmentUpdatedNotifier.notifier).state = false;

      ref.read(cityNotifier.notifier).fetchCities();

      ref.read(typesNotifier.notifier).fetchTypes();

      ref
          .read(typesNotifier.notifier)
          .setSelectedType(widget.oneApartment!.type!);

      ref
          .read(cityNotifier.notifier)
          .setSelectedCity(widget.oneApartment!.city!);
      ref.read(cityNotifier).selectedCity?.name !=
          widget.oneApartment?.city?.name;
      ref
          .read(advantagesNotifier.notifier)
          .fetchAdvantages(alreadyAdv: widget.oneApartment!.advantages!);

      ref.read(addressController).text = widget.oneApartment?.location ?? "";
      ref.read(addressController).text != widget.oneApartment?.location;
      ref.read(countOfRoomsController.notifier).state.text =
          widget.oneApartment?.rooms.toString() ?? "-1";
      ref.read(countOfRoomsController.notifier).state.text !=
          widget.oneApartment?.rooms.toString();
      ref.read(countOfBathRoomsController.notifier).state.text =
          widget.oneApartment?.bathrooms.toString() ?? "-1";
      ref.read(countOfBathRoomsController.notifier).state.text !=
          widget.oneApartment?.bathrooms.toString();
      ref.read(priceController.notifier).state.text =
          widget.oneApartment?.price.toString() ?? "-1";
      ref.read(priceController.notifier).state.text !=
          widget.oneApartment?.price.toString();
      ref.read(countOfStudentController.notifier).state.text =
          widget.oneApartment?.countOfStudnet.toString() ?? "-1";
      ref.read(countOfBathRoomsController.notifier).state.text !=
          widget.oneApartment?.countOfStudnet.toString();
      ref.read(squareMetersController.notifier).state.text =
          widget.oneApartment?.squareMeters.toString() ?? "-1";
      ref.read(squareMetersController.notifier).state.text !=
          widget.oneApartment?.squareMeters.toString();
      ref.read(titleController.notifier).state.text =
          widget.oneApartment?.title ?? "";
      ref.read(titleController.notifier).state.text !=
          widget.oneApartment?.title;
      ref.read(descriptionController.notifier).state.text =
          widget.oneApartment?.description ?? "";
      ref.read(descriptionController.notifier).state.text !=
          widget.oneApartment?.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
        backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        appBar: AppbarUpdateApartmentWidget(
          oneApartment: widget.oneApartment!,
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                DropdownCitiesWidget(
                  alreadyExistingValue:
                      widget.oneApartment ?? DataOfOneApartment(),
                ),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context) ? 0 : 10,
                ),
                AddressFieldWidget(
                  originalAddress: widget.oneApartment?.location,
                ),
                RoomsFieldWidget(
                  originalRoomsCount: widget.oneApartment?.rooms.toString(),
                ),
                BathRoomsFieldWidget(
                  originalBathRoomsCount:
                      widget.oneApartment?.bathrooms.toString(),
                ),
                const AdvantagesCheckBoxWidget(),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context) ? 0 : 10,
                ),
                PriceWidget(
                    originalPrice: widget.oneApartment?.price.toString()),
                DropdownTypesWidget(
                  alreadyExistingValue:
                      widget.oneApartment ?? DataOfOneApartment(),
                ),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context) ? 0 : 10,
                ),
                StudentCountFieldWidget(
                    originalStudentCount:
                        widget.oneApartment?.countOfStudnet.toString()),
                SquareMetersFieldWidget(
                  originalSquareMeters:
                      widget.oneApartment?.squareMeters.toString(),
                ),
                AddTitleFieldWidget(
                  originalTitle: widget.oneApartment?.title,
                ),
                DescriptionFieldWidget(
                  originalDescription: widget.oneApartment?.description,
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
        floatingActionButton: ImageGridFloatingButtonWidget(
          oneApartment: widget.oneApartment,
        ),
      ),
    );
  }
}
