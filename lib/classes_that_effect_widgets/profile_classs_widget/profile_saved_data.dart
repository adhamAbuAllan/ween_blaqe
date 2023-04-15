import 'package:flutter/material.dart';

import '../../styles/text_style/aline_style.dart';
class ProfileSavedData extends StatefulWidget {
  String title;
  String ? subtitle;

   ProfileSavedData({Key? key,
   required this.title,
   this.subtitle
   }) : super(key: key);

  @override
  State<ProfileSavedData> createState() => _ProfileSavedDataState();
}

class _ProfileSavedDataState extends State<ProfileSavedData> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var subtitle = widget.subtitle;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //about user
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10,0),
              ),
              //about user text
              Text(title
                ,style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'IBM',
                  color: Colors.grey.shade800
                ),
              ),
              Expanded(child: SizedBox()),
              //add TextButton
            ],
          ),
          //input something about your self text
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(subtitle ?? ""
                    ,style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )
                ),
              ),
              Expanded(child: SizedBox()),

            ],
          ),
          aline,
        ],
      ),
    );
  }
}
