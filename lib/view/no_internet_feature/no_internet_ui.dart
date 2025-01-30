import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/connectivity_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/session/new_session.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/app_bar_no_internet_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/container_animated_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/floating_action_button_widget.dart';
import '../../controller/provider_controllers/providers/color_provider.dart';

class NoInternetUi extends ConsumerStatefulWidget {
  const NoInternetUi({super.key, this.isHaveAppBar});

  final bool? isHaveAppBar;

  @override
  ConsumerState createState() => _NoInternetUiState();
}

class _NoInternetUiState extends ConsumerState<NoInternetUi>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var sephaText = ref.read(sephaTextProvider.notifier).state;

      NewSession.get("language", "ar") == 'en'
          ? sephaText = [
              "Subhan Allah",
              "Alhamdulillah",
              "La Ilaha Illallah",
              "Allahu Akbar",
              "Subhan Allah Wabihamdih",
              "Subhan Allah Azim",
              "Astaghfirullah",
            ]
          : sephaText;
      ref.read(connectivityNotifier).copyWith(isSnackBarShown: false);
    });
    // connectivityController.isSnackBarShow.value = false;
    WidgetsBinding.instance.addObserver(this);
    loadTotal(ref: ref);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Load the total value from SharedPreferences when the app is resumed
      loadTotal(ref: ref);
    }
  }

  void loadTotal({required WidgetRef ref}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      ref.read(totalProvider.notifier).state = prefs.getInt('total') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: const AppBarNoInternetWidget(),
              backgroundColor: ref
                  .read(themeModeNotifier.notifier)
                  .backgroundAppTheme(ref: ref),
              body:
                  const SingleChildScrollView(child: ContainerAnimatedWidget()),
              floatingActionButton:
                  ref.read(connectivityNotifier.notifier).isConnected
                      ? const FloatingActionButtonNoInternetWidget()
                      : const SizedBox(),
            );
          }),
    );
  }
}

void saveTotal(int totalValue) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('total', totalValue);
}
