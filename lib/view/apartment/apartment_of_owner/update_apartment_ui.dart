import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/floating_button_add_delete_image_widget'
    '.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/text_form_field_containers_widgets'
    '/add_title_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/text_form_field_containers_widgets'
    '/address_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/text_form_field_containers_widgets'
    '/bath_rooms_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/text_form_field_containers_widgets'
    '/price_widget'
    '.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/text_form_field_containers_widgets'
    '/square_meters_widget.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets'
    '/update_apartment_ui_widgets/text_form_field_containers_widgets'
    '/student_count_widget.dart';
import '../../../api/apartments_api/apartments.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../controller/provider_controllers/providers/image_provider.dart';
import '../../apartment/apartment_of_owner/widgets/update_apartment_ui_widgets'
    '/appbar_widgets/appbar_update_apartment_widget.dart';
import '../../apartment/apartment_of_owner/widgets/update_apartment_ui_widgets'
    '/dropdown_fields_widgets/types_drop_down_widget.dart';
import '../../apartment/apartment_of_owner/widgets/update_apartment_ui_widgets'
    '/update_advantes_widgets/advantages_edit_widget.dart';
import '../../apartment/apartment_of_owner/widgets/update_apartment_ui_widgets'
    '/text_form_field_containers_widgets/description_widget.dart';
import '../../apartment/apartment_of_owner/widgets/update_apartment_ui_widgets'
    '/text_form_field_containers_widgets/rooms_widget.dart';
import '../../apartment/apartment_of_owner/widgets/update_apartment_ui_widgets'
    '/dropdown_fields_widgets/cities_drop_down_widget.dart';

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
      // ref.read(isSavedImages.notifier).state = false;
        ref.read(imageLocalNotifier).newImages.clear();
        ref.read(imageLocalNotifier).photosIds?.clear();
        ref.read(imageLocalNotifier).images.clear();


      // if( ref.read
      //   (imageApiNotifier).imageFiles?.isNotEmpty??false){
      //   ref.read(imageApiNotifier).imageFiles?.clear();
      // }


        // debugPrint("isSavedImages = ${ref.read(isSavedImages.notifier).state}");


      // if (widget.oneApartment?.photos != null) {
      //
      //   ref.read(imageApiNotifier).copyWith(
      //       imageFiles: widget.oneApartment?.photos
      //           ?.map((photo) => XFile(photo.url ?? ""))
      //           .toList());
      // }


      ref.read(cityNotifier.notifier).fetchCities();

      ref.read(typesNotifier.notifier).fetchTypes();


      ref
          .read(typesNotifier.notifier)
          .setSelectedType(widget.oneApartment!.type!);
      ref
          .read(cityNotifier.notifier)
          .setSelectedCity(widget.oneApartment!.city!);

      ref.read(advantagesNotifer.notifier).fetchAdvantages(widget
          .oneApartment!.advantages!);


      ref.read(addressController).text = widget.oneApartment?.location ?? "";

      ref.read(countOfRoomsController.notifier).state.text =
          widget.oneApartment?.rooms.toString() ?? "-1";

      ref.read(countOfBathRoomsController.notifier).state.text =
          widget.oneApartment?.bathrooms.toString() ?? "-1";

      ref.read(priceController.notifier).state.text =
          widget.oneApartment?.price.toString() ?? "-1";

      ref.read(countOfStudentController.notifier).state.text =
          widget.oneApartment?.countOfStudnet.toString() ?? "-1";

      ref.read(squareMetersController.notifier).state.text =
          widget.oneApartment?.squareMeters.toString() ?? "-1";

      ref.read(titleController.notifier).state.text =
          widget.oneApartment?.title ?? "";

      ref.read(descriptionController.notifier).state.text =
          widget.oneApartment?.description ?? "";

    });
  }
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: themeMode.isLight
                ? kBackgroundAppColorLightMode
                : kBackgroundAppColorDarkMode,
            appBar: AppbarUpdateApartmentWidget(
              oneApartment: widget.oneApartment!,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownCitiesWidget(
                      alreadyExistingValue:
                      widget.oneApartment ?? DataOfOneApartment(),
                    ),
                    SizedBox(
                      height:
                      getIt<AppDimension>().isSmallScreen(context) ? 0 : 10,
                    ),
                    const AddressFieldWidget(),
                    const RoomsFieldWidget(),
                    const BathRoomsFieldWidget(),

                    AdvantagesUpdateWidget(alreadyAdv: widget.oneApartment?.advantages ?? [],),
                    SizedBox(
                      height:
                      getIt<AppDimension>().isSmallScreen(context) ? 0 : 10,
                    ),
                    const PriceWidget(),


                    DropdownTypesWidget(
                      alreadyExistingValue:
                      widget.oneApartment ?? DataOfOneApartment(),
                    ),

                    SizedBox(height: getIt<AppDimension>().isSmallScreen(context) ? 0 : 10,),

                    const StudentCountFieldWidget(),
                    const SquareMetersFieldWidget(),
                    const AddTitleFieldWidget(),
                    const DescriptionFieldWidget(),
                    const SizedBox(height: 60),
                  ],
                ),
              ]),
            ),
            floatingActionButton: FloatingButtonAddDeleteImageWidget(
              oneApartment: widget.oneApartment,
            ),
          ),
        ),
      ),
    );
  }
}
