import 'package:url_launcher/url_launcher.dart';

void snedMessageToEmail(String email , subject,body)async{
   Uri.encodeComponent(email);
   Uri.encodeComponent(subject);
   Uri.encodeComponent(body);
  print(subject); //output: Hello%20Flutter
  Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  if (await launchUrl(mail)) {

  }else{
throw " the email is not correct";
  }
}