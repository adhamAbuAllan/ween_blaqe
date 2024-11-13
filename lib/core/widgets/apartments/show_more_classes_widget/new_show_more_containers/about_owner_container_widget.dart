import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../controller/get_controllers.dart';

class AboutOwnerContainerWidget extends StatefulWidget {
  const AboutOwnerContainerWidget({super.key, required this.oneApartment});

  final DataOfOneApartment oneApartment;

  @override
  State<AboutOwnerContainerWidget> createState() =>
      _AboutOwnerContainerWidgetState();
}

class _AboutOwnerContainerWidgetState extends State<AboutOwnerContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          10, getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 0),
      // discription.length.toDouble() * 2,
      //decoration of show apartment style
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      //about the owner
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Text(
                SetLocalization.of(context)!.getTranslateValue("about_owner"),
                style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: widget.oneApartment.owner?.profile ==
                        "images/profile/user.png"
                    ? CircleAvatar(
                        radius: getIt<AppDimension>().isSmallScreen(context)
                            ? 26
                            : 28,
                        //put a normal person Icon
                        backgroundColor: Colors.grey.shade700,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: getIt<AppDimension>().isSmallScreen(context)
                              ? 26
                              : 28,
                        ))
                    : CircleAvatar(
                        radius: getIt<AppDimension>().isSmallScreen(context)
                            ? 26
                            : 28,
                        // backgroundImage: NetworkImage(NewSession.get("profile","def")),
                        // Adjust the radius as needed
                        backgroundColor: Colors.grey.shade700,
                        // Set the background color of the avatar
                        backgroundImage: NetworkImage("https://weenbalaqee"
                            ".com/${widget.oneApartment.owner?.profile ?? "images/profile/user.png"}"),
                        child: apartmentModelController.isLoading.value
                            ? const CircularProgressIndicator()
                            : null,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.oneApartment.owner?.name ?? "",
                    style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context)
                          ? 15
                          : 18,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                    ),
                  ),

                  Text(
                    // "عرض الملف الشخصي",
                    widget.oneApartment.owner?.phone ?? "",
                    // "972569339613",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode),

                  )
                ],
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 10,),
              //   child: Icon(
              //     Icons.arrow_forward_ios,
              //     color: themeMode.isLight
              //         ? kTextColorLightMode
              //         : kTextColorDarkMode,
              //     // size: ,
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
