import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourAccount extends StatefulWidget {
  const YourAccount({Key? key}) : super(key: key);

  @override
  State<YourAccount> createState() => _YourAccountState();
}

class _YourAccountState extends State<YourAccount> {

  TextEditingController etFirstName = TextEditingController(text: "Ashwani");
  TextEditingController etLastName = TextEditingController(text: "Janu");
  TextEditingController etGender = TextEditingController(text: "Male");
  TextEditingController etEmail = TextEditingController(text: "ashwani.janu@gmail.com");
  TextEditingController etPhone = TextEditingController(text: "+1 9034347349");
  TextEditingController etSsn = TextEditingController(text: "xxx-xx-0931");
  TextEditingController etDob = TextEditingController(text: "02/02/1990");
  TextEditingController etZip = TextEditingController(text: "78344");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [

                const NavBar(title: "Your Account"),

                CustomSpacers.height14,

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: ListView(
                      children: [

                        // profile pic and update button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            // self image
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 30,
                              backgroundImage: CachedNetworkImageProvider("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                            ),

                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 30,
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Constants.lightGreen,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Constants.accentGreen)
                                ),
                                child: Center(
                                  child: Text("Update Profile",
                                    style: Get.theme.textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        CustomSpacers.height14,

                        TextFieldPrimary(
                          textEditingController: etFirstName,
                          color: Constants.lightOrange,
                          hint: "First Name",
                          imagePath: 'assets/your-account/name.png',
                        ),

                        CustomSpacers.height14,

                        TextFieldPrimary(
                          textEditingController: etLastName,
                          color: Constants.lightGreen,
                          hint: "Last Name",
                          imagePath: 'assets/your-account/name.png',
                        ),

                        CustomSpacers.height14,

                        TextFieldPrimary(
                          textEditingController: etGender,
                          color: Constants.lightOrange,
                          hint: "Gender",
                          imagePath: 'assets/your-account/name.png',
                        ),

                        CustomSpacers.height14,

                        TextFieldPrimary(
                          textEditingController: etEmail,
                          color: Constants.lightGreen,
                          hint: "Email Address",
                          imagePath: 'assets/your-account/mail.png',
                        ),

                        CustomSpacers.height14,

                        TextFieldPrimary(
                          textEditingController: etPhone,
                          color: Constants.lightOrange,
                          hint: "Phone",
                          imagePath: 'assets/your-account/phone.png',
                        ),

                        CustomSpacers.height18,


                        Text("This information is fetched from your EMR-EHR",
                          style: Get.theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                              fontSize: 12
                          ),
                        ),

                        CustomSpacers.height18,

                        TextFieldPrimary(
                          textEditingController: etSsn,
                          color: Constants.lightGreen,
                          hint: "Last 4 digit of SSN",
                          imagePath: 'assets/your-account/ssn.png',
                        ),

                        CustomSpacers.height14,

                        TextFieldPrimary(
                          textEditingController: etDob,
                          color: Constants.lightOrange,
                          hint: "Date of Birth",
                          imagePath: 'assets/your-account/dob.png',
                        ),

                        CustomSpacers.height14,

                        TextFieldPrimary(
                          textEditingController: etZip,
                          color: Constants.lightGreen,
                          hint: "Zip Code",
                          imagePath: 'assets/your-account/zip.png',
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
