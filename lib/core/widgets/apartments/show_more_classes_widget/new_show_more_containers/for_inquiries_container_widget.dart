import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../../utils/styles/button.dart';
class ForInquiriesContainerWidget extends StatefulWidget {
  const ForInquiriesContainerWidget({super.key, this.oneApartment});
final DataOfOneApartment ? oneApartment;
  @override
  State<ForInquiriesContainerWidget> createState() => _ForInquiriesContainerWidgetState();
}

class _ForInquiriesContainerWidgetState extends State<ForInquiriesContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return               Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin:  EdgeInsets.fromLTRB(10, getIt<AppDimension>()
          .isSmallScreen(context)?15:20, 10, 0),
      // height: 120,
      // discription.length.toDouble() * 2,
      //decoration of show apartment style
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // this widget For inquiries that have title and social media
        children: [
          //title
          Padding(
            padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 20),
            child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("inquiry"),
                style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontSize:  getIt<AppDimension>().isSmallScreen(context)?18:20,
                  fontWeight: FontWeight.w600,

                )),
          ),
          OverflowBar(
            overflowAlignment: OverflowBarAlignment.start,
            alignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                spacing:  getIt<AppDimension>().isSmallScreen(context)?5:10,
                runSpacing: getIt<AppDimension>().isSmallScreen(context)?5:10,
                children: [
                  IntrinsicWidth(
                    //whatsApp button
                    child: WhatsAppButton(widget: widget),
                  ),

                  //email button
                  widget.oneApartment?.owner!.email == "user_email"
                      ? const SizedBox()
                      : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10),
                    child: IntrinsicWidth(
                      child: EmailButton(widget: widget),
                    ),
                  ),

                  // phone
                  IntrinsicWidth(
                    child: PhoneButton(widget: widget),
                  ),

                  widget.oneApartment?.owner?.facebook == "user_name"
                      ? const SizedBox()
                      : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10),
                    child: IntrinsicWidth(
                      child: FacebookButton(widget: widget),
                    ),
                  ),
                ],
              ),
            ],
          ),

          //social connection

          // ForInquiries(, onClick, user)
        ],
      ),
    );
  }
}

class FacebookButton extends StatelessWidget {
  const FacebookButton({
    super.key,
    required this.widget,
  });

  final ForInquiriesContainerWidget widget;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        sendMessenger(
            userName: widget.oneApartment
                ?.owner?.facebook ??
                "user_name",
            message: "  السلام "
                "عليكم، ممكن أستفسر عن الإعلان الخاص بـ${widget.oneApartment?.title} ",
            image: widget.oneApartment
                ?.photos?[0].url);
      },
      style: outlinedButton(context: context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            //whtsapp icon
             Icon(
              Icons.facebook,
              color: Colors.blue,
              size: getIt<AppDimension>().isSmallScreen(context) ? 24 :  28,
            ),
    
            //text
            Padding(
              padding:
              const EdgeInsets.fromLTRB(
                  3, 0, 3, 0),
              child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue(
                      "facebook"),
                  style: TextStyle(
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                    fontWeight: FontWeight.w400,
                    fontSize:getIt<AppDimension>().isSmallScreen(context) ?14:
                    16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneButton extends StatelessWidget {
  const PhoneButton({
    super.key,
    required this.widget,
  });

  final ForInquiriesContainerWidget widget;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        makePhoneCall(
            widget.oneApartment?.owner?.phone ??
                "user_phone");
      },
      style: outlinedButton(context: context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            //whtsapp icon
             Icon(
              Icons.phone,
              color: Colors.blueAccent,
              size:getIt<AppDimension>().isSmallScreen(context)?24: 28,
            ),

            //text
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  3, 0, 3, 0),
              child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("phone"),
                  style: TextStyle(
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,fontWeight: FontWeight.w400,
                    fontSize:getIt<AppDimension>().isSmallScreen(context)?14:
                    16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailButton extends StatelessWidget {
  const EmailButton({
    super.key,
    required this.widget,
  });

  final ForInquiriesContainerWidget widget;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        sendEmail(
            widget.oneApartment?.owner
                ?.email ??
                "user_email",
            "يعطيك العافية معك احد مستخدمي تطبيق 'وين "
                "بلاقي ",
            "  السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${widget.oneApartment?.title} ",
            image: widget.oneApartment
                ?.photos?[0].url);
      },
      style: outlinedButton(context: context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            //whtsapp icon
             Padding(
              padding: const EdgeInsets.fromLTRB(
                  0, 0, 0, 0),
              child: Image(
                image: const AssetImage(
                    "assets/images/gmail.png"),
                width: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
                height: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
              ),
            ),
    
            //text
            Padding(
              padding:
              const EdgeInsets.fromLTRB(
                  0, 0, 0, 0),
              child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue(
                      "gmail"),
                  style: TextStyle(
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                    fontWeight: FontWeight.w400,
                    fontSize:getIt<AppDimension>().isSmallScreen(context) ?14: 16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class WhatsAppButton extends StatelessWidget {
  const WhatsAppButton({
    super.key,
    required this.widget,
  });

  final ForInquiriesContainerWidget widget;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        // sendMessageToMessenger("https://www.facebook.com/adhm.alaan"," السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${widget.oneApartment?.title}");
        sendMessageToWhatsApp(
            widget.oneApartment!.owner!.phone,
            "  السلام عليكم، ممكن أستفسر عن الإعلان الخاص بـ${widget.oneApartment?.title} ",
            image:
            widget.oneApartment?.photos?[0].url);
      },
      style: outlinedButton(themeMode: themeMode,context: context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            //whtsapp icon
             Padding(
              padding:
              const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Image(
                image: const AssetImage(
                    "assets/images/whatsapp.png"),
                width: getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
                height:getIt<AppDimension>().isSmallScreen(context) ? 24 : 28,
              ),
            ),
    
            //text
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  5, 0, 5, 0),
              child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("whatsapp"),
                  style: TextStyle(
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                    fontWeight: FontWeight.w400,
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

