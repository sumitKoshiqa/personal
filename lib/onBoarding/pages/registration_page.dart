import 'dart:convert';

import 'package:ekikrit/Common/Widgets/option_selector.dart';
import 'package:ekikrit/app_entry_point/utils/Constants.dart';
import 'package:ekikrit/app_entry_point/utils/PreferenceManager.dart';
import 'package:ekikrit/app_entry_point/utils/common_service_provider.dart';
import 'package:ekikrit/Common/Widgets/header.dart';
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
  String selectedGender = "Male";
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
                    vSpacer(15),
                    TextFormField(
                      controller: _nameController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      style: TextStyle(
                          fontSize: Constants.fontSizeText,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        fillColor: Color(0xFFFFF7EB),
                        prefixIcon: Icon(
                          Icons.manage_accounts_outlined
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                               Radius.circular(10),
                              ),
                          borderSide: BorderSide(
                              width: 10,
                              // style: BorderStyle.solid,
                              color: Color(0xFFFFF7EB)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFF9A826), width: 1),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                    vSpacer(24),
                    TextFormField(
                      controller: _lastNameController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      style: TextStyle(
                          fontSize: Constants.fontSizeText,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'last Name',
                        fillColor: Color(0xFF7A992D).withOpacity(0.1),
                        prefixIcon: Icon(
                            Icons.manage_accounts_outlined
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                              width: 1,
                              // style: BorderStyle.solid,
                              color: Color(0xFF7A992D)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(

                              color: Color(0xFF7A992D), width: 1),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                    vSpacer(24),
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
                    vSpacer(24),
                    TextFormField(
                      controller: _emailController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {},
                      style: TextStyle(
                          fontSize: Constants.fontSizeText,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Color(0xFF7A992D).withOpacity(0.1),
                        prefixIcon: Icon(
                            Icons.email_outlined
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                              width: 1,
                              // style: BorderStyle.solid,
                              color: Color(0xFF7A992D)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(

                              color: Color(0xFF7A992D), width: 1),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                      ),

                    ),
                    vSpacer(24),
                    TextFormField(
                      controller: _phoneController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      style: TextStyle(
                          fontSize: Constants.fontSizeText,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        fillColor: Color(0xFFFFF7EB),
                        prefixIcon: Icon(
                            Icons.phone
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                              width: 20,
                              // style: BorderStyle.solid,
                              color: Color(0xFFFFF7EB)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFF9A826), width: 1),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                      ),
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
