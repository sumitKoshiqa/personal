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
  DateTime selectedDate = DateTime.now();
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
                    child: TextFieldPrimary(
                      textEditingController: dobController,
                      color: Constants.lightGreen,
                      hint: "Date of Birth",
                      isEnabled: false,
                      onTap: (){
                        _selectDate(context);
                      },
                      imagePath: 'assets/your-account/dob.png',
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      dobController.text = DateFormat("yyyy-MM-dd").format(selectedDate);
      print("Selected date ${DateFormat("yyyy-MM-dd").format(selectedDate)}");
    }
  }

  String getUserIdentityParam() {
    String stParam = '{"ssn": "${ssnController.text.trim().toString()}","zipCode": "${zipCodeController.text.trim().toString()}","dob": "${DateFormat("yyyy-MM-dd").format(selectedDate)}"}';
    return stParam;
  }
}
