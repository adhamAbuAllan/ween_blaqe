// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
//
// enum OtpChannelType { sms, whatsapp }
//
// class SupabaseAuthNotifier extends AutoDisposeNotifier<AsyncValue<User?>> {
//   @override
//   build()  {
//     final currentUser = Supabase.instance.client.auth.currentUser;
//     return AsyncValue.data(currentUser);
//   }
//
//   Future<void> sendOtp(String phone, {OtpChannelType channel = OtpChannelType.sms}) async {
//     state = const AsyncValue.loading();
//     try {
//       await Supabase.instance.client.auth.signInWithOtp(
//         phone: phone,
//         channel: channel == OtpChannelType.sms ? OtpChannel.sms : OtpChannel
//         .whatsapp,
//       );
//       state = AsyncValue.data(null);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
//
//   Future<void> verifyOtp(String phone, String otp) async {
//     state = const AsyncValue.loading();
//     try {
//       final response = await Supabase.instance.client.auth.verifyOTP(
//         phone: phone,
//         token: otp,
//         type: OtpType.sms,
//       );
//       state = AsyncValue.data(response.user);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
//
//   Future<void> signOut() async {
//     await Supabase.instance.client.auth.signOut();
//     state = const AsyncValue.data(null);
//   }
// }