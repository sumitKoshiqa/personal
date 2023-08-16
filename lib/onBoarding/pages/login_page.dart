import 'package:ekikrit/Common/utils/ApiEndPoints.dart';
import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import 'package:ekikrit/Common/utils/common_service_provider.dart';

import 'package:ekikrit/onBoarding/pages/registration_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String stWebViewURL = '';
  String stWebViewFBURL = '';

  @override
  void initState() {
    super.initState();
    stWebViewFBURL =  '${ApiEndPoints.baseUrl}authentication/user/login/facebook?client=ANDROID_APP&appId=${commonServices.getAppID()}&deviceId=${prefServices.getDeviceId()}';
    stWebViewURL = '${ApiEndPoints.baseUrl}authentication/user/login/google?client=ANDROID_APP&appId=${commonServices.getAppID()}&deviceId=${prefServices.getDeviceId()}';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: Get.width,
          height: Get.height,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 35,
                top: 396,
                child: Container(
                  width: 306,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFF7EB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 465,
                child: Container(
                  width: 306,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F9EC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 534,
                child: Container(
                  width: 306,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFF7EB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 603,
                child: Container(
                  width: 306,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F9EC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 95,
                top: 413,
                child: GestureDetector(
                  onTap: (){
                    Get.to(Registration());
                  },
                  child: Text(
                    'Continue with Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF424141),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 120,
                top: 356,
                child: Text(
                  'Create an account ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              Positioned(
                left: 99,
                top: 747,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Have an account? ',
                        style: TextStyle(
                          color: Color(0xFFFAB100),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                          color: Color(0xFFFAB100),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,

                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 31,
                top: 676,
                child: SizedBox(
                  width: 314,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By tapping Continue, you agree to our Terms and acknowledge that you have read our ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 1.42,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy, ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            height: 1.42,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 479,
                child: Container(
                  width: 24,
                  height: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: Stack(
                          children: [
                            // Positioned(
                            //   left: 0,
                            //   top: 0,
                            //   child: Container(
                            //     width: 24,
                            //     height: 24,
                            //     decoration: BoxDecoration(color: Colors.black),
                            //   ),
                            // ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: Stack(children: [
                                  Image.asset('assets/your-account/facebook.png')
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 94,
                top: 482,
                child: GestureDetector(
                  onTap: ()async{
                    if (kIsWeb) {
                      await commonServices.launch(
                          url: stWebViewFBURL,
                          isNewTab: false
                      );
                    }
                    else {
                      await commonServices.launch(
                          url: stWebViewFBURL,
                          isNewTab: false,
                          isInAppView: false
                      );
                    }
                  },
                  child: Text(
                    'Continue with Facebook',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF424141),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 94,
                top: 551,
                child: Text(
                  'Continue with Apple',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF424141),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 94,
                top: 620,
                child: Text(
                  'Continue with Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF424141),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 548,
                child: Container(
                  width: 24,
                  height: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: Stack(children: [
                                  Image.asset('assets/your-account/apple.png')
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 617,
                child: Container(
                  width: 24,
                  height: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: Stack(
                          children: [
                            // Positioned(
                            //   left: 0,
                            //   top: 0,
                            //   child: Container(
                            //     width: 24,
                            //     height: 24,
                            //     decoration: BoxDecoration(color: Colors.black),
                            //   ),
                            // ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: Stack(children: [
                                  Image.asset('assets/your-account/google.png')
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 51,
                top: 410,
                child: Container(
                  width: 24,
                  height: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 2,
                              top: 3.50,
                              child: Container(
                                width: 20,
                                height: 17,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/your-account/sms.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -72,
                top: -21,
                child: Opacity(
                  opacity: 0.10,
                  child: Container(
                    width: 520,
                    height: 206,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFB032),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: Get.width/3.5,
                top: 82,
                child: Image.asset('assets/images/onboarding/splash_logo.png',
                  height: 168,
                  width: 152,
                ),
              ),
              Positioned(
                left: 78,
                top: 256,
                child: Text(
                  '| Affordable | Personalized | Integrative |',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFAB100),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1.67,
                  ),
                ),
              ),
              Positioned(
                left: 47,
                top: 286,
                child: Text(
                  'Unleashing Full Potential In Chronic Conditions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF879C2E),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 1.43,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
