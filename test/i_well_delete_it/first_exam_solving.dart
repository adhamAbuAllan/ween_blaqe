// import 'package:get/get.dart';
// import 'package:flutter/material.dart'; import 'package:flutter/material.dart';// void main(){
//   Get.put(Calculator());
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  GetMaterialApp(
//       home: Calc(),
//     );
//   }
// }
// class Calc extends StatelessWidget {
//    Calc({Key? key}) : super(key: key);
//   TextEditingController one = TextEditingController();
//   TextEditingController two = TextEditingController();
// Calculator calculator = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     body:  Center(
//         child: GetBuilder<Calculator>(
//           builder: (c){
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
// TextFormField(controller: one,),
// TextFormField(controller: two,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(onPressed: (){calculator.add(int.parse(one.text),int.parse(two.text));}, child: Text("+")),
//                 ElevatedButton(onPressed: (){calculator.sub(int.parse(one.text),int.parse(two.text));}, child: Text("-")),
//                 ElevatedButton(onPressed: (){calculator.mul(int.parse(one.text),int.parse(two.text));}, child: Text("*")),
//                 ElevatedButton(onPressed: (){calculator.div(int.parse(one.text),int.parse(two.text));}, child: Text("/")),
//               ],
//             ),
//              Text(calculator.res.toString(),style: TextStyle(
//                fontSize: 50,
//                
//                color: Colors.blue
//              ),)
//               ],);
//           },
//         ),
//       )
//     );
//   }
// }
// class Calculator extends GetxController{
//   double res = 0;
//   add (int a , int b){res  = a.toDouble() + b.toDouble(); update();}
//   sub (int a , int b){res  = a.toDouble() - b.toDouble(); update();}
//   mul (int a , int b){res  = a.toDouble() * b.toDouble(); update();}
//   div (int a , int b){res  = a.toDouble() / b.toDouble(); update();}
// }
//
//
