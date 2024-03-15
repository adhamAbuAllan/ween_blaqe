import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class DropdownButtonClassWidget extends StatefulWidget {
  String firstItem ;
  final List<String> items;
  final Function(dynamic) onSelected;
  bool dataStatus;

  DropdownButtonClassWidget({
    Key? key,
    required this.dataStatus,
    required this.items,
    required this.firstItem,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<DropdownButtonClassWidget> createState() =>
      _DropdownButtonClassWidget();
}

class _DropdownButtonClassWidget extends State<DropdownButtonClassWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.dataStatus ? Padding(

        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child:
           DropdownButtonFormField<dynamic>(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: themeMode.isDark
                          ? kPrimaryColor300LightMode
                          : kPrimaryColor300DarkMode,
                      width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: themeMode.isDark
                          ? kPrimaryColorLightMode
                          : kPrimaryColorDarkMode,
                      width: 1),
                ),
              ),
              dropdownColor: themeMode.isDark
                  ? kContainerColorLightMode
                  : kContainerColorDarkMode,

              value: widget.firstItem,
              items: widget.items
                  .map(
                    (e) =>
                    DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                            fontSize: 14,
                            color: themeMode.isDark
                                ? kTextColorLightMode
                                : kTextColorDarkMode,
                            fontFamily: 'IBM'),
                      ),
                    ),
              )
                  .toList(),
              onChanged: widget.onSelected
                     )
    ) : SizedBox(
      child: Text("جاري التحميل..",
          style: TextStyle(
              fontSize: 12,
              color: themeMode.isDark
                  ? kTextColorLightMode
                  : kTextColorDarkMode,
              fontFamily: 'IBM')),
    );
  }
}
////////////////////////////////--------------------------//////////////////////////////
