import 'dart:convert';

// import 'dart:html';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/urls_of_project/localhost_urls.dart';
import '../api/comments.dart';
import '../constants/nums.dart';
import '../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';

class SendNoticeForUs extends StatefulWidget {
  const SendNoticeForUs({Key? key}) : super(key: key);

  @override
  State<SendNoticeForUs> createState() => _SendNoticeForUsState();
}

class _SendNoticeForUsState extends State<SendNoticeForUs> {
  TextEditingController sendNoticeForUcController = TextEditingController();

  var sendNoticeForUsText = "ما هي ملاحظاتك؟";
  var sendNoticeForUsHint =
      "أقترح إضافة خاصية البحث عن شركاء حيث يستطيع الطالب البحث عن شريك له يشاركه في الشقة من خلال التطبيق";
  var messageOfToast = "شكراً لك لقد تم إرسال إقتراحك بنجاح";
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
        bottomColor: Colors.transparent ,
        color: kPrimaryColor,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: kBackgroundAppColor,

            // Colors.grey.shade200,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: outlineButton,
                    child: const Text("رجوع"),
                  ),
                ),
                const Expanded(child: Text("")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Get.to(ApartmentsOfOwnerAfterAdd());
                      if (sendNoticeForUcController.text == "" ||
                          sendNoticeForUcController.text.length < 35) {
                        showSnakBar(context, "يرجى كتابة سطر واحد مكون من 35 حرف على الاقل");

                        // toast("يرجى كتابة سطر واحد مكون من 35 حرف على الاقل");
                      } else {
                        // toast(messageOfToast);
                        go(sendNoticeForUcController.text);
                        showSnakBar(context, "شكرًا لك على ملاحظتك, سيتم أخذها بعين الاعتبار ");


                      }

                    },
                    style: fullButton,
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
                  maxLines: 7,
                  maxLength: 255,
                  hintMaxLines: 7,
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
    var uri = Uri.parse(ServerLocalDiv.commentAdd);
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
