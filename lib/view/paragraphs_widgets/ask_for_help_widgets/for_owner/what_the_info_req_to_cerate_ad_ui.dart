import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/view/common_widgets/skeleton_widgets/ask_to_help_skeleton_widgets/skeleton_long_paragraph_ready_ui.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/ask_for_help_widgets/for_owner/about_apartment_data_required_widget.dart';
import 'package:ween_blaqe/view/paragraphs_widgets/ask_for_help_widgets/for_owner/owner_data_reqiured_table_widget.dart';

import '../../../../constants/get_it_controller.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import 'apartment_features_available_table_widget.dart';
import 'general_apartment_info_data_required_table_widget.dart';

class WhatTheInfoReqToCreateAdUi extends ConsumerStatefulWidget {
  const WhatTheInfoReqToCreateAdUi({super.key});

  @override
  ConsumerState createState() => _WhatTheInfoReqToCreateAdState();
}

class _WhatTheInfoReqToCreateAdState
    extends ConsumerState<WhatTheInfoReqToCreateAdUi> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(advantagesNotifier.notifier).fetchAdvantages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        appBar: AppBar(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        ),
        body: ref.watch(advantagesNotifier).isDataLoading
            ? const LongParagraphReadySkeletonUi()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                            child: SizedBox(
                              // height: 100,
                              // width: 300,
                              child: Text(
                                SetLocalization.of(context)!.getTranslateValue(
                                    "required_data_to_create_ad"),
                                style: TextStyle(
                                  fontSize: getIt<AppDimension>()
                                          .isSmallScreen(context)
                                      ? 22
                                      : 26,
                                  fontWeight: FontWeight.w800,
                                  color: ref
                                      .read(themeModeNotifier.notifier)
                                      .textTheme(ref: ref),
                                ),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //for apartment title
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_data"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 20
                              : 24,
                          fontWeight: FontWeight.w700,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ),

                    //general info apartment data required title
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                          child: Text(
                            SetLocalization.of(context)!
                                .getTranslateValue("general_info"),
                            style: TextStyle(
                              fontSize:
                                  getIt<AppDimension>().isSmallScreen(context)
                                      ? 18
                                      : 20,
                              fontWeight: FontWeight.w600,
                              color: ref
                                  .read(themeModeNotifier.notifier)
                                  .textTheme(ref: ref),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //general info apartment data required paragraph
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("info_of_general_info"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                          fontWeight: FontWeight.w500,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                          letterSpacing: .5,
                          height: 1.35,
                        ),
                      ),
                    ),

                    //general info apartment data required table
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 10.0
                                  : 25),
                      child: const GeneralApartmentInfoDataRequiredTable(),
                    ),

                    //about apartment title
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("about_apartment"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 18
                              : 20,
                          fontWeight: FontWeight.w600,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ),

                    //about apartment data required paragraph
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_details"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                          fontWeight: FontWeight.w500,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                          letterSpacing: .5,
                          height: 1.35,
                        ),
                      ),
                    ),

                    //about apartment data required table
                    const Center(
                      child: AboutApartmentDataRequiredWidget(),
                    ),

                    //advantages of apartment section
                    //apartment advantages title
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_advantages"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 18
                              : 20,
                          fontWeight: FontWeight.w600,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ),

                    //apartment advantages paragraph
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_advantages_details"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          height: 1.35,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ),

                    //apartment advantages table
                    const Center(
                      child: ApartmentFeaturesAvailableTableWidget(),
                    ),

                    //apartment description title
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("apartment_description"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 18
                              : 20,
                          fontWeight: FontWeight.w600,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ),
                    //apartment description paragraph
                    Container(
                      //
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("example_apartment_description"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          height: 1.35,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ),

                    //owner data title
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 30, 25, 20),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("owner_data"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context)
                              ? 20
                              : 24,
                          fontWeight: FontWeight.w700,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ),

                    //owner data required info
                    Container(
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue("owner_data_info"),
                        style: TextStyle(
                          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          height: 1.35,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                        ),
                      ),
                    ),

                    //owner data table
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: OwnerDataReqiuredTableWidget(),
                      ),
                    ),
                    //   const SizedBox(
                    //   height: 30,
                    // ),
                    // aline,
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
