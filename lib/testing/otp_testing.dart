// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:ween_blaqe/view/common_widgets/text_widgets/subtitle_of_screen_widget.dart';
// import 'package:ween_blaqe/view/common_widgets/text_widgets/title_of_screen_widget.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../constants/coordination.dart';
// import '../constants/get_it_controller.dart';
// import '../controller/provider_controllers/methods/hybrid_methods/auth_validator/login_and_reg_validators/validator_and_registratoin.dart';
// import '../controller/provider_controllers/methods/hybrid_methods/supbase_otp_notifier.dart';
// import '../controller/provider_controllers/providers/auth_provider.dart';
// import '../controller/provider_controllers/providers/color_provider.dart';
// import '../controller/provider_controllers/providers/supabase_provider.dart';
// import '../view/common_widgets/button_widgets/elevated_button_widget.dart';
//
// void main() {
//   runApp(const MaterialApp(
//     home: OtpScreen(),
//   ));
// }
//
// class OtpScreen extends ConsumerStatefulWidget {
//   const OtpScreen({super.key});
//
//   @override
//   ConsumerState createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends ConsumerState<OtpScreen> {
//   // TextEditingController controller = ref.read(otpCodeController);
//   String otp = "";
//   bool otpSent = false;
//   late var authNotifier;
//   late String phoneNumber;
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       phoneNumber = ref.read(phoneRegController.notifier).state.text;
//       authNotifier = ref.read(supabaseAuthProvider.notifier);
//
//       await authNotifier.sendOtp(phoneNumber, channel:
//       OtpChannelType.whatsapp);
//       debugPrint("phone : $phoneNumber");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(supabaseAuthProvider);
//     return Scaffold(
//       backgroundColor:
//           ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
//       appBar: AppBar(
//         title: Text('إنشاء حساب'),
//         backgroundColor:
//             ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 40 * 1,
//               ),
//               TitleWidget(title: "رمز التحقق"),
//               if (otpSent)
//                 SubtitleWidget(subtitle: "قم بالتحفف من رسائل الواتس اب"),
//               const SizedBox(height: 50 * 3),
//               TextFormField(
//                 controller: ref.read(otpCodeController),
//               ),
//               Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: OtpTextField(
//                     numberOfFields: 6,
//                     autoFocus: true,
//                     showFieldAsBox: true,
//                     borderRadius: BorderRadius.circular(7),
//                     textStyle: TextStyle(
//                       color: ref
//                           .read(themeModeNotifier.notifier)
//                           .textTheme(ref: ref),
//                     ),
//                     enabledBorderColor: ref
//                         .read(themeModeNotifier.notifier)
//                         .textTheme(ref: ref),
//                     focusedBorderColor: ref
//                         .read(themeModeNotifier.notifier)
//                         .primaryTheme(ref: ref),
//                     cursorColor: ref
//                         .read(themeModeNotifier.notifier)
//                         .primaryTheme(ref: ref),
//                     onCodeChanged: (String code) {
//                       debugPrint("code changed: $code");
//                     },
//                     onSubmit: (pin) {
//                       otp = pin;
//                       debugPrint(
//                           "Entered OTP: $pin"); // Should print 4 digits once filled
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               authState.when(
//                   data: (user) => user != null
//                       ? Text("Logged in as ${user.phone}")
//                       : SizedBox.shrink(),
//                   loading: () => CircularProgressIndicator(),
//                   error: (e, _) {
//                     log(e.toString());
//                     return Text("Error: $e",
//                         style: TextStyle(color: Colors.red));
//                   }),
//               const SizedBox(height: 64),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: getIt<AppDimension>().isSmallScreen(context)
//                       ? 55 / 1.2
//                       : 55,
//                   child: ElevatedButtonWidget(
//                     color: otpSent == false ? Colors.grey : null,
//                     onPressed: () async {
//                       if (otpSent == false) {
//                         return;
//                       }
//                       debugPrint("Entered OTP: $otp");
//
//                       final phone = ref.read(phoneRegController).text;
//
//                       await authNotifier.verifyOtp(
//                           phone, ref.read(otpCodeController).text);
//
//                       if (authState.hasError) {
//                         debugPrint("the error is ${authState.error}");
//                       }
//
//                       // if (otp == "0000") {
//                       //   validateAndRegistration(ref, context);
//                       // } else {
//                       //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       //     content: Text("قم بإدخال 0000 للتسجيل"),
//                       //   ));
//                       //   return;
//                       // }
//                       // if (otp.length < 6) {
//                       //   debugPrint("Entered OTP: $otp");
//                       //
//                       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       //     content: Text("Invalid OTP"),
//                       //   ));
//                       //   return;
//                       // }
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => SuccessScreen()));
//                     },
//                     context: context,
//                     child: const Text('تحقق'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SuccessScreen extends StatefulWidget {
//   @override
//   _SuccessScreenState createState() => _SuccessScreenState();
// }
//
// class _SuccessScreenState extends State<SuccessScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 700),
//     );
//
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _onContinuePressed() {
//     // TODO: Handle navigation or logic
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomPaint(
//               size: Size(100, 100),
//               painter: CheckPainter(progress: _animation),
//             ),
//             SizedBox(height: 32),
//             Text(
//               'Success!',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Congratulations! You have been\nsuccessfully authenticated',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.grey),
//             ),
//             SizedBox(height: 40),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               child: ElevatedButton(
//                 onPressed: _onContinuePressed,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   minimumSize: Size(double.infinity, 56),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 5,
//                   shadowColor: Colors.orangeAccent,
//                 ),
//                 child: Text(
//                   'Continue',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CheckPainter extends CustomPainter {
//   final Animation<double> progress;
//
//   CheckPainter({required this.progress}) : super(repaint: progress);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paintCircle = Paint()
//       ..color = Colors.transparent
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..color = Colors.orange;
//
//     final paintCheck = Paint()
//       ..color = Colors.orange
//       ..strokeWidth = 5
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2 - 5;
//
//     // Draw circle outline
//     canvas.drawCircle(center, radius, paintCircle);
//
//     // Draw animated check
//     final path = Path();
//     path.moveTo(size.width * 0.28, size.height * 0.53);
//     path.lineTo(size.width * 0.43, size.height * 0.68);
//     path.lineTo(size.width * 0.72, size.height * 0.38);
//
//     final pathMetrics = path.computeMetrics();
//     for (final metric in pathMetrics) {
//       final extractPath =
//           metric.extractPath(0.0, metric.length * progress.value);
//       canvas.drawPath(extractPath, paintCheck);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
// ///////////////////////// with logic ////////////////////////
//
// class OtpLoginScreen extends ConsumerStatefulWidget {
//   @override
//   ConsumerState<OtpLoginScreen> createState() => _OtpLoginScreenState();
// }
//
// class _OtpLoginScreenState extends ConsumerState<OtpLoginScreen> {
//   final _phoneController = TextEditingController();
//   final _otpController = TextEditingController();
//
//   bool otpSent = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(supabaseAuthProvider);
//     final authNotifier = ref.read(supabaseAuthProvider.notifier);
//
//     return Scaffold(
//       appBar: AppBar(title: Text("OTP Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: _phoneController,
//               decoration: InputDecoration(labelText: "Phone Number"),
//             ),
//             if (otpSent)
//               TextField(
//                 controller: _otpController,
//                 decoration: InputDecoration(labelText: "Enter OTP"),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 final phone = _phoneController.text;
//                 if (!otpSent) {
//                   await authNotifier.sendOtp(phone,
//                       channel: OtpChannelType.sms);
//                   setState(() => otpSent = true);
//                 } else {
//                   await authNotifier.verifyOtp(phone, _otpController.text);
//                 }
//               },
//               child: Text(otpSent ? "Verify OTP" : "Send OTP"),
//             ),
//             authState.when(
//                 data: (user) => user != null
//                     ? Text("Logged in as ${user.phone}")
//                     : SizedBox.shrink(),
//                 loading: () => CircularProgressIndicator(),
//                 error: (e, _) {
//                   log(e.toString());
//                   return Text("Error: $e", style: TextStyle(color: Colors.red));
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ////////////////use firebase otp ///////////
//
// class FirebaseNotifier extends StateNotifier<_AuthState> {
//   FirebaseNotifier() : super(_AuthState());
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> sendOTP(String phoneNumber) async {
//     try {
//       await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           final userCred = await _auth.signInWithCredential(credential);
//           state = state.copyWith(user: userCred.user);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           state = state.copyWith(error: e.message);
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           state = state.copyWith(
//             verificationId: verificationId,
//             isCodeSent: true,
//           );
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           state = state.copyWith(verificationId: verificationId);
//         },
//       );
//     } catch (e) {
//       state = state.copyWith(error: e.toString());
//     }
//   }
//
//   Future<void> verifyOTP(String smsCode) async {
//     try {
//       final credential = PhoneAuthProvider.credential(
//         verificationId: state.verificationId!,
//         smsCode: smsCode,
//       );
//       final userCred = await _auth.signInWithCredential(credential);
//       state = state.copyWith(user: userCred.user);
//     } catch (e) {
//       state = state.copyWith(error: e.toString());
//     }
//   }
//
//   void reset() {
//     state = _AuthState();
//   }
// }
//
//
// class _AuthState {
//   final String? verificationId;
//   final bool isCodeSent;
//   final User? user;
//   final String? error;
//
//   _AuthState({
//     this.verificationId,
//     this.isCodeSent = false,
//     this.user,
//     this.error,
//   });
//
//   _AuthState copyWith({
//     String? verificationId,
//     bool? isCodeSent,
//     User? user,
//     String? error,
//   }) {
//     return _AuthState(
//       verificationId: verificationId ?? this.verificationId,
//       isCodeSent: isCodeSent ?? this.isCodeSent,
//       user: user ?? this.user,
//       error: error ?? this.error,
//     );
//   }
// }final firebaseNotifierProvider =
// StateNotifierProvider<FirebaseNotifier, _AuthState>((ref) {
//   return FirebaseNotifier();
// });
//
// class PhoneAuthWidget extends ConsumerStatefulWidget {
//   const PhoneAuthWidget({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<PhoneAuthWidget> createState() => _PhoneAuthWidgetState();
// }
//
// class _PhoneAuthWidgetState extends ConsumerState<PhoneAuthWidget> {
//   final phoneController = TextEditingController();
//   final codeController = TextEditingController();
//   bool isCodeSent = false;
//   bool canResend = false;
//
//   void startResendTimer() {
//     setState(() => canResend = false);
//     Future.delayed(const Duration(seconds: 30), () {
//       setState(() => canResend = true);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(firebaseNotifierProvider);
//     final notifier = ref.read(firebaseNotifierProvider.notifier);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Phone Auth')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             if (!authState.isCodeSent) ...[
//               TextField(
//                 controller: phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(labelText: 'Phone Number'),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   notifier.sendOTP(phoneController.text.trim());
//                   startResendTimer();
//                 },
//                 child: const Text('Send Code'),
//               ),
//             ],
//             if (authState.isCodeSent) ...[
//               TextField(
//                 controller: codeController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(labelText: 'Enter OTP Code'),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   await notifier.verifyOTP(codeController.text.trim());
//
//                   if (ref.read(firebaseNotifierProvider).user != null) {
//                     print('✅ The code is correct: ${codeController.text}');
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Code is correct")),
//                     );
//                   } else {
//                     print('❌ The code is not correct');
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Code is not correct")),
//                     );
//                   }
//                 },
//                 child: const Text('Verify Code'),
//               ),
//               const SizedBox(height: 16),
//               TextButton(
//                 onPressed: canResend
//                     ? () {
//                   notifier.sendOTP(phoneController.text.trim());
//                   startResendTimer();
//                 }
//                     : null,
//                 child: Text(
//                   canResend ? 'Resend Code' : 'Wait to resend...',
//                 ),
//               ),
//             ],
//             if (authState.error != null)
//               Text(authState.error!, style: const TextStyle(color: Colors.red)),
//           ],
//         ),
//       ),
//     );
//   }
// }