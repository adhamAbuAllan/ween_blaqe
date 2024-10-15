import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/apartments_api/one_apartment.dart';
import '../constants/nums.dart';
import '../controller/get_controllers.dart';
import '../core/widgets/apartments/new_master_home_classes_widgets/apartment_container/list_of_apartments.dart';
import '../core/widgets/empty_screen_class_widget.dart';
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
  OneApartment getApartmentsFromBookmarks(List<int> bookmarks) {
    OneApartment result = OneApartment(data: []);
    final List<DataOfOneApartment> apartments =
        apartmentModelController.apartments.value.data ?? [];

    for (int apartmentId in bookmarks) {
      final apartment = apartments.firstWhereOrNull((a) => a.id == apartmentId);
      if (apartment != null) {
        result.data?.add(apartment);
      }
    }

    return result;
  }

  late OneApartment apartmentsBookmarked;

  @override
  void initState() {
    super.initState();
    getSpcficApartments();
  }
  int photoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeMode.isDark
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      appBar: AppBar(
          backgroundColor: themeMode.isDark ? kPrimaryColorLightMode :
          kPrimaryColorDarkMode,
        title: const Text('المفضلة'),
      ),
      body: apartmentsBookmarked.data?.isEmpty??true?const EmptyScreenClassWidget(
          centerIcon: Icons.bookmark_outline,
          centerText: "تُعرض الشقق المفضلة هُنا",
          underCenterText:"  "
      ): ApartmentsList(
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
