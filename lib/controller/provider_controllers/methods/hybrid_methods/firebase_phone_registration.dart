import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/localization.dart';
import '../../providers/auth_provider.dart';
import '../../../../view/authorization_ui/otp_verification_ui.dart';

class FirebasePhoneRegistration {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> verifyPhoneAndRegister({
    required WidgetRef ref,
    required BuildContext context,
    required String name,
    required String phone,
    required String password,
    required int typeId,
    required int universityId,
  }) async {
    var registrationStarted = false;
    final firebasePhone = phone.startsWith('+') ? phone : '+$phone';
    final languageCode = Localizations.localeOf(context).languageCode;
    final verificationFailedMessage = SetLocalization.of(context)!
        .getTranslateValue('phone_verification_failed');

    Future<void> finishRegistration(PhoneAuthCredential credential) async {
      if (registrationStarted) return;
      registrationStarted = true;

      ref.read(isPhoneOtpLoading.notifier).state = true;
      try {
        final userCredential = await _auth.signInWithCredential(credential);
        final firebaseIdToken = await userCredential.user?.getIdToken();
        if (firebaseIdToken == null || firebaseIdToken.isEmpty) {
          throw FirebaseAuthException(code: 'missing-id-token');
        }
        if (!context.mounted) return;

        await ref.read(registerNotifier.notifier).register(
              name,
              phone,
              password,
              typeId,
              universityId,
              firebaseIdToken,
              ref,
              context,
            );
      } on FirebaseAuthException catch (error) {
        if (!context.mounted) return;
        _setPhoneError(ref, context, _messageForFirebaseError(context, error));
      } catch (_) {
        if (!context.mounted) return;
        _setPhoneError(ref, context, verificationFailedMessage);
      } finally {
        ref.read(isPhoneOtpLoading.notifier).state = false;
      }
    }

    ref.read(isPhoneOtpLoading.notifier).state = true;

    try {
      await _auth.setLanguageCode(languageCode);

      await _auth.verifyPhoneNumber(
        phoneNumber: firebasePhone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (credential) async {
          await finishRegistration(credential);
        },
        verificationFailed: (error) {
          ref.read(isPhoneOtpLoading.notifier).state = false;
          _setPhoneError(
              ref, context, _messageForFirebaseError(context, error));
        },
        codeSent: (verificationId, forceResendingToken) async {
          ref.read(isPhoneOtpLoading.notifier).state = false;
          if (!context.mounted || registrationStarted) return;

          final smsCode = await _showOtpPage(context, firebasePhone);
          if (smsCode == null || smsCode.length < 6 || registrationStarted) {
            return;
          }

          final credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );
          await finishRegistration(credential);
        },
        codeAutoRetrievalTimeout: (_) {
          ref.read(isPhoneOtpLoading.notifier).state = false;
        },
      );
    } on FirebaseAuthException catch (error) {
      ref.read(isPhoneOtpLoading.notifier).state = false;
      if (!context.mounted) return;
      _setPhoneError(ref, context, _messageForFirebaseError(context, error));
    } catch (_) {
      ref.read(isPhoneOtpLoading.notifier).state = false;
      if (!context.mounted) return;
      _setPhoneError(ref, context, verificationFailedMessage);
    }
  }

  static void _setPhoneError(
    WidgetRef ref,
    BuildContext context,
    String message,
  ) {
    ref.read(formFieldsNotifier.notifier).updateApiErrors({
      'phoneNumberRegistration': message,
    });

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static String _messageForFirebaseError(
    BuildContext context,
    FirebaseAuthException error,
  ) {
    final localization = SetLocalization.of(context)!;

    switch (error.code) {
      case 'invalid-phone-number':
        return localization
            .getTranslateValue('the_phone_number_is_not_suitable');
      case 'invalid-verification-code':
      case 'invalid-verification-id':
        return localization.getTranslateValue('invalid_otp_code');
      case 'too-many-requests':
        return localization.getTranslateValue('too_many_otp_requests');
      case 'network-request-failed':
        return localization.getTranslateValue('no_internet');
      default:
        return localization.getTranslateValue('phone_verification_failed');
    }
  }

  static Future<String?> _showOtpPage(
    BuildContext context,
    String firebasePhone,
  ) async {
    return Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => OtpVerificationUi(phoneNumber: firebasePhone),
      ),
    );
  }
}
