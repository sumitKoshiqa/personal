import 'package:ekikrit/Common/Widgets/header.dart';
import 'package:ekikrit/app_entry_point/utils/common_service_provider.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final AuthController authController = Get.put(AuthController());
  String phone = '';
  @override
  void initState() {

    final arguments = Get.arguments as Map<String, dynamic>;
    phone = arguments['phone'];
    authController.start.value = 30;
    authController.startTimer();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              vSpacer(24),
              Header(),
              vSpacer(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter the 6-digit OTP we sent to",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(phone,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 50,),

              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.black,
                showFieldAsBox: false,
                showCursor: true,
                borderWidth: 2,
                autoFocus: true,
                keyboardType: TextInputType.phone,
                enabledBorderColor: Colors.grey.shade700,
                focusedBorderColor: Colors.green,
                textStyle: theme.textTheme.bodyMedium,
                onCodeChanged: (String code) {
                },
                handleControllers: (controllers) {
                  //get all textFields controller, if needed
                  controls = controllers;
                },
                onSubmit: (String verificationCode){
                  authController.verifyOTP(
                      phone: phone,
                      otp: verificationCode
                  );
                }, // end onSubmit
              ),

              const SizedBox(height: 40,),

              !authController.allowRetry.value ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Retry in ${authController.start.value}",
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ): Container(),

              authController.allowRetry.value ? CupertinoButton(
                onPressed: ()async{
                  await authController.generateToken();
                  authController.resendOTP(
                    phone: phone,
                  );

                },
                child: Text("Resend OTP",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ): Container(),


              const SizedBox(height: 20,),


            ],
          ),
        )
    )
  }
}
