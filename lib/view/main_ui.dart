import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/animation_provider.dart';
import 'package:ween_blaqe/view/apartment/bookmark_ui.dart';
import 'package:ween_blaqe/view/apartment/home_ui.dart';
import 'package:ween_blaqe/view/common_widgets/connectivity_listen_widget.dart';
import 'package:ween_blaqe/view/user/menu_ui.dart';
import '../controller/provider_controllers/providers/color_provider.dart';
import '../core/utils/funcations/route_pages/push_routes.dart';
import 'common_widgets/animations_widgets/custom_bottom_nav_bar_carved_widget.dart';

class MainUi extends ConsumerStatefulWidget {
  const MainUi({super.key});

  @override
  ConsumerState<MainUi> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainUi> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeNotifier.notifier);

    return ConnectivityListenWidget(
      child: ColorfulSafeArea(
        color: themeMode.primaryTheme(ref: ref),
        child: Scaffold(
          backgroundColor: themeMode.backgroundAppTheme(ref: ref),
          body: Stack(
            children: [
              IndexedStack(
                index: ref.watch(bottomNavProvider),
                children: [
                  HomeUi(scrollController: _scrollController),
                  const BookmarkApartmentUi(),
                  MenuUi(
                    onChange: (value) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        setState(() {
                          themeMode.toggleThemeMode(value);
                        });
                      });
                      myPushNameAnimation(context);
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomBottomNavBarCarved(scrollController: _scrollController,)),
              )

            ],

          ),
          // bottomNavigationBar: BottomNavigationBarWidget(
          //   scrollController: _scrollController,
          // ),
          // floatingActionButton: const FloatingActionButtonWidget(),

        ),
      ),
    );
  }
}
