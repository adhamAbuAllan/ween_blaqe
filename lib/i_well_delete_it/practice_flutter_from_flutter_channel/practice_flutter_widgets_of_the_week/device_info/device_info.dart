// import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

main() {
  runApp( const MaterialApp(
    home: _Home(),
  ));
}
class _Home extends StatefulWidget {
  const _Home({super.key});

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  bool showInfo = false;
  var device = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: [
        showInfo == true ? Text("${device.androidInfo}"): const SizedBox(),
        ElevatedButton(child: const Text("get your device info"),onPressed: ()async{
            showInfo = true;

          // if(Platform.isAndroid) {
          // }
        },),
      ],
    )),);
  }
}

