// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:ween_blaqe/constants/strings.dart';
//
// Future<void> deleteApartment(int apartmentId) async {
//   try {
//     final response = await http.post(
//       Uri.parse(ServerWeenBalaqee.apartmentDelete), // Replace with your actual API
//       // endpoint
//       body: jsonEncode({'id': apartmentId}),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       // Apartment deleted successfully, handle success (e.g., update UI, show a message)
//       print('Apartment deleted successfully');
//     } else {
//       // Handle API error, show an error message to the user
//       print('Failed to delete apartment');
//     }
//   } catch (e) {
//     // Handle any exceptions during the API call
//     print('Error deleting apartment: $e');
//   }
// }
