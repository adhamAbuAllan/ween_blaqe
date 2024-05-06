// import 'dart:convert';
//
// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/styles/button.dart';
// import '../../../api/apartments_api/apartments.dart';
// import '../../../api/bookings.dart';
// import '../../../core/widgets/alirt_class_widget.dart';
// import '../../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
// import '../../../core/widgets/booking/process_of_pay_container.dart';
// import 'package:ween_blaqe/constants/nums.dart';
//
// import '../../../urls_of_project/localhost_urls.dart';
//
// class BookingNow extends StatefulWidget {
//   const BookingNow({Key? key, this.oneApartment}) : super(key: key);
//   final DataOfOneApartment? oneApartment;
//
//   @override
//   State<BookingNow> createState() => _BookingNowState();
// }
//
// TextEditingController countOfMonthController = TextEditingController();
// String messageOfAlirt = "هل أنت متأكد من إرسال طلب حجز شقة؟      ";
// int totalOfPrice = 0;
// String chooseCountOfMonthsHint = "0";
// // var focusNode =  countMonthsFocusNose;
// String titleOfProcessPay = "طريقة الدفع";
// String subtitleHowToProcessPay = "تتم عملية الدفع حسب الاتفاق بينك وبين المعلن";
// String titleOfAlirt = "تأكيد";
// String textOfOkButton = "نعم،متابعة";
// String textOfCancelButton = "إلغاء";
// bool autoFocus = false;
// bool isRestart = false;
// String stringTotalOfPrice = '0.00';
// double doubleTotalPrice = 0.00;
// int integerTotalPrice = 0;
// int price = 0;
// int months = 0;
// int totalRepeatCount = 1;
// bool expanded = false;
//
// class _BookingNowState extends State<BookingNow> {
//   // FocusNode countMonthsFocusNose = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     // go();
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       // countMonthsFocusNose.requestFocus();
//       autoFocus = true;
//       // print(go());
//       // FocusScope.of(context).requestFocus();
//     });
//   }
//
//   var countMonthsTitile = "حدد عدد الأشهر";
//
//   @override
//   Widget build(BuildContext context) {
//     // BookingsRes response;
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Scaffold(
//           backgroundColor: Colors.grey.shade200,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//                       child: IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: const Icon(
//                             Icons.arrow_back_ios,
//                             color: Colors.black87,
//                           )),
//                     ),
//                     const Expanded(child: Text("")),
//                   ],
//                 ),
//                 // const Expanded(child: Text("")),
//                 //title
//                 const Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
//                       child: Text(
//                         "الحجز",
//                         style: TextStyle(
//                           fontSize: 26.0,
//                           fontFamily: 'IBM',
//                           inherit: true,
//                         ),1
//                       ),
//                     ),
//                     Expanded(child: Text(""))
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
//                   child: ContainerInputTextClassWidget(
//                       onEdit: (value) async {
//                         isRestart != isRestart;
//                         // price = int.parse(value);
//                         // price = int.parse(widget.oneApartment?.city ?? "d");
//                         price = widget.oneApartment!.price ?? 0;
//
//                         // int.parse(widget.oneApartment.price);
//                         widget.oneApartment?.price?.toString();
//
//                         // debugPrint(
//                         // "the total is  : ==${int.parse(value) * price}");
//                         setState(() {
//
//                           // int.parse(countOfMonthController.text);
//                           if (countOfMonthController.text.isNotEmpty) {
//                             setState(() {
//                               months = int.parse(value);
//                               if(months != 0){
//                                 expanded = true;
//                                 integerTotalPrice = price  * months ;
//                                 doubleTotalPrice = integerTotalPrice.toDouble();
//                                 stringTotalOfPrice = doubleTotalPrice.toString();
//                               }
//
//                             });
//                           } else {
//                             setState(() {
//                               expanded = false;
//                               stringTotalOfPrice = '0.00';
//                             });
//                           }
//                           // debugPrint(totalOfPrice.toString());
//
//                           // totalOfPrice = int.parse(value) * price;
//                         });
//                         setState(() {});
//
//                         // print(totalOfPrice.toString());
//
//                         //  await getDataFromServer(price, widget.oneApartment?.price ?? "data is null");
//
//                         // debugPrint("value is ${widget.oneApartment?.data?.price
//                         //      }");
//                         // setState(() async{
//                         // totalOfPrice =
//                         // int.parse(value) * oneApartment.data!.price ?? 0;
//                         // print(widget.oneApartment?.data?.price ?? "is null");
//                         // print("${NewSession.get("price", "")}");
//                         debugPrint("you clicked me===============");
//                         // print(widget.oneApartment?.data?.price??widget.myApartment?.price);
//                         // await  getAll();
//                         // });
//                       },
//
//                       title: countMonthsTitile,
//                       autoFocus: autoFocus,
//                       expanded: expanded,
//
//                       valueUnderFormTextField: months <=0 ?  const Text(""):Text(
//                         " إجمالي السعر : $stringTotalOfPrice شيكل",
//                         style: const TextStyle(
//                             fontFamily: 'IBM', color: Colors.orange),
//                       ),
//                       controller: countOfMonthController,
//                       hintInput: chooseCountOfMonthsHint,
//                       inputType: TextInputType.number,
//                       // focusNode:focusNode,/
//                       onFieldSubmitted: (value) {}),
//
//                 ),
//                 ProcessOfPay(
//                     title: titleOfProcessPay,
//                     subtitle: subtitleHowToProcessPay),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 120, 0, 15),
//                   child: SizedBox(
//                     width: 350,
//                     height: 55,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             // getAll();
//                             go(int.parse(countOfMonthController.text));
//                           });
//                           setState(() {
//                             AlertWithTwoBtn.show(
//                                 context,
//                                 titleOfAlirt,
//                                 messageOfAlirt,
//                                 textOfOkButton,
//                                 textOfCancelButton, () {
//                               setState(() {});
//                               setState(() {
//                                 // Timer(
//                                 //   const Duration(milliseconds:3),
//                                 //       () => Navigator.pop(context),
//                                 // );
//                               });
//                             });
//                           });
//                         },
//                         style: fullButton,
//                         child: const Text("تأكيد الحجز")),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   var msg = '';
//   go(int countMonth) async {
//     var uri = Uri.parse(ServerLocalDiv.bookingAdd);
//     var request =
//         await http.post(body: {"month_count": countMonth.toString()}, uri);
//     debugPrint("$request");
//     var json = await jsonDecode(request.body);
//     debugPrint(json);
//     var response = BookingsRes.fromJson(json);
//     response.data.monthCount = countMonth;
//     // if (request.statusCode == 200) {
//     // All ok
//
//     // if(response.status !=false){
// // setState(() {
// //   var correcnt = const AssetImage("assets/images/correct.png");
// //   // totalOfPrice = response.data.price * int.parse(countOfMonthController.text) as int;
// //   // messageOfAlirt = messageOfAlirt + totalOfPrice.toString();
// //   toast("$correcnt تمت عملية الحجز بنجاح ");
// //   // print("sucess");
// // });
// //        }
// //      }else{
// //        msg = response.msg;
// //        setState(() {
// //          toast("حدثت مشكلة في عملية التسجيل: $msg");
//     debugPrint("falid");
//     // });
//     // }
//   }
//
//   getAll() async {
//     var uri = Uri.parse(ServerLocalDiv.bookingAll);
//     var request = await http.get(uri);
//     if (request.statusCode == 200) {
//       // All ok
//       var json = await jsonDecode(request.body);
//       var response = BookingsRes.fromJson(json);
//       if (response.status != false) {
//         setState(() {
//           totalOfPrice =
//               response.data.price * int.parse(countOfMonthController.text);
//           messageOfAlirt = messageOfAlirt + totalOfPrice.toString();
//           debugPrint(messageOfAlirt);
//           debugPrint("$totalOfPrice");
//         });
//       } else {
//         msg = response.msg;
//         setState(() {
//           // toast("حدثت مشكلة في عملية التسجيل: $msg");
//         });
//
//       }
//     }
//   }
// }
