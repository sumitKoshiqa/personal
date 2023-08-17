import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_field/date_field.dart';
import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/ButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:ekikrit/Consumer/Profile/Controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchMinor extends StatefulWidget {
  const SearchMinor({Key? key}) : super(key: key);

  @override
  State<SearchMinor> createState() => _SearchMinorState();
}

class _SearchMinorState extends State<SearchMinor> {

  TextEditingController etSsn = TextEditingController();
  TextEditingController etDob = TextEditingController(text: DateFormat("yyyy-MM-dd").format(DateTime.now()));
  TextEditingController etZip = TextEditingController();

  ProfileController profileController = Get.put(ProfileController());

  DateTime selectedDate = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      layout: Stack(
        children: [

          Column(
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
                        isEnabled: false,
                        onTap: (){
                          _selectDate(context);
                        },
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
                child: ButtonPrimary(onTap: (){
                  if (etSsn.text.isNotEmpty && etZip.text.isNotEmpty){
                    profileController.searchMinor(
                      ssn: etSsn.text,
                      zipcode: etZip.text,
                      dob: DateFormat("yyyy-MM-dd").format(selectedDate)
                    );
                  }
                }, buttonText: "Search"),
              )
            ],
          ),
        ],
      ),
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
      etDob.text = DateFormat("yyyy-MM-dd").format(selectedDate);
      print("Selected date ${DateFormat("yyyy-MM-dd").format(selectedDate)}");
    }
  }
}
