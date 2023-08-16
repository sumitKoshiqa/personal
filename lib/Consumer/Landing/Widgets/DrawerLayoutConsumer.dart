import 'package:ekikrit/Common/Widgets/BackButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/InfoCardPrimary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrawerLayoutConsumer extends StatefulWidget {
  const DrawerLayoutConsumer({Key? key}) : super(key: key);

  @override
  State<DrawerLayoutConsumer> createState() => _DrawerLayoutConsumerState();
}

class _DrawerLayoutConsumerState extends State<DrawerLayoutConsumer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: Get.height,
      width: Get.width,
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [

          CustomSpacers.height8,

          // nav bar
          Container(
            height: 40,
            width: Get.width,
            child: Row(
              children: [

                Expanded(
                  child: Row(
                    children: [
                      const BackButtonSecondary(),

                      Text("Menu",
                        style: Get.theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                TextButton(
                  onPressed: (){},
                  child:  Text("Act as Self",
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Constants.accentGreen
                    ),
                  ),
                )



              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [

                CustomSpacers.height14,

                // acting as
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    // self info
                    Column(
                      children: [

                        // self image
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,
                          backgroundImage: CachedNetworkImageProvider("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                        ),

                        CustomSpacers.height8,

                        Text("Smith Paul",
                          style: Get.theme.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text("ID: 09434",
                          style: Get.theme.textTheme.titleSmall,
                        ),
                      ],
                    ),

                    Text("(Acting As)",
                      style: Get.theme.textTheme.titleMedium!.copyWith(
                        color: Colors.grey.shade700,
                        fontSize: 13,
                        fontWeight: FontWeight.w400
                      ),
                    ),

                    // acting info
                    Column(
                      children: [

                        // self image
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,
                          backgroundImage: CachedNetworkImageProvider("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                        ),

                        CustomSpacers.height8,

                        Text("Smith Paul",
                          style: Get.theme.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text("ID: 09434",
                          style: Get.theme.textTheme.titleSmall,
                        ),
                      ],
                    ),

                  ],
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){
                    CustomNavigator.pushTo(Routes.CONSUMER_ACCOUNT);
                  },
                  title: "Your Account",
                  imagePath: 'assets/drawer-consumer/account.png',
                  buttonColor: Constants.lightOrange,
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){},
                  title: "Order",
                  imagePath: 'assets/drawer-consumer/order.png',
                  buttonColor: Constants.lightGreen,
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){},
                  title: "Membership & Subscription",
                  imagePath: 'assets/drawer-consumer/member.png',
                  buttonColor: Constants.lightOrange,
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){},
                  title: "Customer Service",
                  imagePath: 'assets/drawer-consumer/support.png',
                  buttonColor: Constants.lightGreen,
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){
                    CustomNavigator.pushTo(Routes.CONSUMER_MINORS);
                  },
                  title: "Guardian",
                  imagePath: 'assets/drawer-consumer/guardian.png',
                  buttonColor: Constants.lightOrange,
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){
                    CustomNavigator.pushTo(Routes.CONSUMER_PROXY);
                  },
                  title: "Proxy",
                  imagePath: 'assets/drawer-consumer/proxy.png',
                  buttonColor: Constants.lightGreen,
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){},
                  title: "Standards & Legal Policy",
                  imagePath: 'assets/drawer-consumer/standard.png',
                  buttonColor: Constants.lightOrange,
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){},
                  title: "Notification Settings",
                  imagePath: 'assets/drawer-consumer/notification.png',
                  buttonColor: Constants.lightGreen,
                ),

                CustomSpacers.height14,

                const Divider(),

                CustomSpacers.height24,

                IconButton(
                  onPressed: (){},
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Icon(Icons.logout, color: Colors.grey, size: 18,),

                      CustomSpacers.width10,

                      Text("Logout",
                        style: Get.theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
