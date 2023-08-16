import 'package:ekikrit/Common/Widgets/header.dart';
import 'package:ekikrit/app_entry_point/utils/common_service_provider.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:flutter/cupertino.dart';
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
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
          body: Column(

          ),
        )
    );
  }
}
