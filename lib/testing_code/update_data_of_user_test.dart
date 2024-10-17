import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

// import '../api/users.dart';
import '../constants/coordination.dart';
import '../constants/get_it_controller.dart';
import '../constants/nums.dart';
// import '../controller/get_controllers.dart';
import '../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../core/widgets/registration/text_filed_class_widget.dart';
import '../main.dart';
// import '../sesstion/new_session.dart';
// import '../sesstion/sesstion_of_user.dart';

class UpdateUserWidgetTest extends StatefulWidget {
  const UpdateUserWidgetTest({super.key});

  @override
  State<UpdateUserWidgetTest> createState() => _UpdateUserWidgetTestState();
}

class _UpdateUserWidgetTestState extends State<UpdateUserWidgetTest> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String selectedCountryCode = '970'; // Default country code
  final List<String> countryCodes = ['970', '972'];
  final StreamController<String> subtitleStreamController =
      StreamController<String>();

  // String completePhoneNumber = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _nameController.text = (await sp).get("name").toString();
      _phoneController.text = (await sp).get("phone").toString().substring(3);

      if ((await sp).get("phone").toString().startsWith('970')) {
        setState(() {
          selectedCountryCode = '970';
        });
      } else {
        setState(() {
          selectedCountryCode = '972';
        });
      }
      setState(() {
        // completePhoneNumber = selectedCountryCode + _phoneController.text;
      });
    });
  }

  @override
  void dispose() {
    subtitleStreamController
        .close(); // Close the stream controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ColorfulSafeArea(
        bottomColor: Colors.transparent,
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: Scaffold(
          backgroundColor: themeMode.isLight
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          appBar: AppBar(
            // toolbarHeight: 77,
            backgroundColor: themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode,
            centerTitle: false,
            leading: const BackButton(),
            elevation: 0,
            title: Row(
              children: [
                const Text("تعديل بياناتك"),
                    const SizedBox(width:10,),
                    StreamBuilder<String>(
                      stream: subtitleStreamController.stream,
                      builder: (context, snapshot) {

                        if (snapshot.hasData) {  debugPrint("Snapshot: ${snapshot.data}");

                          return Text(
                            snapshot.data??"",
                            // Display the stream value as the subtitle
                            style:
                                const TextStyle(fontSize: 14, color: Colors.white),
                          );
                        } else {
                          return const Text(""); // Hide the subtitle if
                          // there's no data
                        }
                      },
                    ),
              ],
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: () => _updateUser(),
                    icon: const Icon(
                      (Icons.check),
                      size: 28,
                    ),
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    ContainerInputTextClassWidget(
                      title: "الاسم ",
                      hintInput: "",
                      inputType: TextInputType.name,
                      controller: _nameController,
                      autoFocus: true,
                    ),
                    SizedBox(
                      height: getIt<AppDimension>().isSmallScreen(context)
                          ? 20 / 1.6
                          : 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                      // height: 140,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: themeMode.isLight
                            ? kContainerColorLightMode
                            : kContainerColorDarkMode,
                      ),

                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                child: Text(
                                  "رقم الهاتف",
                                  style: TextStyle(
                                    color: themeMode.isLight
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode,
                                    fontSize: 18,
                                    fontFamily: 'IBM',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: getIt<AppDimension>()
                                                  .isSmallScreen(context)
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
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
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
                                      labelName: "رقم الهاتف",
                                      textInputType: TextInputType.phone),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateUser() async {
    String completePhoneNumber = selectedCountryCode + _phoneController.text;

    if (_formKey.currentState!.validate()) {
      var ownerId = (await sp).get("id");
      if (completePhoneNumber != (await sp).get("phone") ||
          _nameController.text != (await sp).get("name")) {
        subtitleStreamController.add("جاري حفظ التغييرات...");
        //remove name in sp
        (await sp).remove("name");
        //remove phone in sp
        (await sp).remove("phone");

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

          (await sp).setString("phone", completePhoneNumber);

          (await sp).setString("name", _nameController.text);

          subtitleStreamController.add("تم حفظ التغييرات"); //
          debugPrint('User updated successfully');
        } else {
          // Update failed, handle error (e.g., show an error message)
          debugPrint('Failed to update user');
        }
      } else {
        // debugPrint("name contorller: ${_nameController.text}");
        // debugPrint("phone contorller: $completePhoneNumber");
        // debugPrint(" sp phone number : ${(await sp).get("phone")}");
        // debugPrint(" sp name : ${(await sp).get("name")}");
        setState(() {
          subtitleStreamController.add(
              "لم تقم بأي تغييرات"); // Update the stream with the new subtitle
        });
        //take 3 seconds and make subTitleAppBar = "";
        await Future.delayed(const Duration(seconds: 3), () {
          subtitleStreamController.add(
              ""); // Update the stream with an empty string to hide the subtitle
        });
        return;
      }
    }
  }
}
