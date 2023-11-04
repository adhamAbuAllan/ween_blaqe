import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';

main() {
  runApp(const MaterialApp(home: _Home()));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var result = await Connectivity().checkConnectivity();
              switch (result) {
                case ConnectivityResult.wifi:
                  showSnakBar(context, " connected wifi");
                  break;
                case ConnectivityResult.mobile:
                  showSnakBar(context, " connected mobile data");
                  break;
                case ConnectivityResult.none:
                  showSnakBar(context, "no Internet");
                  break;
                case ConnectivityResult.bluetooth:
                  showSnakBar(context, "connected bluetooth ");

                  break;
                case ConnectivityResult.ethernet:
                  showSnakBar(context, "connected etherent ");
                  break;
                case ConnectivityResult.vpn:
                  showSnakBar(context, "turned on vpn ");
                  break;
                case ConnectivityResult.other:
                  showSnakBar(context, "loading...");

                  break;
              }
            },
            child: const Text(" check state ")),
      ),
    );
  }
}
