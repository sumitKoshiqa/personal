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

class CreateProxy extends StatefulWidget {
  const CreateProxy({Key? key}) : super(key: key);

  @override
  State<CreateProxy> createState() => _CreateProxyState();
}

class _CreateProxyState extends State<CreateProxy> {

  TextEditingController etEmail = TextEditingController();
  TextEditingController etPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      layout: Column(
        children: [

          const NavBar(title: "Create Proxy"),

          CustomSpacers.height4,

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [

                  Text("Search Your Proxy",
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),
                  ),

                  CustomSpacers.height14,


                  TextFieldPrimary(
                    textEditingController: etPhone,
                    color: Constants.lightOrange,
                    hint: "Phone",
                    isEnabled: true,
                    imagePath: 'assets/your-account/phone.png',
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etEmail,
                    color: Constants.lightGreen,
                    hint: "Email Address",
                    isEnabled: true,
                    imagePath: 'assets/your-account/mail.png',
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
