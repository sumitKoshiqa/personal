import 'package:ekikrit/Common/Widgets/InfoCardPrimary.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/app_entry_point/utils/Constants.dart';
import 'package:ekikrit/app_entry_point/utils/CustomSpacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LegalPolicyPage extends StatefulWidget {
  const LegalPolicyPage({Key? key}) : super(key: key);

  @override
  State<LegalPolicyPage> createState() => _LegalPolicyPageState();
}

class _LegalPolicyPageState extends State<LegalPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                NavBar(title: "Standards and Legal Policies",),
                
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListView(
                      children: [

                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "Terms and Conditions",
                          imagePath: 'assets/policy/terms.png',
                          buttonColor: Constants.lightGreen,
                        ),


                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "Privacy Policy",
                          imagePath: 'assets/policy/privacy.png',
                          buttonColor: Constants.lightOrange,
                        ),

                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "HIPPA Compliance",
                          imagePath: 'assets/policy/hippa.png',
                          buttonColor: Constants.lightOrange,
                        ),

                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "Cookie Policy",
                          imagePath: 'assets/policy/cookies.png',
                          buttonColor: Constants.lightGreen,
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
