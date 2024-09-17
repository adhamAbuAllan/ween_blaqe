// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
// import 'package:flutter/material.dart';
// // import 'package:ween_blaqe/core/utils/styles/button.dart';
// // import 'package:ween_blaqe/core/widgets/apartments/create_apartment/container_classes_widget/containers_choose_items_class_widget/container_choose_items_class_widget.dart';
// import 'package:ween_blaqe/core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
// // import 'package:ween_blaqe/features/user/owner/steps_to_create_apartment/first_step.dart';
// // import 'package:ween_blaqe/features/user/owner/steps_to_create_apartment/fourth_step.dart';
//
// import '../constants/strings.dart';
// import '../main.dart';
//
// class UpdateApartmentTest extends StatefulWidget {
//   const UpdateApartmentTest({super.key});
//
//   @override
//   State<UpdateApartmentTest> createState() => _UpdateApartmentTestState();
// }
//
// class _UpdateApartmentTestState extends State<UpdateApartmentTest> {
//   DataOfOneApartment localApartment = DataOfOneApartment();
//   TextEditingController addressController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           actions: [
//             ElevatedButton(
//                 onPressed: () {
//                   localApartment.title = addressController.text;
//                   updateApartment(localApartment);
//                 },
//                 child: const Text("update"))
//           ],
//         ),
//         body: Scaffold(
//           body: Column(
//             children: [
//               ContainerInputTextClassWidget(
//                 title: "title",
//                 hintInput: "hintInput",
//                 inputType: TextInputType.text,
//                 controller: addressController,
//               )
//             ],
//           ),
//         ));
//   }
//
//   Future<DataOfOneApartment?> updateApartment(
//       /*
// jsonEncode({'id': apartmentId}),
//
//  'Content-Type': 'application/json',
//
//  */
//       DataOfOneApartment apartment) async {
//     var token = (await sp).get("token");
//
//     if (!validateApartmentData(apartment)) {
//       // Handle validation error
//       return null;
//     }
//
//     final url = Uri.parse(
//         "${ServerWeenBalaqee.apartmentUpdate}/${apartment.id}"); // Replace with your API endpoint
//
//     try {
//       final response = await http.put(
//         url,
//         body: jsonEncode(apartment.toJson()),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//           'Content-Type': 'application/json',
//           // Add any necessary authorization headers
//         },
//       );
//
//       if (response.statusCode == 200) {
//         // Update successful
//         final updatedApartmentJson = jsonDecode(response.body);
//         final updatedApartment =
//             DataOfOneApartment.fromJson(updatedApartmentJson);
//
//         return updatedApartment;
//       } else {
//         // Update failed, handle error
//         print('Failed to update apartment: ${response.body}');
//         return null;
//       }
//     } catch (e) {
//       // Handle network or other exceptions
//       print('Error updating apartment: $e');
//       return null;
//     }
//   }
//
//   bool validateApartmentData(DataOfOneApartment apartment) {
//     if (apartment.id == null) {
//       // Handle error: Apartment ID is required
//       return false;
//     }
//     // ... add other validation checks as needed
//     return true;
//   }
// }
