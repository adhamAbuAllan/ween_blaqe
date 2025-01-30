import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import '../../../../api/apartments_api/apartments.dart';
import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';

class GeneralInfoWidget extends ConsumerWidget {
  const GeneralInfoWidget({super.key,
    this.oneApartment,
    required this.isGirlStudent,
    required this.isBoyStudent,
    required this.isFamilies
  });
  final DataOfOneApartment? oneApartment;
  final bool isGirlStudent;

  final bool isBoyStudent;

  final bool isFamilies;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: getIt<AppDimension>().isSmallScreen(context) ? 250 : 300,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // this children have ( general info that : title, price , and location
        // .
        children: [
          const TitleGeneralInfoTextWidget(),
          //title
          TitleTextWidget(oneApartment: oneApartment,),
          // location
          LocationTextWidget(oneApartment: oneApartment,),
          // count of student
          AccountOfStudentTextWidget(
              oneApartment: oneApartment, isBoyStudent:isBoyStudent,
              isGirlStudent:isGirlStudent,
              isFamilies:isFamilies),
          //type of apartment
          TypeOfApartmentTextWidget(oneApartment: oneApartment,),
          //price
          PriceTextWidget(oneApartment: oneApartment,),
        ],
      ),
    );

  }
}


class TitleGeneralInfoTextWidget extends ConsumerStatefulWidget {
  const TitleGeneralInfoTextWidget({super.key});

  @override
  ConsumerState<TitleGeneralInfoTextWidget> createState() =>
      _TitleGeneralInfoTextWidgetState();
}

class _TitleGeneralInfoTextWidgetState
    extends ConsumerState<TitleGeneralInfoTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      SetLocalization.of(context)!.getTranslateValue("general_info"),
      style: TextStyle(
        fontSize: getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
        fontWeight: FontWeight.w600,
        color:
        ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
      ),
    );
  }
}

class TitleTextWidget extends ConsumerStatefulWidget {
  const TitleTextWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState<TitleTextWidget> createState() => _TitleTextWidgetState();
}

class _TitleTextWidgetState extends ConsumerState<TitleTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.oneApartment?.title ?? "",
      softWrap: true,
      style: TextStyle(
        color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
        fontSize: getIt<AppDimension>().isSmallScreen(context) ? 17 : 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class LocationTextWidget extends ConsumerStatefulWidget {
  const LocationTextWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState<LocationTextWidget> createState() =>
      _LocationTextWidgetState();
}

class _LocationTextWidgetState extends ConsumerState<LocationTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "${SetLocalization.of(context)!.getTranslateValue("location")}${widget.oneApartment?.city?.name ?? ""}-${widget.oneApartment?.location ?? ""}",
      softWrap: true,
      style: TextStyle(
        color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
      ),
    );
  }
}

class AccountOfStudentTextWidget extends ConsumerStatefulWidget {
  const AccountOfStudentTextWidget({
    super.key,
    this.oneApartment,
    required this.isBoyStudent,
    required this.isGirlStudent,
    required this.isFamilies,
  });

  final DataOfOneApartment? oneApartment;
  final bool isBoyStudent;
  final bool isGirlStudent;
  final bool isFamilies;

  @override
  ConsumerState<AccountOfStudentTextWidget> createState() =>
      _AccountOfStudentTextWidgetState();
}

class _AccountOfStudentTextWidgetState
    extends ConsumerState<AccountOfStudentTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.isBoyStudent
          ? "${SetLocalization.of(context)!.getTranslateValue("allowed_students")}: ${widget.oneApartment?.countOfStudnet ?? 0}"
          : (widget.isGirlStudent
          ? "عدد الطالبات المسموح به: ${widget.oneApartment?.countOfStudnet ?? 0}"
          : "${SetLocalization.of(context)!.getTranslateValue("allowed_people_count")}: ${widget.oneApartment?.countOfStudnet ?? 0}"),
      style: TextStyle(
        color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
        fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
      ),
    );
  }
}

class TypeOfApartmentTextWidget extends ConsumerStatefulWidget {
  const TypeOfApartmentTextWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState<TypeOfApartmentTextWidget> createState() =>
      _TypeOfApartmentTextWidgetState();
}

class _TypeOfApartmentTextWidgetState
    extends ConsumerState<TypeOfApartmentTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "${SetLocalization.of(context)!.getTranslateValue("housing_type_students")}:${widget.oneApartment?.type?.name ?? ""}",
      style: TextStyle(
        color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
        fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
      ),
    );
  }
}

class PriceTextWidget extends ConsumerStatefulWidget {
  const PriceTextWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  ConsumerState<PriceTextWidget> createState() => _PriceTextWidgetState();
}

class _PriceTextWidgetState extends ConsumerState<PriceTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${SetLocalization.of(context)!.getTranslateValue("rent")}: ${widget.oneApartment?.price ?? ""}",
          style: TextStyle(
            color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          SetLocalization.of(context)!
              .getTranslateValue("shekel_per_month"),
          style: TextStyle(
            color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
