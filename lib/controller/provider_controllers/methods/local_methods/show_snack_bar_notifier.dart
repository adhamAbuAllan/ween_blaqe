import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../constants/nums.dart';
import '../../providers/connectivity_provider.dart';
import '../../statuses/show_snack_bar_state.dart';

class ShowSnackBarNotifier extends StateNotifier< ShowSnackBarState> {
  ShowSnackBarNotifier() : super(ShowSnackBarState());
  void showSnackBar(
      {required BuildContext context,required WidgetRef ref, String ? message,
        IconData?
        icon}) {
    message?.isNotEmpty??false ? state = state.copyWith(message: message) : state =
    state.copyWith(message: null);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(

        clipBehavior: Clip.antiAliasWithSaveLayer,
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
        backgroundColor: themeMode.isLight ?
        kBackgroundAppColorLightMode:kBackgroundAppColorDarkMode ,
        margin: EdgeInsets.only( bottom: icon != null ? 70:55,left: 25,
            right: 25),

        duration:   const Duration(seconds: 3 ) ,

        padding: icon != null ? const EdgeInsets.all(10) :
        kTabLabelPadding
        ,
        // backgroundColor:state?? false ?  Colors.black.withOpacity(.86)  : Colors.grey[900] ,
        content: icon != null
            ?
        Row(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [

            Icon(
              icon,
              color: ref.read(connectivityNotifier.notifier)
                  .isConnected
                  ? Colors.green
                  : Colors.grey.withOpacity(.87),
              size: 28,


            ),
          ],
        ):Text(
          state.message??"",
          style: TextStyle(fontSize: 16, fontFamily: "IBM",color:
          themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
          ),
        ),
      ),
    );
  }
  void showNormalSnackBar({required BuildContext context,String ? message}) {
    message?.isNotEmpty??false ? state = state.copyWith(message: message) : state =

    state.copyWith(message: null);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(

        backgroundColor: themeMode.isLight ?
        kContainerColorLightMode:kContainerColorDarkMode ,

        duration:   const Duration(seconds: 3 ) ,
        // padding: kTabLabelPadding,
        content: Text(
          state.message??"",
          style: TextStyle(fontSize: 16, fontFamily: "IBM",color:
          themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
          ),
        ),
      ),
        );
  }

  
}
