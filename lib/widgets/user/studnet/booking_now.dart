import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/alirt_class_widget.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/booking/process_of_pay_container.dart';
import 'package:ween_blaqe/styles/button.dart';

import '../../../classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
 class BookingNow extends StatefulWidget {
   const BookingNow({Key? key}) : super(key: key);

   @override
   State<BookingNow> createState() => _BookingNowState();
 }


 class _BookingNowState extends State<BookingNow> {
   FocusNode countMonthsFocusNose = FocusNode();

   void initState() {
     super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       countMonthsFocusNose.requestFocus();
       FocusScope.of(context).requestFocus();
     } );
   }

   @override
   Widget build(BuildContext context) {
     var countMonthsTitile = "حدد عدد الأشهر";
     var chooseCountOfMonthsHint = "0";
     var focusNode =  countMonthsFocusNose;
     var titleOfProcessPay = "طريقة الدفع";
     var subtitleHowToProcessPay = "تتم عملية الدفع حسب الاتفاق بينك وبين المعلن";
     var titleOfAlirt = "تأكيد";
     var massageOfAlirt = "هل أنت متأكد من إرسال طلب حجز شقة؟";
     var textOfOkButton = "نعم،متابعة";
     var textOfCancelButton = "إلغاء";
     return Scaffold(
       backgroundColor: Colors.grey.shade200,
       body: SingleChildScrollView(
         child: Column(children: [
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
                 hintInput: chooseCountOfMonthsHint,
                 inputType: TextInputType.number,
                 focusNode:focusNode,
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
                     Get.to(Alert.show(context,
                         titleOfAlirt,
                         massageOfAlirt,
                         textOfOkButton,textOfCancelButton));

                   },
                   style: fullButton,
                   child: const Text("تأكيد الحجز")),
             ),
           ),




         ],),
       ),
     );
   }
 }
