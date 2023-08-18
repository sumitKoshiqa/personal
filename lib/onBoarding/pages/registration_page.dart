import 'dart:convert';

import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
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
  String selectedGender = "Male";
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        layout: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children:  [
              vSpacer(8),
              const Header(),
              Expanded(
                child: ListView(
                  children: [
                    vSpacer(44),
                    Text(
                      'Registration with Email',
                      style: TextStyle(
                        color: Color(0xFF424141),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomSpacers.height24,
                    TextFieldPrimary(
                      textEditingController: _nameController,
                      color: Constants.lightOrange,
                      hint: "First Name",
                      isEnabled: true,
                      txtInputType: TextInputType.text,
                      textLength: 100,
                      imagePath: 'assets/your-account/name.png',
                    ),

                    CustomSpacers.height24,

                    TextFieldPrimary(
                      textEditingController: _lastNameController,
                      color: Constants.lightGreen,
                      hint: "Last Name",
                      isEnabled: true,
                      txtInputType: TextInputType.text,
                      textLength: 100,
                      imagePath: 'assets/your-account/name.png',
                    ),

                    CustomSpacers.height24,
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
                    CustomSpacers.height24,
                    TextFieldPrimary(
                      textEditingController: _phoneController,
                      color: Constants.lightOrange,
                      hint: "Phone",
                      isEnabled: true,
                      txtInputType: TextInputType.number,
                      textLength: 10,
                      imagePath: 'assets/your-account/phone.png',
                    ),

                  ],
                ),
              ),
              ButtonPrimary(
                  onTap: ()async{
                String stParam = getUserProfileParam();
                print('stParam>>> ${jsonDecode(stParam)}');
                await authController.userRegistration(
                  jsonParam: jsonEncode(stParam),
                  enteredPhone: _phoneController.text.trim().toString()
                );
              }, buttonText: "Submit"),
              vSpacer(16),



            ],
          ),
        )
    );

  }

  String getUserProfileParam() {
    String stParam = '{"name": {"firstName": "${_nameController.text.trim()}","lastName": "${_lastNameController.text.trim()}"},"email": "${PreferenceManager().getEmail()}","phone": {"countryCode": "+91","number": "${_phoneController.text.trim()}"},"gender": "${selectedGender.toUpperCase()}","relationshipType": "SELF","authenticationRequestDto": {"deviceId": "${prefServices.getDeviceId()}","appId": "${prefServices.getUniqueId()}"}}';
    return stParam;
  }
}
