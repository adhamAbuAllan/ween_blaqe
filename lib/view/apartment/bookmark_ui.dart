import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
import '../../constants/localization.dart';
import '../common_widgets/empty_screen_widget.dart';
import 'apartments_list_widget.dart';

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
        ref: ref,

        isOwnerApartments: false,
            isAll: true,
            cityId: 0,

          );

      await ref
          .watch(bookmarkNotifier.notifier)
          .fetchBookmarkedApartment(ref: ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    var bookmarkedList = ref.watch(apartmentBookmarkedNotifier.notifier).state;
    return Scaffold(
      backgroundColor:
          ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
      appBar: AppBar(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        title: Text(
          SetLocalization.of(context)!.getTranslateValue("favorites"),
          style: TextStyle(
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : null,
          ),
        ),
      ),
      body: ref.watch(fetchApartmentNotifier).isLoading
          ? Center(
              child: CircularProgressIndicator(
              color:
                  ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
            ))
          : bookmarkedList.data?.isEmpty ?? false
              ? EmptyScreenWidget(
                  centerIcon: Icons.bookmark_outline,
                  centerText: SetLocalization.of(context)!
                      .getTranslateValue("favorite_apartments_displayed_here"),
                  underCenterText: "  ",
                )
              : ApartmentsListWidget(
                  haveCitiesBar: false,
                  apartmentsRes: bookmarkedList,
                ),
    );
  }
}
