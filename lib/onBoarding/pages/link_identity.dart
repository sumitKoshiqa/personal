import 'dart:convert';

import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/Common/Widgets/header.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/common_service_provider.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LinkIdentity extends StatefulWidget {
  const LinkIdentity({super.key});

  @override
  State<LinkIdentity> createState() => _LinkIdentityState();
}

class _LinkIdentityState extends State<LinkIdentity> {
  TextEditingController ssnController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  String birthDateInStringDisplay='';
  String birthDateInStringParam='';
  DateTime birthDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        layout: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomSpacers.height24,
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Header(),
                  ),
                  CustomSpacers.height24,
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: Text(
                      'Link Identity',
                      style: TextStyle(
                        color: Color(0xFF424141),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CustomSpacers.height24,
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: TextFieldPrimary(
                      textEditingController: ssnController,
                      color: Constants.lightOrange,
                      hint: "Last 4 digit of SSN",
                      isEnabled: true,
                      txtInputType: TextInputType.text,
                      textLength: 100,
                      imagePath: 'assets/images/onboarding/ic_ssn.png',
                    ),
                  ),
                  CustomSpacers.height24,
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: InkWell(
                      onTap: ()async{
                        final datePick= await showDatePicker(
                            context: context,
                            initialDate:  DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,),
                            firstDate:  DateTime(1900),
                            lastDate:  DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,),
                        );
                        if(datePick!=null && datePick!=birthDate){
                          setState(() {
                            birthDate=datePick;
                            birthDateInStringDisplay = DateFormat('dd MMM, yyyy').format(birthDate);
                            birthDateInStringParam = DateFormat('yyyy-MM-dd').format(birthDate);
                            dobController.text = birthDateInStringDisplay;

                          });
                        }

                      },
                      child: TextFieldPrimary(
                        textEditingController: dobController,
                        color: Constants.lightOrange,
                        hint: "Date of birth",
                        isEnabled: false,
                        txtInputType: TextInputType.text,
                        imagePath: 'assets/images/onboarding/calendar.png',
                      ),
                    ),
                  ),
                  CustomSpacers.height24,
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: TextFieldPrimary(
                      textEditingController: zipCodeController,
                      color: Constants.lightOrange,
                      hint: "Zip Code",
                      isEnabled: true,
                      txtInputType: TextInputType.text,
                      textLength: 6,
                      imagePath: 'assets/images/onboarding/ic_zipcode.png',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: ButtonPrimary(
                  onTap: ()async{
                    String stParam = getUserIdentityParam();
                    print('stParam>>> ${jsonDecode(stParam)}');
                    await authController.linkIdentity(
                        jsonParam: jsonEncode(stParam),
                    );
                  }, buttonText: "Link Account"),
            ),
            CustomSpacers.height24,


          ],
        )
    );
  }

  String getUserIdentityParam() {
    String stParam = '{"ssn": "${ssnController.text.trim().toString()}","zipCode": "${zipCodeController.text.trim().toString()}","dob": "$birthDateInStringParam"}';
    return stParam;
  }
}
