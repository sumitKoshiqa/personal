import 'package:ekikrit/app_entry_point/utils/PreferenceManager.dart';
import 'package:ekikrit/app_entry_point/utils/get_device_id.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: Get.width / 3,
                  image: const AssetImage("assets/images/onboarding/splash_logo.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  checkLogin() async{
    String? deviceId = await GetDeviceId().getId();
    PreferenceManager().saveDeviceId(deviceId: deviceId!);
    Future.delayed(const Duration(milliseconds: 500), () {
      authController.checkIfLoggedIn();
    });
    PreferenceManager().clearLogs();
  }

  @override
  void initState() {
    print("splash===>");
    super.initState();
    checkLogin();
  }
}
