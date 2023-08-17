import 'package:ekikrit/Common/Widgets/BackButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/InfoCardPrimary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/Consumer/Profile/Controller/ProfileController.dart';
import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrawerLayoutConsumer extends StatefulWidget {
  const DrawerLayoutConsumer({Key? key}) : super(key: key);

  @override
  State<DrawerLayoutConsumer> createState() => _DrawerLayoutConsumerState();
}

class _DrawerLayoutConsumerState extends State<DrawerLayoutConsumer> {
  final AuthController authController = Get.put(AuthController());
  ProfileController profileController = Get.put(ProfileController());

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
                  onPressed: (){
                    PreferenceManager().saveActingAsUserId(actingUserId: "");
                    PreferenceManager().saveActingAsProfileId(actingProfileId: "");
                    profileController.actingUserId.value = "";
                    profileController.actingProfileId.value = "";
                    setState(() {});
                    ShowMessages().showSnackBarRed("Identity modified", "Your are now acting as yourself");
                  },
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
                Obx(() =>
                    profileController.profileModel.value != null ? Row(
                      mainAxisAlignment: profileController.actingUserId.value.isNotEmpty ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                      children: [

                        // self info
                        Column(
                          children: [

                            // self image
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 30,
                              backgroundImage: CachedNetworkImageProvider(profileController.profileModel.value!.data!.profile!.profileImage!.url!),
                            ),

                            CustomSpacers.height8,

                            Text(profileController.profileModel.value!.data!.profile!.name!.firstName!,
                              style: Get.theme.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text("ID: ${profileController.profileModel.value!.data!.id!.substring(0,5).toUpperCase()}",
                              style: Get.theme.textTheme.titleSmall,
                            ),
                          ],
                        ),

                        profileController.actingUserId.value.isNotEmpty ? Text("(Acting As)",
                          style: Get.theme.textTheme.titleMedium!.copyWith(
                              color: Colors.grey.shade700,
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                          ),
                        ) : Container(),

                        // acting info
                        (profileController.actingUserId.value.isNotEmpty && profileController.otherProfileModel.value != null) ? Column(
                          children: [

                            // self image
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 30,
                              backgroundImage: CachedNetworkImageProvider(profileController.otherProfileModel.value!.data!.profileImage!.url!),
                            ),

                            CustomSpacers.height8,

                            Text("${profileController.otherProfileModel.value!.data!.name!.firstName!} ${profileController.otherProfileModel.value!.data!.name!.lastName!}",
                              style: Get.theme.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text("ID: ${profileController.actingUserId.value.substring(0,5).toUpperCase()}",
                              style: Get.theme.textTheme.titleSmall,
                            ),
                          ],
                        ) : Container(),

                      ],
                    ) : Container(),
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
                  onTap: (){
                    CustomNavigator.pushTo(Routes.CONSUMER_ORDERS);
                  },
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
                  onTap: (){
                    CustomNavigator.pushTo(Routes.CONSUMER_CUSTOMER_SERVICE);
                  },
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
                  onTap: (){
                    CustomNavigator.pushTo(Routes.CONSUMER_POLICY_PAGE);
                  },
                  title: "Standards & Legal Policy",
                  imagePath: 'assets/drawer-consumer/standard.png',
                  buttonColor: Constants.lightOrange,
                ),

                CustomSpacers.height14,

                InfoCardPrimary(
                  onTap: (){
                    CustomNavigator.pushTo(Routes.CONSUMER_NOTIFICATION_SETTINGS);
                  },
                  title: "Notification Settings",
                  imagePath: 'assets/drawer-consumer/notification.png',
                  buttonColor: Constants.lightGreen,
                ),

                CustomSpacers.height14,

                const Divider(),

                CustomSpacers.height24,

                IconButton(
                  onPressed: (){
                    authController.logOut();
                  },
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
