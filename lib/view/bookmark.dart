import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/apartments_api/apartments.dart';
import '../constants/coordination.dart';
import '../constants/get_it_controller.dart';
import '../constants/localization.dart';
import '../constants/nums.dart';
import '../controller/get_controllers.dart';
import '../core/widgets/empty_screen_class_widget.dart';
import 'apartment/list_of_apartments.dart';

class BookmarkApartment extends StatefulWidget {
  const BookmarkApartment({super.key});

  @override
  State<BookmarkApartment> createState() => _BookmarkApartmentState();
}

class _BookmarkApartmentState extends State<BookmarkApartment> {
  final scrollController = ScrollController();

  // Method to get apartments from bookmarks with valid indices
  // OneApartment getApartmentsFromBookmarks(List<int> bookmarks) {
  //   OneApartment result = OneApartment(data: []);
  //   final List<DataOfOneApartment> apartments =
  //       apartmentModelController.apartment.data ?? [];
  //
  //   for (int index in bookmarks) {
  //     if (index >= 0 && index < apartments.length) {
  //       result.data?.add(apartments[index]);
  //     }
  //   }
  //
  //   return result;
  // }
  Apartments getApartmentsFromBookmarks(List<int> bookmarks) {
    Apartments result = Apartments(data: []);
    final List<DataOfOneApartment> apartments =
        apartmentModelController.apartmentsList.data ?? [];

    for (int apartmentId in bookmarks) {
      final apartment = apartments.firstWhereOrNull((a) => a.id == apartmentId);
      if (apartment != null) {
        result.data?.add(apartment);
      }
    }

    return result;
  }

  late Apartments apartmentsBookmarked;

  @override
  void initState() {
    super.initState();
    getSpcficApartments();
  }

  int photoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      appBar: AppBar(
        backgroundColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        title: Text(SetLocalization.of(context)!.getTranslateValue(
          "favorites",
        ),style: TextStyle(
            
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 :
            null,
            color:
            themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode)),
      ),
      body: apartmentsBookmarked.data?.isEmpty ?? true
          ?  EmptyScreenClassWidget(
              centerIcon: Icons.bookmark_outline,
              centerText: SetLocalization.of(context)!
                  .getTranslateValue("favorite_apartments_displayed_here"),
              underCenterText: "  ")
          : ApartmentsListWidget(
              haveCitiesBar: false,
              apartmentsRes: apartmentsBookmarked,
              // scrollController: scrollController
            ),
    );
  }

  getSpcficApartments() {
    setState(() {
      apartmentsBookmarked =
          getApartmentsFromBookmarks(bookmarkController.bookmarks);
    });
  }
}