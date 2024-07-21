
import 'package:flutter/material.dart';

import '../api/apartments_api/one_apartment.dart';
import '../controller/get_controllers.dart';
import '../core/widgets/apartments/new_master_home_classes_widgets/apartment_container/list_of_apartments.dart';
class BookmarkApartment extends StatefulWidget {
  BookmarkApartment({super.key});

  @override
  State<BookmarkApartment> createState() => _BookmarkApartmentState();
}

class _BookmarkApartmentState extends State<BookmarkApartment> {
  final scrollController = ScrollController();

  // Method to get apartments from bookmarks with valid indices
  OneApartment getApartmentsFromBookmarks(List<int> bookmarks) {
    OneApartment result = OneApartment(data: []);
    final List<DataOfOneApartment> apartments =
        apartmentModelController.apartment.data ?? [];

    for (int index in bookmarks) {
      if (index >= 0 && index < apartments.length) {
        result.data?.add(apartments[index]);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ApartmentsList(
          apartmentsRes: apartmentsBookmarked,
          scrollController: scrollController),
    );
  }

  getSpcficApartments() {
    setState(() {
      apartmentsBookmarked =
          getApartmentsFromBookmarks(bookmarkController.bookmarks);
    });
  }
}
