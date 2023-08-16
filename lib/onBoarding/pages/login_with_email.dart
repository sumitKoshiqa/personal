import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final TextEditingController _emailController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      //   bottomNavigationBar: Container(
      //   height: 300,
      //   padding: EdgeInsets.only(bottom: MediaQuery.of (context).viewInsets.bottom),
      //   child: Stack(
      //     alignment: Alignment.bottomCenter,
      //     children: [
      //       Positioned(
      //         bottom: -60,
      //         child: Container(
      //           width: Get.width,
      //           height: 206,
      //           decoration: ShapeDecoration(
      //             color: Color(0xFFFFB032).withOpacity(0.1),
      //             shape: OvalBorder(),
      //           ),
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: ()async{
      //           // String stParam = getUserProfileParam();
      //           // print('stParam>>> ${jsonDecode(stParam)}');
      //           // await authController.userRegistration(jsonEncode(stParam));
      //         },
      //         child: Container(
      //           width: Get.width,
      //           height: 50,
      //           margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      //           decoration: ShapeDecoration(
      //             color: Color(0xFFFAA927),
      //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //           ),
      //           child: Row(
      //             mainAxisSize: MainAxisSize.min,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Text(
      //                 'SUBMIT',
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 16,
      //                   fontFamily: 'Roboto',
      //                   fontWeight: FontWeight.w600,
      //                   height: 1.75,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
        body: ListView(
          children: [
            Container(
              width: Get.width,
              height: Get.height/2.5,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Stack(
                children: [
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
            CustomSpacers.height24,
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextFieldPrimary(
                textEditingController: _emailController,
                color: Constants.lightGreen,
                hint: "Email Address",
                isEnabled: true,
                txtInputType: TextInputType.emailAddress,
                textLength: 100,
                imagePath: 'assets/your-account/mail.png',
              ),
            ),
            CustomSpacers.height44,
            GestureDetector(
              onTap: ()async{
                if(EmailValidator.validate(_emailController.text)){
                  authController.sendOTP(
                      email: _emailController.text,
                      isWeb: false
                  );
                  FocusScope.of(context).unfocus();
                }else{
                  ShowMessages().showSnackBarRed('Oops!!!',
                      'Please enter a valid email id.');
                }

                // String stParam = getUserProfileParam();
                // print('stParam>>> ${jsonDecode(stParam)}');
                // await authController.userRegistration(jsonEncode(stParam));
              },
              child: Container(
                width: Get.width,
                height: 50,
                margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                decoration: ShapeDecoration(
                  color: Color(0xFFFAA927),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'SUBMIT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 1.75,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
