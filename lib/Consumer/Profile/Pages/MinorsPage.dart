import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/ButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/app_entry_point/utils/Constants.dart';
import 'package:ekikrit/app_entry_point/utils/CustomSpacers.dart';
import 'package:ekikrit/app_entry_point/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinorsPage extends StatefulWidget {
  const MinorsPage({Key? key}) : super(key: key);

  @override
  State<MinorsPage> createState() => _MinorsPageState();
}

class _MinorsPageState extends State<MinorsPage> {

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

                  // your proxy title
                  Text("Minors",
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),
                  ),

                  CustomSpacers.height14,

                  // proxy list
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                image: CachedNetworkImageProvider("https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a2lkfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),

                      CustomSpacers.width10,

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("kid1@ekikrit.com",
                              style: Get.theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),
                            ),

                            CustomSpacers.height4,

                            Text("ID: 00458",
                              style: Get.theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),
                      ),

                      // drop down options
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert, color: Colors.grey,),
                        onSelected: (value){
                          print("Selected Value $value");
                        },
                        itemBuilder: (BuildContext context) {
                          return {'Act As', 'Delete'}.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice,
                                style: Get.theme.textTheme.titleMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),

          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage('assets/proxy-guardian/minor_illustration.png'),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: ButtonPrimary(onTap: (){
              CustomNavigator.pushTo(Routes.CONSUMER_CREATE_MINORS);
            }, buttonText: "Create"),
          )
        ],
      ),
    );
  }
}
