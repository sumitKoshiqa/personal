import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/ButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/app_entry_point/utils/Constants.dart';
import 'package:ekikrit/app_entry_point/utils/CustomSpacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateMinor extends StatefulWidget {
  const CreateMinor({Key? key}) : super(key: key);

  @override
  State<CreateMinor> createState() => _CreateMinorState();
}

class _CreateMinorState extends State<CreateMinor> {

  TextEditingController etSsn = TextEditingController();
  TextEditingController etDob = TextEditingController();
  TextEditingController etZip = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      layout: Column(
        children: [

          const NavBar(title: "Minors"),

          CustomSpacers.height4,

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [

                  Text("Search Your Minors",
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etDob,
                    color: Constants.lightGreen,
                    hint: "Date of Birth",
                    isEnabled: true,
                    imagePath: 'assets/your-account/dob.png',
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etSsn,
                    color: Constants.lightOrange,
                    hint: "Last 4 digit of SSN",
                    isEnabled: true,
                    imagePath: 'assets/your-account/ssn.png',
                  ),


                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etZip,
                    color: Constants.lightGreen,
                    hint: "Zip Code",
                    isEnabled: true,
                    imagePath: 'assets/your-account/zip.png',
                  ),

                  CustomSpacers.height18,

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: ButtonPrimary(onTap: (){}, buttonText: "Create"),
          )
        ],
      ),
    );
  }
}
