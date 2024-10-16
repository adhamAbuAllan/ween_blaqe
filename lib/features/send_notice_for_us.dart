import 'dart:convert';

// import 'dart:html';
import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import '../api/comments.dart';
import '../constants/nums.dart';
import '../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';

class SendNoticeForUs extends StatefulWidget {
  const SendNoticeForUs({super.key});

  @override
  State<SendNoticeForUs> createState() => _SendNoticeForUsState();
}

class _SendNoticeForUsState extends State<SendNoticeForUs> {
  TextEditingController sendNoticeForUcController = TextEditingController();

  var sendNoticeForUsText = "ما هي ملاحظاتك؟";
  var sendNoticeForUsHint = "أضف ملاحظاتك هنا";

  // "أقترح إضافة خاصية البحث عن شركاء حيث يستطيع الطالب البحث عن شريك له يشاركه في الشقة من خلال التطبيق";
  var messageOfToast = "شكراً لك لقد تم إرسال إقتراحك بنجاح";
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
                  child: Padding(
                      padding: const EdgeInsets.only(
                        right: 6,
                        top: 1,
                      ),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        icon: Platform.isAndroid
                            ? const Icon(
                                Icons.arrow_back,
                                color: kTextColorLightMode,
                                size: 24,
                              )
                            : Platform.isIOS
                                ? const Icon(
                                    Icons.arrow_back_ios,
                                    color: kTextColorLightMode,
                                    size: 24,
                                  )
                                : const Icon(
                                    Icons.arrow_back,
                                    color: kTextColorDarkMode,
                                    size: 24,
                                  ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
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
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (connectivityController.isConnection()) {
                        if (sendNoticeForUcController.text == "" ||
                            sendNoticeForUcController.text.length < 35) {
                          showSnakBar(context,
                              "يرجى كتابة سطر واحد مكون من 35 حرف على الاقل");

                          // toast("يرجى كتابة سطر واحد مكون من 35 حرف على الاقل");
                        } else {
                          // toast(messageOfToast);
                          go(sendNoticeForUcController.text);

                          showSnakBar(context,
                              "شكرًا لك على ملاحظتك, سيتم أخذها بعين الاعتبار ");
                        }
                      } else {
                        showSnakBar(context, "انت غير متصل بالانترنت");
                        return;
                      }
                      // Get.to(ApartmentsOfOwnerAfterAdd());
                    },
                    style: fullButton(themeMode: themeMode),
                    child: const Text("إرسال"),
                  ),
                ),
              ],
            ),

            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContainerInputTextClassWidget(
                  title: sendNoticeForUsText,

                  hintInput: sendNoticeForUsHint,
                  maxLines: 8,
                  maxLength: darkModeTest ? null : 300,

                  hintMaxLines: 10,
                  inputType: TextInputType.text,
                  controller: sendNoticeForUcController,
                  // focusNode: discrptionFocusedNode
                )
              ],
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
