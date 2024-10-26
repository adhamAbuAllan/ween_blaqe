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
  whatsappUrl.startsWith("97")
      ? debugPrint("true:is start with 97")
      : debugPrint("false:is not start with 97");

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

void sendMessenger({String ? userName, String?message, String? image}) async {
    final Uri url = Uri.parse(
        'https://m'
            '.me/$userName?text=${Uri.encodeFull("$message ${image?.isNotEmpty ?? false ? image : ""}")}');
    if (!await launchUrl(url)) {
      throw Exception(
          'Could not launch $url');
    }
  }

void sendEmail(String recipientEmail, String subject, String body,
    {String? image}) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: recipientEmail,
    query: encodeQueryParameters(<String, String>{
      'subject': subject,
      'body': "$body+${image?.isNotEmpty ?? false ? image : ""}",
    }),
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw "Could not launch email client";
  }
}

String encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

void makePhoneCall(String phoneNumber) async {
  debugPrint("the phone number is $phoneNumber");
  if (phoneNumber.startsWith("+")) {
    phoneNumber = phoneNumber.replaceFirst("+", "");
    debugPrint("the phone after remove '+' number is $phoneNumber");
  }

  String phoneUrl = 'tel:$phoneNumber';

  if (await canLaunchUrl(Uri.parse(phoneUrl))) {
    await launchUrl(Uri.parse(phoneUrl));
  } else {
    throw "Could not launch phone dialer";
  }
}
// switch ()
