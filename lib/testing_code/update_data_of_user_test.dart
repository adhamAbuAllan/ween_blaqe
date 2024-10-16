import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import '../constants/coordination.dart';
import '../constants/get_it_controller.dart';
import '../constants/nums.dart';
import '../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../core/widgets/registration/text_filed_class_widget.dart';
import '../main.dart';

class UpdateUserWidgetTest extends StatefulWidget {
  const UpdateUserWidgetTest({super.key});

  @override
  State<UpdateUserWidgetTest> createState() => _UpdateUserWidgetTestState();
}

class _UpdateUserWidgetTestState extends State<UpdateUserWidgetTest> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  Future<void> _updateUser() async {
    if (_formKey.currentState!.validate()) {
      var ownerId = (await sp).get("id");

      final url = Uri.parse(ServerWeenBalaqee.userUpdate);
      // Replace with your API endpoint
      final response = await http.post(
        url,
        body: jsonEncode({
          'id': ownerId,
          'name': _nameController.text,
          'phone': _phoneController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Update successful, handle response (e.g., show a success message)
        print('User updated successfully');
      } else {
        // Update failed, handle error (e.g., show an error message)
        print('Failed to update user');
      }
    }
  }

  String selectedCountryCode = '970'; // Default country code
  final List<String> countryCodes = ['970', '972'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(alignment: Alignment.topRight,child: BackButton
                  (color: Colors.white,)),
                const SizedBox(height: 0200,),
                TextFieldClassWdiget(
                    fontSize: 16,
                    // foucsNode: focusNodeOfFullName,
                    labelName: "full Name",
                    autoFocus: true,
                    controller: _nameController,
                    // onFieldSubmitted: () {
                    //   focusNodeOfPhone.requestFocus();
                    // },
                    textInputType: TextInputType.name),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context)
                      ? 20 / 1.6
                      : 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical:
                                  getIt<AppDimension>().isSmallScreen(context)
                                      ? 20 / 2
                                      : 20,
                              horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                color: themeMode.isLight
                                    ? kPrimaryColor300LightMode
                                    : kPrimaryColor300DarkMode,
                                width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                color: themeMode.isLight
                                    ? kPrimaryColorLightMode
                                    : kPrimaryColorDarkMode,
                                width: 1),
                          ),
                        ),
                        value: selectedCountryCode,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCountryCode = newValue!;
                          });
                        },
                        dropdownColor: themeMode.isLight
                            ? kContainerColorLightMode
                            : kContainerColorDarkMode,
                        items: countryCodes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              "+$value",
                              style: TextStyle(
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFieldClassWdiget(
                          fontSize: 16,
                          controller: _phoneController,
                          labelName: "phoneBoxName",
                          textInputType: TextInputType.phone),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        "التحقق عن طريق الواتساب",
                        // "ستصلك رسالة لتأكيد رقمك ",
                        style: TextStyle(
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode,
                          fontSize: 16,
                          fontFamily: 'IBM',
                        ),
                      ),
                    ),
                    // const Expanded(child: Text("")),
                    TextButton(
                        onPressed: () {
                          sendMessageToWhatsApp(
                              selectedCountryCode + _phoneController.text,
                              "رقم الهاتف صحيح ، يرجى الرجوع و إتمام عملية "
                              "إنشاء حساب جديد"
                              " ");
                        },
                        child: const Text(
                          "تحقق",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontFamily: 'IBM'),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // aline,
                // const SizedBox(
                //   height: 100,
                // ),
                // aline,
                // TextFormField(
                //   controller: _nameController,
                //   decoration: const InputDecoration(labelText: 'Name'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter a name';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   controller: _phoneController,
                //   decoration: const InputDecoration(labelText: 'Phone'),
                //   validator: (value) {
                //     // Add phone number validation if needed
                //     return null;
                //   },
                // ),
                ElevatedButton(
                  style: fullButton(themeMode: themeMode),
                  onPressed: _updateUser,
                  child: const Text('Update User'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
