import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../styles/button.dart';
import '../urls_of_project/localhost_urls.dart';
class LoginRequest extends StatefulWidget {
  const LoginRequest({Key? key}) : super(key: key);

  @override
  State<LoginRequest> createState() => _LoginRequestState();
}

class _LoginRequestState extends State<LoginRequest> {
  TextEditingController phone = TextEditingController();
  TextEditingController passwrod = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("يا صباح الHello World",style: TextStyle(fontSize: 28,fontFamily: 'IBM'),),
          //phone number
          Padding(
            padding: const EdgeInsets.fromLTRB(25,20,25, 10),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  labelStyle: TextStyle(color: Colors.orange),

                  // alignLabelWithHint: true,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.orange.shade300,
                      ),
                      borderRadius: BorderRadius.circular(7))),
            ),
          ),
          //password
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    labelText: "كملة المرور",
                    labelStyle: TextStyle(color: Colors.orange),


                    hintStyle: const TextStyle(
                        color: Colors.grey
                    ),

                    border: InputBorder.none,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.orange,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.5,
                          color: Colors.orange.shade300,
                        ),
                        borderRadius: BorderRadius.circular(7))
                ),
              )
          ),
          //buttons
          //login
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
            child: SizedBox(
              width: 350,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    // login();
                  },
                  child: Text("تسجيل الدخول"),
                  style: fullButton),
            ),
          ),

        ],
      ),

      ),
    );
  }
  void login()async{
    var url = Uri.parse(ServerLocalDiv.userLogin);
    var res = await http.post(url,body: {
      'phone':phone.text,
      'password':passwrod.text,
    });
    var json = jsonDecode(res.body);
  }
}
