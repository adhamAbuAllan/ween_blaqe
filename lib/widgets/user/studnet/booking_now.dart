import 'dart:async';
import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/api/apartments.dart';
import 'package:ween_blaqe/api/bookings.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/alirt_class_widget.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/booking/process_of_pay_container.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/styles/button.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';

import '../../../classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import '../../../urls_of_project/localhost_urls.dart';
 class BookingNow extends StatefulWidget {
   const BookingNow({Key? key}) : super(key: key);

   @override
   State<BookingNow> createState() => _BookingNowState();
 }

TextEditingController countOfMonthController = TextEditingController();
String messageOfAlirt = "هل أنت متأكد من إرسال طلب حجز شقة؟      ";
int totalOfPrice = 0;
var chooseCountOfMonthsHint = "0";
// var focusNode =  countMonthsFocusNose;
var titleOfProcessPay = "طريقة الدفع";
var subtitleHowToProcessPay = "تتم عملية الدفع حسب الاتفاق بينك وبين المعلن";
var titleOfAlirt = "تأكيد";
var textOfOkButton = "نعم،متابعة";
var textOfCancelButton = "إلغاء";
bool autoFocus = false;

class _BookingNowState extends State<BookingNow> {
   // FocusNode countMonthsFocusNose = FocusNode();

   void initState() {
     super.initState();
     // go();

     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       // countMonthsFocusNose.requestFocus();
       autoFocus = true;
       // print(go());
       // FocusScope.of(context).requestFocus();
     }
     );
   }
   var countMonthsTitile = "حدد عدد الأشهر";

   @override
   Widget build(BuildContext context) {

     // BookingsRes response;
     return ColorfulSafeArea(
       color: Colors.orange,
       child: GestureDetector(
         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

         child: Scaffold(
           backgroundColor: Colors.grey.shade200,
           body: SingleChildScrollView(
             child: Column(children: [

               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                     child: IconButton(
                         onPressed: () {
                           Get.back();
                         },
                         icon: const Icon(
                           Icons.arrow_back_ios,
                           color: Colors.black87,
                         )),
                   ),
                   const Expanded(child: Text("")),
                 ],
               ),
                 // const Expanded(child: Text("")),
               //title
               Row(
                 children: const [
                   Padding(
                     padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                     child: Text(
                       "الحجز",
                       style: TextStyle(
                         fontSize: 26.0,
                         fontFamily: 'IBM',
                         inherit: true,
                       ),
                     ),
                   ),
                   Expanded(child: Text(""))

                 ],
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                 child: ContainerInputTextClassWidget(
                     title: countMonthsTitile,
                     autoFocus: autoFocus,
                     controller: countOfMonthController,
                     hintInput: chooseCountOfMonthsHint,
                     inputType: TextInputType.number,
                     // focusNode:focusNode,/
                     onFieldSubmitted: (value){}
                 ),
               ),
               ProcessOfPay(title: titleOfProcessPay, subtitle: subtitleHowToProcessPay),
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 120, 0, 15),
                 child: SizedBox(
                   width: 350,
                   height: 55,
                   child: ElevatedButton(
                       onPressed: () {
                         setState(() {
                           // getAll();
                           go(
                               int.parse(countOfMonthController.text)
                           );

                         });
                         setState(() {
                           AlertWithTwoBtn.show(context,
                               titleOfAlirt,
                               messageOfAlirt,
                               textOfOkButton,textOfCancelButton,(){
                             setState(() {

                             });
                             setState(() {
                               // Timer(
                               //   const Duration(milliseconds:3),
                               //       () => Navigator.pop(context),
                               // );
                             });



                         });

                                 });
                       },
                       style: fullButton,
                       child: const Text("تأكيد الحجز")),
                 ),
               ),
             ],),
           ),
         ),
       ),
     );
   }

   var msg = '';
   go(int countMonth)async{
     var uri = Uri.parse(ServerLocalhostEm.bookingAdd);
     var request = await http.post(body: {
       "month_count":countMonth.toString()},
         uri);
     print(request);
     var json = await jsonDecode(request.body);
     print(json);
     var  response = BookingsRes.fromJson(json);
     response.data.monthCount = countMonth;
     // if (request.statusCode == 200) {
       // All ok

       // if(response.status !=false){
// setState(() {
//   var correcnt = const AssetImage("assets/images/correct.png");
//   // totalOfPrice = response.data.price * int.parse(countOfMonthController.text) as int;
//   // messageOfAlirt = messageOfAlirt + totalOfPrice.toString();
//   toast("$correcnt تمت عملية الحجز بنجاح ");
//   // print("sucess");
// });
//        }
//      }else{
//        msg = response.msg;
//        setState(() {
//          toast("حدثت مشكلة في عملية التسجيل: $msg");
         print("falid");
       // });
     // }
   }
   getAll()async{
     var uri = Uri.parse(ServerLocalhostEm.bookingAll);
     var request = await http.get(uri);
     if (request.statusCode == 200) {
       // All ok
       var json = await jsonDecode(request.body);
       var  response = BookingsRes.fromJson(json);
       if(response.status !=false){
setState(() {
  totalOfPrice = response.data.price * int.parse(countOfMonthController.text) as int;
  messageOfAlirt = messageOfAlirt + totalOfPrice.toString();
  print(messageOfAlirt);
  print(totalOfPrice);
});

       }else{

         msg = response.msg;
setState(() {
  toast("حدثت مشكلة في عملية التسجيل: $msg");

});
       }

     }
   }
 }
