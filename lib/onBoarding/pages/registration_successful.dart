import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/ButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/header.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/common_service_provider.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationSuccessful extends StatelessWidget {
  const RegistrationSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        layout: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomSpacers.height24,
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Header(),
                  ),
                  CustomSpacers.height28,
                  Center(
                    child: Text(
                      'Verification',
                      style: TextStyle(
                        color: Color(0xFF424141),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CustomSpacers.height32,
                  Image.asset(
                    'assets/images/onboarding/ic_verfication.png',
                    height: 110,
                    width: 110,
                  ),
                  CustomSpacers.height32,
                  Center(
                    child: Text(
                      'Account Successfully Created!',
                      style: TextStyle(
                        color: Color(0xFF424141),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: ButtonPrimary(
                      onTap: (){
                        CustomNavigator.pushReplace(Routes.LINK_ACCOUNT);
                      }, buttonText: "Link Account"),
                ),
              ],
            ),
            vSpacer(24),

          ],
        )
    );
  }
}
