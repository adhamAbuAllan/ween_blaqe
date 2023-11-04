import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class UrlLauncherHome extends StatelessWidget {
  const UrlLauncherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: ()async=>{
          await launchUrl(Uri.parse("https://wa.me/569339613"))
        }, child: Text("open phnoe"),
      ) ),
    );
  }
}