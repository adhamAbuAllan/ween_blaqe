import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
import '../../constants/localization.dart';
import '../../controller/provider_controllers/providers/color_provider.dart';
import '../common_widgets/button_widgets/back_button_widget.dart';
import '../common_widgets/button_widgets/elevated_button_widget.dart';

class OtpVerificationUi extends ConsumerStatefulWidget {
  const OtpVerificationUi({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  ConsumerState<OtpVerificationUi> createState() => _OtpVerificationUiState();
}

class _OtpVerificationUiState extends ConsumerState<OtpVerificationUi> {
  String _otp = '';
  bool _showError = false;

  void _submitOtp() {
    final code = _otp.trim();
    if (code.length < 6) {
      setState(() => _showError = true);
      return;
    }

    Navigator.of(context).pop(code);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeModeNotifier);
    final theme = ref.read(themeModeNotifier.notifier);
    final primaryColor = theme.primaryTheme(ref: ref);
    final textColor = theme.textTheme(ref: ref);
    final mutedTextColor = theme.textTheme(ref: ref, withOpacity: 0.62);
    final isSmallScreen = getIt<AppDimension>().isSmallScreen(context);
    final enabledBorderColor = primaryColor.withAlpha(30);

    return ColorfulSafeArea(
      color: primaryColor,
      bottomColor: Colors.transparent,
      child: Scaffold(
        backgroundColor: theme.backgroundAppTheme(ref: ref),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.backgroundAppTheme(ref: ref),
          leading: BackButtonWidget(
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            SetLocalization.of(context)!.getTranslateValue('create_account'),
            style: TextStyle(
              color: textColor,
              fontSize: isSmallScreen ? 18 : 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 24 : 28,
              ),
              child: Column(
                children: [
                  SizedBox(height: isSmallScreen ? 34 : 52),
                  Text(
                    SetLocalization.of(context)!.getTranslateValue('otp_code'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: isSmallScreen ? 26 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${SetLocalization.of(context)!.getTranslateValue('otp_sent_to')} ${widget.phoneNumber}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mutedTextColor,
                      fontSize: isSmallScreen ? 14 : 16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 58 : 72),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      const fieldsCount = 6;
                      final availableWidth = constraints.maxWidth;
                      final maxFieldWidth = isSmallScreen ? 42.0 : 47.0;
                      final fieldWidth = (availableWidth / fieldsCount).clamp(
                        34.0,
                        maxFieldWidth,
                      );

                      return Directionality(
                        textDirection: TextDirection.ltr,
                        child: OtpTextField(
                          numberOfFields: fieldsCount,
                          autoFocus: true,
                          showFieldAsBox: true,
                          borderRadius: BorderRadius.circular(8),
                          fieldWidth: fieldWidth,
                          fieldHeight: fieldWidth,
                          margin: EdgeInsets.zero,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          borderWidth: 1.4,
                          borderColor: mutedTextColor,
                          focusedBorderColor: primaryColor,
                          enabledBorderColor: enabledBorderColor,
                          cursorColor: primaryColor,
                          keyboardType: TextInputType.number,
                          contentPadding: EdgeInsets.zero,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textStyle: TextStyle(
                            color: textColor,
                            fontSize: fieldWidth < 38 ? 16 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                          onCodeChanged: (value) {
                            _otp = value;
                            if (_showError && value.length == fieldsCount) {
                              setState(() => _showError = false);
                            }
                          },
                          onSubmit: (value) {
                            _otp = value;
                            _submitOtp();
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 180),
                    child: _showError
                        ? Text(
                            SetLocalization.of(context)!
                                .getTranslateValue('invalid_otp_code'),
                            key: const ValueKey('otp-error'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontFamily: 'Cairo',
                            ),
                          )
                        : const SizedBox(height: 18),
                  ),
                  SizedBox(height: isSmallScreen ? 48 : 64),
                  SizedBox(
                    width: double.infinity,
                    height: isSmallScreen ? 50 : 55,
                    child: ElevatedButtonWidget(
                      context: context,
                      onPressed: _submitOtp,
                      child: Text(
                        SetLocalization.of(context)!
                            .getTranslateValue('verify'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
