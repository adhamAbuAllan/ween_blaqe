import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/sesstion/sesstion_of_type_of_user.dart';
import 'package:ween_blaqe/urls_of_project/localhost_urls.dart';
import 'package:http/http.dart' as http;
import '../../api/users.dart';

List<TypeOfUser> typeOfUserItems = [];
 TypeOfUser? currentType;
  bool?  visible = false;

class DropDownTypeOfUser extends StatefulWidget {
static TypeOfUser? currentValue = currentType;
static bool ?testing = visible;
  DropDownTypeOfUser({
    Key? key,
    required this.onSelected
    // this.test
  }) : super(key: key);
Function(TypeOfUser) onSelected;

bool ?test ;
  @override
  State<DropDownTypeOfUser> createState() => _DropDownTypeOfUserState();
}

class _DropDownTypeOfUserState extends State<DropDownTypeOfUser> {
  @override
  void initState() {
    // DropDownTypeOfUser.currentValue?.id;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await go();
      // print(currentType?.productName??"");
      // print(currentArea?.name??"");
      // focusNodeOfFullName;
      // FocusScope.of(context).requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding:    EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: typeOfUserItems.length >= 1
            ? DropdownButtonFormField<dynamic>(
                // focusNode: focusNode,
                style: TextStyle(fontSize: 14),
                // autofocus: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide:
                        BorderSide(color: Colors.orange.shade300, width: 0.5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.orange, width: 1),
                  ),
                ),
                value: currentType,
                items: typeOfUserItems
                    .map(
                      (c) => DropdownMenuItem(
                        value: c,
                        child: Text(
                          c.name,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey.shade800,
                              fontFamily: 'IBM'),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (i) {
                  setState(() {
                    currentType = i!;
                    setState(() {
                      widget.onSelected(currentType!);

                    });
                    // visible = !visible;
                    // print(widget.visible);

                  });
                },
              )
            : SizedBox(
                child: Text("جاري التحميل..",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                        fontFamily: 'IBM')),
              ));
  }

  go() async {
    setState(() {
      typeOfUserItems.clear();
    });
    var url = Uri.parse(ServerLocalDiv.typeUser);
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    var data = json["data"] as List<dynamic>;
    typeOfUserItems.clear();
    for (var value in data) {
      typeOfUserItems
          .add(TypeOfUser(id: value['id'], name: value['name']));
      currentType = typeOfUserItems.first;
      // widget.test = !visible;
      setState(() {
        if (currentType!= null) {
          saveTypeOfUser(currentType!);
        }});
    }

  }
}
