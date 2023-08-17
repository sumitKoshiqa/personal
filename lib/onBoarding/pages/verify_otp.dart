import 'dart:async';
import 'dart:convert';

import 'package:ekikrit/Common/Widgets/header.dart';
import 'package:ekikrit/Common/Widgets/text_field_custom_pin.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import 'package:ekikrit/Common/utils/common_service_provider.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final AuthController authController = Get.put(AuthController());
  String email = '';
  String phone = '';
  int _otpCodeLength = 6;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  int _start = 59;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late Timer _timer;
  final _globalKey = GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    final arguments = Get.arguments as Map<String, dynamic>;
    email = arguments['email'];
    authController.start.value = 30;
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    // SmsVerification.stopListening();
    SmsAutoFill().unregisterListener();
  }

  void startTimer() async {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (_timer) {
        if (_start == 0) {
          setState(() {
            _timer.cancel();
          });
        } else {
          if (mounted) {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = true;
      _enableButton = false;
      _verifyOtpCode();
    });
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;

      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  void enableButton() {
    setState(() {
      _isLoadingButton = false;
      _enableButton = true;
    });
  }

  _verifyOtpCode() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    authController.verifyOTP(email: email, otp: _otpCode);
  }

  _onClickRetry() {
    // _startListeningSms();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Constants.accentOrange),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        key: _globalKey,
        child: Scaffold(
            key: _scaffoldKey,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSpacer(44),
                    Header(),
                    vSpacer(24),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Text(
                        'Verification',
                        style: TextStyle(
                          color: Color(0xFF424141),
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CustomSpacers.height24,
                    Center(
                      child: Image.asset(
                        'assets/images/onboarding/ic_verify_otp.png',
                        height: 98,
                      ),
                    ),
                    vSpacer(24),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Center(
                        child: Text(
                          'An OTP has been sent to your email address $email',
                          style: TextStyle(
                            color: Color(0xFF424141),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    CustomSpacers.height44,
                    Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 20.0,
                          right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          if (phone != '')
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    'OTP from $phone',
                                    style: TextStyle(
                                      color: Color(0xFF424141),
                                      fontSize: 13,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                vSpacer(8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: MyTextFieldPin(
                                    filled: true,
                                    filledColor: Constants.accentOrange,
                                    codeLength: _otpCodeLength,
                                    boxSize: 60,
                                    filledAfterTextChange: true,
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    borderStyle: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5)),
                                    onOtpCallback: (code, isAutofill) =>
                                        _onOtpCallBack(code, isAutofill),
                                  ),
                                ),
                                vSpacer(24),
                                Center(
                                  child: GestureDetector(
                                    child: Text(
                                      (_start == 0)
                                          ? 'Resend OTP'
                                          : (_start < 10)
                                              ? '(00:0$_start)'
                                              : '(00:$_start)',
                                      style: GoogleFonts.mavenPro(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: (_start == 0)
                                              ? Constants.accentOrange
                                              : Color(0xFF9E9FA9)),
                                    ),
                                    onTap: () async {
                                      authController.resendOTP(
                                        phone: phone,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          if (phone != '') CustomSpacers.height24,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  'OTP from $email',
                                  style: TextStyle(
                                    color: Color(0xFF424141),
                                    fontSize: 13,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              vSpacer(8),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: MyTextFieldPin(
                                  filled: true,
                                  filledColor: Constants.accentOrange,
                                  codeLength: _otpCodeLength,
                                  boxSize: 60,
                                  filledAfterTextChange: true,
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  borderStyle: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  onOtpCallback: (code, isAutofill) =>
                                      _onOtpCallBack(code, isAutofill),
                                ),
                              ),
                              vSpacer(24),
                              Center(
                                child: GestureDetector(
                                  child: Text(
                                    (_start == 0)
                                        ? 'Resend OTP'
                                        : (_start < 10)
                                            ? '(00:0$_start)'
                                            : '(00:$_start)',
                                    style: GoogleFonts.mavenPro(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: (_start == 0)
                                            ? Constants.accentOrange
                                            : Color(0xFF9E9FA9)),
                                  ),
                                  onTap: () async {
                                    authController.resendOTP(
                                      phone: phone,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          CustomSpacers.height24,
                          Container(
                            height: 44,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: _isLoadingButton
                                    ? Colors.white
                                    : Colors.grey[200],
                                border: Border.all(
                                  color: _isLoadingButton
                                      ? Colors.white
                                      : Colors.grey[200]!,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: MaterialButton(
                              onPressed: _enableButton ? _onSubmitOtp : null,
                              child: _setUpButtonChild(),
                              color: Constants.accentOrange,
                              disabledColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verify",
        style: GoogleFonts.mavenPro(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      );
    }
  }
}
