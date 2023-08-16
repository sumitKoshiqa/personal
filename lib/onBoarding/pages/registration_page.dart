import 'dart:convert';

import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/Common/Widgets/option_selector.dart';
import 'package:ekikrit/Common/Widgets/header.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import 'package:ekikrit/Common/utils/common_service_provider.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  List<String> genderList = ["Male", "Female"];
  String selectedGender = "MALE";
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 300,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: -60,
                  child: Container(
                    width: Get.width,
                    height: 206,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFB032).withOpacity(0.1),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                    String stParam = getUserProfileParam();
                    print('stParam>>> ${jsonDecode(stParam)}');
                    await authController.userRegistration(jsonEncode(stParam));
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

          body: Column(
            children:  [
              vSpacer(16),
              const Header(),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    vSpacer(24),
                    Text(
                      'Registration with Email',
                      style: TextStyle(
                        color: Color(0xFF424141),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomSpacers.height14,

                    TextFieldPrimary(
                      textEditingController: _lastNameController,
                      color: Constants.lightOrange,
                      hint: "First Name",
                      isEnabled: true,
                      imagePath: 'assets/your-account/name.png',
                    ),

                    CustomSpacers.height14,

                    TextFieldPrimary(
                      textEditingController: _lastNameController,
                      color: Constants.lightGreen,
                      hint: "Last Name",
                      isEnabled: true,
                      imagePath: 'assets/your-account/name.png',
                    ),

                    CustomSpacers.height14,
                    OptionSelector(
                        selectedOption: selectedGender,
                        options: genderList,
                        bgColor: 0xFFFFF7EB,
                        setNewValue: (val) {
                          setState(() {
                            selectedGender = val;
                          });
                        }
                    ),
                    CustomSpacers.height14,

                    TextFieldPrimary(
                      textEditingController: _emailController,
                      color: Constants.lightGreen,
                      hint: "Email Address",
                      isEnabled: true,
                      imagePath: 'assets/your-account/mail.png',
                    ),

                    CustomSpacers.height14,

                    TextFieldPrimary(
                      textEditingController: _phoneController,
                      color: Constants.lightOrange,
                      hint: "Phone",
                      isEnabled: true,
                      imagePath: 'assets/your-account/phone.png',
                    ),

                  ],
                ),
              ),



            ],
          ),
        )
    );
  }

  String getUserProfileParam() {
    String stParam = '''{
      "name": {
        "firstName": "${_nameController.text.trim()}",
        "lastName": "${_lastNameController.text.trim()}"
      },
      "email": "${_emailController.text.trim()}",
      "phone": {
        "countryCode": "+91",
        "number": "${_phoneController.text.trim()}"
      },
      "gender": "${selectedGender.toUpperCase()}",
      "relationshipType": "SELF",
      "attribute": {
        "additionalProp1": "string",
        "additionalProp2": "string",
        "additionalProp3": "string"
      },
      "profileImage": {
        "url": "string",
        "id": "string"
      },
      "imageList": [
        {
          "url": "string",
          "id": "string"
        }
      ],
      "authenticationRequestDto": {
        "deviceId": "${prefServices.getDeviceId()}",
        "appId": "${prefServices.getUniqueId()}",
        "captchaRequest": {
          "captchaProviderEnum": "GOOGLE",
          "response": "string"
        }
      }
    }''';
    return stParam;
  }
}
