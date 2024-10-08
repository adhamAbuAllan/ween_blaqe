import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/coordination.dart';
import '../../../constants/injection.dart';

class ProfileImage extends StatefulWidget {
  final String image;
  final String name;
  final String? dateOfJoin;
  final String phoneNumber;

  const ProfileImage({
    super.key,
    required this.image,
    required this.name,
    this.dateOfJoin,
    required this.phoneNumber,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    var image = widget.image;
    var name = widget.name;
    var dateOfJoin = widget.dateOfJoin;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isDark
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 30,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: getIt<AppDimension>().isSmallScreen(context)
                            ? 16
                            : 18,
                        fontFamily: 'IBM',
                        color: themeMode.isDark
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                      ),
                    ),
                    Text(
                      widget.phoneNumber,
                      style: TextStyle(
                        fontSize: getIt<AppDimension>().isSmallScreen(context)
                            ? 16 - 3
                            : 18 - 4,
                        fontFamily: 'IBM',
                        color: themeMode.isDark
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: Text("")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: themeMode.isDark
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                  ),
                ),
              ],
            ),
          ),

          // join history
        widget.dateOfJoin?.isNotEmpty??false?  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
                child: Text(
                  "انضم في$dateOfJoin",
                  style: const TextStyle(
                      fontSize: 13, fontFamily: 'IBM', color: Colors.grey),
                ),
              ),
              const Expanded(child: Text(""))
            ],
          ):const SizedBox(),
        ],
      ),
    );
  }
}
