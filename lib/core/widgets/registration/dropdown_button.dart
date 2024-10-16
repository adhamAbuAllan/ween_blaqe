import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';

import '../../../api/cities.dart';
import '../../../api/type_of_apartment.dart';

class DropdownButtonClassWidget extends StatefulWidget {
  String firstItem;

  int itemIdNotIndex;
  final Function(dynamic) onSelected;

  // bool dataStatus;
  final Future<List<dynamic>?>? wholeListApi;
  final bool ?forCity;
  DropdownButtonClassWidget({
    super.key,
    // required this.dataStatus,
    required this.firstItem,
    required this.onSelected,
    required this.wholeListApi,
    this.itemIdNotIndex = 1, this.forCity,
  });

  @override
  State<DropdownButtonClassWidget> createState() =>
      _DropdownButtonClassWidget();
}

class _DropdownButtonClassWidget extends State<DropdownButtonClassWidget> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: FutureBuilder<List<dynamic>?>(
            future: widget.wholeListApi,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("جاري التحميل..",
                    style: TextStyle(
                        fontSize: 12, color: Colors.white, fontFamily: 'IBM'));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<dynamic> items = snapshot.data ?? [];

                return DropdownButtonFormField<dynamic>(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: themeMode.isLight
                            ? kPrimaryColorLightMode.withOpacity(.3)
                            : kPrimaryColorDarkMode.withOpacity(.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeMode.isLight
                            ? kPrimaryColorLightMode
                            : kPrimaryColorDarkMode,
                        width: 1,
                      ),
                    ),
                  ),
                  dropdownColor: themeMode.isLight
                      ? kContainerColorLightMode
                      : kContainerColorDarkMode,
                  value: items.isEmpty
                      ? null
                      : items.firstWhere((element) {
                    if (element is City) {
                      return element.id == widget.itemIdNotIndex;
                    } else if (element is TypeOfApartment) {
                      return element.id == widget.itemIdNotIndex;
                    }
                    return false;
                  }, orElse: () => null),
                  items: items.map((item) {
                    String itemName = "";
                    if (item is City) {
                      itemName = item.name ?? "null";
                    } else if (item is TypeOfApartment) {
                      itemName = item.name ?? "null";
                    }
                    return DropdownMenuItem<dynamic>(
                      value: item,
                      child: FittedBox(
                        child: Text(
                          itemName,
                          style: TextStyle(
                            // fontSize: 14,
                            color: themeMode.isLight
                                ?kTextColorLightMode
                                : kTextColorDarkMode,
                            fontFamily: 'IBM',
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: widget.onSelected,
                );

              }
            }));
  }
}
////////////////////////////////--------------------------//////////////////////////////
