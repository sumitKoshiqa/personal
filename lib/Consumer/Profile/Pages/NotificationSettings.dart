import 'package:ekikrit/Common/Widgets/InfoCardPrimary.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [

                const NavBar(title: "Notification Settings",),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListView(
                      children: [

                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "Proxy Addition",
                          imagePath: 'assets/notification/proxy-add.png',
                          buttonColor: Constants.lightOrange,
                        ),

                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "Message From Doctor Staff",
                          imagePath: 'assets/notification/message.png',
                          buttonColor: Constants.lightGreen,
                        ),

                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "New Doctor Recommendation",
                          imagePath: 'assets/notification/recommendation.png',
                          buttonColor: Constants.lightOrange,
                        ),

                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "Journal Entry",
                          imagePath: 'assets/notification/journal.png',
                          buttonColor: Constants.lightGreen,
                        ),

                        CustomSpacers.height14,

                        InfoCardPrimary(
                          onTap: (){},
                          title: "Redeemable Points",
                          imagePath: 'assets/notification/journal.png',
                          buttonColor: Constants.lightOrange,
                        ),



                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
