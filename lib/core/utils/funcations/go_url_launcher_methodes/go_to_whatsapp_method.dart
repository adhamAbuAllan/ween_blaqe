import 'package:url_launcher/url_launcher.dart';

void sendMessageToWhatsApp(String phoneNumber, String message, {bool?  isMyNumber ,String ? image}) async {
  
    // String urlWith970 = 'https://wa.me/970$phoneNumber/?text=${Uri.encodeFull(message)}';
  String urlWith97 = 'https://wa.me/97$phoneNumber/?text=${Uri.encodeFull("$message $image" )
  }';
  if(isMyNumber == true){
    urlWith97 = 'https://wa.me/97$phoneNumber/?text=${Uri.encodeFull(message )}';
  }


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
  //that launch two urls that mean if [url with 972] didn't work that will
  // launch [url with 970] in anywhere
  if(
  // await canLaunchUrl(Uri.parse(urlWith970)) ||
      await canLaunchUrl(Uri.parse(urlWith97))){
     await launch(urlWith97);
      // await launch(urlWith970);
  }else{throw "something was wrong";}
}
// switch ()