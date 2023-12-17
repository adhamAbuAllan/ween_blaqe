// import 'package:url_launcher/url_launcher.dart';
//
// void snedMessageToEmail(String email , subject,body)async{
//    Uri.encodeComponent(email);
//    Uri.encodeComponent(subject);
//    Uri.encodeComponent(body);
//   print(subject); //output: Hello%20Flutter
//   Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
//   if (await launchUrl(mail)) {
//
//   }else{
// throw " the email is not correct";
//   }
// }
// void sendEmailToGmail(String emailAddress, String subject, String body ,) async {
//   String gmailUrl = 'mailto:$emailAddress?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)} , ';
//
//   if (await canLaunchUrl(Uri.parse(gmailUrl))) {
//     await launch(gmailUrl);
//   } else {
//     throw "Could not launch Gmail URL";
//   }
// }
