import 'dart:convert';

// import 'dart:html';

import 'package:colorful_safe_area/colorful_safe_area.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import '../api/comments.dart';
import '../constants/get_it_controller.dart';
import '../constants/localization.dart';
import '../constants/nums.dart';
import '../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';

class SendNoticeForUs extends StatefulWidget {
  const SendNoticeForUs({super.key});

  @override
  State<SendNoticeForUs> createState() => _SendNoticeForUsState();
}

class _SendNoticeForUsState extends State<SendNoticeForUs> {
  TextEditingController sendNoticeForUcController = TextEditingController();

  // var sendNoticeForUsText = "ما هي ملاحظاتك؟";
  // var sendNoticeForUsHint = "أضف ملاحظاتك هنا";

  // "أقترح إضافة خاصية البحث عن شركاء حيث يستطيع الطالب البحث عن شريك له يشاركه في الشقة من خلال التطبيق";
  // var messageOfToast = "شكراً لك لقد تم إرسال إقتراحك بنجاح";
  bool darkModeTest = true;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        bottomColor: Colors.transparent,
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: themeMode.isLight
                ? kBackgroundAppColorLightMode
                : kBackgroundAppColorDarkMode,

            // Colors.grey.shade200,
            appBar: AppBar(
              backgroundColor: themeMode.isLight
                  ? kContainerColorLightMode
                  : kContainerColorDarkMode,
              actions: [
                Opacity(
                  opacity: !themeMode.isLight ? 0 : 1,
                  child: const Padding(
                      padding: EdgeInsets.only(
                        right: 6,
                        top: 1,
                      ),
                      child: BackButton()
                      // OutlinedButton(
                      //   onPressed: () {
                      //     Navigator.pop(context);
                      //   },
                      //   style: outlineButton,
                      //   child: const Text("رجوع"),
                      // ),
                      ),
                ),
                const Expanded(child: Text("")),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:getIt<AppDimension>().isSmallScreen(context)
                        ? 10
                        : 8 ,
                      horizontal: getIt<AppDimension>().isSmallScreen(context)
                          ? 10
                          : 8),
                  child: ElevatedButton(
                    onPressed: () {
                      if (connectivityController.isConnection()) {
                        if (sendNoticeForUcController.text == "" ||
                            sendNoticeForUcController.text.length < 35) {
                          showSnakBar(
                              context,
                              SetLocalization.of(context)!
                                  .getTranslateValue("min_chars_warning"));

                          // toast("يرجى كتابة سطر واحد مكون من 35 حرف على الاقل");
                        } else {
                          // toast(messageOfToast);
                          go(sendNoticeForUcController.text);

                          showSnakBar(
                              context,
                              SetLocalization.of(context)!.getTranslateValue(
                                  "feedback_acknowledgement"));
                        }
                      } else {
                        showSnakBar(
                            context,
                            SetLocalization.of(context)!
                                .getTranslateValue("no_internet"));
                        return;
                      }
                      // Get.to(ApartmentsOfOwnerAfterAdd());
                    },
                    style: fullButton(),
                    child: Text(SetLocalization.of(context)!
                        .getTranslateValue("submit")),
                  ),
                ),
              ],
            ),

            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 100
                        : 250,
                  ),
                  ContainerInputTextClassWidget(
                    title: SetLocalization.of(context)!
                        .getTranslateValue("feedback"),
                    helperText: SetLocalization.of(context)!
                        .getTranslateValue("min_chars_warning"),

                    hintInput: SetLocalization.of(context)!
                        .getTranslateValue("add_your_feedback_here"),
                    maxLines: 8,
                    maxLength: 255,

                    // hintMaxLines: 10,
                    inputType: TextInputType.text,
                    controller: sendNoticeForUcController,
                    // focusNode: discrptionFocusedNode
                  )
                ],
              ),
            ),
          ),
        ));
  }

  go(String comment) async {
    var uri = Uri.parse(ServerWeenBalaqee.commentAdd);
    var request = await http.post(uri, body: {
      "comment": comment,
// "type_id":insetType,
      // "type_id":typeOfUser.id
    });
    var json = await jsonDecode(request.body);
    var response = Comment.fromJson(json);
    setState(() {
      // response = response.comment;
      response.comment = comment;
    });
  }
}
