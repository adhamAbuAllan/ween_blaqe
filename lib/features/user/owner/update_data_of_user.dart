import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';

// import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

// import '../api/users.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/nums.dart';

// import '../controller/get_controllers.dart';
import '../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
import '../../../core/widgets/registration/text_field_of_password_class_widget.dart';
import '../../../core/widgets/registration/text_filed_class_widget.dart';
import '../../../main.dart';

// import '../sesstion/new_session.dart';
// import '../sesstion/sesstion_of_user.dart';

class UpdateUserData extends StatefulWidget {
  const UpdateUserData({super.key});

  @override
  State<UpdateUserData> createState() => _UpdateUserDataState();
}

class _UpdateUserDataState extends State<UpdateUserData> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String selectedCountryCode = '970'; // Default country code
  final List<String> countryCodes = ['970', '972'];
  final StreamController<String> subtitleStreamController =
      StreamController<String>();

  TextEditingController newPasswordController = TextEditingController();
  var newPasswordLabelName = " كلمة المرور جديدة";
  TextEditingController oldPasswordController = TextEditingController();
  var oldPasswordLabelName = " كلمة المرور القديمة";

  var textFormFieldTypePassword = TextInputType.visiblePassword;

  //sure password box
  TextEditingController sureNewPasswordController = TextEditingController();
  var surePasswordLabelName = "تأكيد كلمة المرور الجديدة";
  bool isObscure = true;
  bool isSureObscure = true;
  bool isPhoneNumberIsAlreadyTaken = false;
  bool isOldPassword = false;
  bool isHas8Characters = false;
  int errorStatusCode = 0;
  bool dataHasChanged = false;

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
                StreamBuilder<String>(
                  stream: subtitleStreamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      debugPrint("Snapshot: ${snapshot.data}");

                      return Text(
                        snapshot.data ?? "",
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
                    onPressed: () => updateUser(),
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
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0,
                              getIt<AppDimension>().isSmallScreen(context)
                                  ? 50 / 1.6
                                  : 50,
                              20,
                              0),
                          child: Text(
                            "تعديل بياناتي",
                            style: TextStyle(
                              fontSize: 26.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: themeMode.isLight
                                  ? kTextColorLightMode
                                  : kTextColorDarkMode,
                            ),
                          ),
                        ),
                        const Expanded(child: Text("")),
                      ],
                    ),
                    SizedBox(
                      height:
                      getIt<AppDimension>().isSmallScreen(context) ? 50 / 2.1 : 50,
                    ),

                    //change name container
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
                    //change phone container
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
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                    // change password container
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 50),
                      // height: 140,
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),

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
                                    const EdgeInsets.fromLTRB(0, 0, 10, 10),
                                child: Text(
                                  "تغيرر كملة المرور",
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
                          //old password
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                //old password
                                TextFieldOfPasswordClassWidget(
                                  validator: (value) {
                                    if(value == newPasswordController.text &&
                                   value?.isNotEmpty == true) {
                                      return "لا يمكن ان تتشابه كلمة المرور "
                                          "القديمة و الجديدة";

                                    }
                                    if (errorStatusCode == 400) {
                                      return " كلمة المرور خاطئة";
                                    } else {
                                      return null;
                                    }
                                  },
                                  isObscure: isObscure,
                                  onObscureChanged: (newValue) {
                                    setState(() {
                                      isObscure = newValue;
                                    });
                                  },
                                  controller: oldPasswordController,
                                  inputType: textFormFieldTypePassword,
                                  labelInput: oldPasswordLabelName,
                                ),
                                //new password
                                TextFieldOfPasswordClassWidget(
                                  isObscure: isSureObscure,
                                  onObscureChanged: (newValue) {
                                    setState(() {
                                      isSureObscure = newValue;
                                    });
                                  },
                                  controller: newPasswordController,
                                  inputType: textFormFieldTypePassword,
                                  labelInput: newPasswordLabelName,
                                  // onFieldSubmitted: () {
                                  //   focusNodeOfSurePassword.requestFocus();
                                  // },
                                  validator: (value) {
                                    if (errorStatusCode == 422) {
                                      return " كلمة المرور الجديدة قصيرة";
                                    } else if (errorStatusCode == 401) {
                                      return "كلمة المرور غير متطابقة";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                //sure new password
                                TextFieldOfPasswordClassWidget(
                                  validator: (value) {
                                    if (errorStatusCode == 422) {
                                      return " كلمة المرور الجديدة قصيرة";
                                    } else if (errorStatusCode == 401) {
                                      return "كلمة المرور غير متطابقة";
                                    } else {
                                      return null;
                                    }
                                  },
                                  isObscure: isSureObscure,
                                  onObscureChanged: (newValue) {
                                    setState(() {
                                      isSureObscure = newValue;
                                    });
                                  },
                                  // focusNode: fn,
                                  controller: sureNewPasswordController,
                                  // focusNode: focusNodeOfPassword,

                                  inputType: textFormFieldTypePassword,
                                  labelInput: surePasswordLabelName,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//this method has ['changePassword'] method
  Future<void> updateUser() async {
    setState(() {
      // errorStatusCode = 0;
      _formKey.currentState!.validate();
    });

    // setState(() {
    //   errorStatusCode;
    // });
    var ownerId = (await sp).get("id");

    String completePhoneNumber = selectedCountryCode + _phoneController.text;

    setState(() {
      changePassword(
          currentPasswordController: oldPasswordController.text,
          newPassword: newPasswordController.text);
      debugPrint("error status code $errorStatusCode");
    });

    //name and phone change method -->
    setState(() {
      changeDataOfUser(completePhoneNumber, ownerId.toString());
    });
    setState(() {
      dataHasChanged == false
          ? subtitleStreamController.add("لم تقم بإي "
              "تغييرات حتى الآن")
          : null;
    });
    dataHasChanged = false;
  }

  Future<void> changeDataOfUser(
      String completePhoneNumber, String ownerId) async {
    debugPrint("ownerId : $ownerId");
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
        (await sp).setString("phone", completePhoneNumber);

        (await sp).setString("name", _nameController.text);

        subtitleStreamController.add("تم حفظ التغييرات"); //
        debugPrint('User updated successfully');

        dataHasChanged = true;
      } else {
        debugPrint('Failed to update user');
      }
    }
    await Future.delayed(const Duration(seconds: 3), () {
      subtitleStreamController.add("");
    });
  }

//change password method
  Future<void> changePassword({
    required String currentPasswordController,
    required String newPassword,
  }) async {
    debugPrint("change Password method ...");
    //password change if statement -->
    if (oldPasswordController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty &&
        sureNewPasswordController.text.isNotEmpty) {
      //old password and new password and new sure password controllers is
      // not empty
      if (newPasswordController.text == sureNewPasswordController.text) {
        if(newPasswordController.text == newPasswordController.text){
          return;
        }

        subtitleStreamController.add("جاري حفظ التغييرات...");
        // sure password and new password controllers is same --> make action
        final url = Uri.parse(ServerWeenBalaqee.changePassword);
        var token = (await sp).get("token");
        final response = await http.post(
          url,

          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode({
            'current_password': currentPasswordController,
            'new_password': newPassword,
            // 'new_password_confirmation': newPassword,
            'id': (await sp).get("id").toString(),
          }),
        );
        debugPrint("status code now is : ${response.statusCode}");
        debugPrint("body now is : ${response.body}");

        if (response.statusCode == 200) {
          // debugPrint("sueccess");
          subtitleStreamController.add("تم حفظ التغييرات"); //
          dataHasChanged = true;
          setState(() {
            errorStatusCode = 0;

          });
          await Future.delayed(const Duration(seconds: 3), () {
            subtitleStreamController.add("");
          });
        }
        if (response.statusCode == 422) {
          // debugPrint("should password have at least 8 characters");

          setState(() {
            errorStatusCode = response.statusCode;
            _formKey.currentState!.validate();
          });
//should password have at least 8 characters
        }
        // debugPrint("response.statusCode ${response.statusCode}");
        if (response.statusCode == 400) {
          setState(() {
            errorStatusCode = response.statusCode;
            _formKey.currentState!.validate();
            // debugPrint("old password is not correct");
            debugPrint("$errorStatusCode");
            //old password is not correct
          });
        }
      } else if (newPasswordController.text != sureNewPasswordController.text) {
        //sure password  and new password controllers are not same
        setState(() {
          errorStatusCode = 401;
          _formKey.currentState!.validate();
        });
      }
    }
    //else { //old password and new password and new sure password
    // controllers is empty --> do nothing}
  }
}
