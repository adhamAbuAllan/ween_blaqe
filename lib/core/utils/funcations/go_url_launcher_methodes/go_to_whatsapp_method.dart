import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

void sendMessageToWhatsApp(String phoneNumber, String message,
    {bool? isMyNumber, String? image}) async {
  // String urlWith970 = 'https://wa.me/970$phoneNumber/?text=${Uri.encodeFull(message)}';
  //chick if phone number have "+" or not
  debugPrint("the phone number is $phoneNumber");
  if (phoneNumber.startsWith("+")) {
    //remove "+" from phone number
    phoneNumber.replaceFirst("+", "");
    debugPrint("the phone after remove '+' number is $phoneNumber");
  }
//should urlWith92 await until phoneNumber is remove "+"

  String whatsappUrl =
      'https://wa.me/$phoneNumber/?text=${Uri.encodeFull("$message ${image?.isNotEmpty ?? false ? image : ""}")}';
  whatsappUrl.startsWith("97") ? debugPrint("true:is start with 97") : debugPrint
    ("false:is not start with 97");

  //this code could not be good work

  //   if (!await canLaunchUrl(Uri.parse(urlWith970))) {
  //     await launch(urlWith970);
  //   } else {
  //     if(await canLaunchUrl(Uri.parse(urlWith97))){
  //       await launch(urlWith97);
  //     }else{
  //       throw "the url uncorrect";
  //     }
  //   }
  //   throw "something was wrong";
// this code could be good work
  //that launch two urls that mean if [url with 972] didn't work that will`
  // launch [url with 970] in anywhere
  if (
      // await canLaunchUrl(Uri.parse(urlWith970)) ||
      await canLaunchUrl(Uri.parse(whatsappUrl))) {
    await launchUrl(Uri.parse(whatsappUrl));
    // await launch(urlWith970);`
  } else {
    throw "something was wrong";
  }
}
// switch ()
