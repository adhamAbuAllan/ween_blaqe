import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
import '../../constants/localization.dart';
import '../../constants/nums.dart';
import '../../core/widgets/empty_screen_class_widget.dart';
import 'list_of_apartments.dart';

class BookmarkApartmentUi extends ConsumerStatefulWidget {
  const BookmarkApartmentUi({super.key});

  @override
  ConsumerState<BookmarkApartmentUi> createState() => _BookmarkApartmentState();
}

class _BookmarkApartmentState extends ConsumerState<BookmarkApartmentUi> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
        isOwnerApartments: false,

        isAll: true,
        cityId: 0,);

     await ref.watch(bookmarkNotifier.notifier).fetchBookmarkedApartment(ref:
      ref);

    });

  }

  @override
  Widget build(BuildContext context) {

var bookmarkedList = ref.watch(apartmentBookmarkedNotifier.notifier).state;
return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      appBar: AppBar(
        backgroundColor:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        title: Text(
          SetLocalization.of(context)!.getTranslateValue("favorites"),
          style: TextStyle(
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : null,
            color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
          ),
        ),
      ),

      body:
      ref.watch(fetchApartmentNotifier).isLoading ?
const Center(
          child: CircularProgressIndicator(

))
          :
      bookmarkedList.data?.isEmpty??false
          ? EmptyScreenClassWidget(
              centerIcon: Icons.bookmark_outline,
              centerText: SetLocalization.of(context)!
                  .getTranslateValue("favorite_apartments_displayed_here"),
              underCenterText: "  ",
            )
          : ApartmentsListWidget(
              haveCitiesBar: false,
              apartmentsRes:bookmarkedList,

            ),
    );
  }
}