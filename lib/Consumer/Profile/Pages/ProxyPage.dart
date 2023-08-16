import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/ButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/app_entry_point/utils/Constants.dart';
import 'package:ekikrit/app_entry_point/utils/CustomSpacers.dart';
import 'package:ekikrit/app_entry_point/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProxyPage extends StatefulWidget {
  const ProxyPage({Key? key}) : super(key: key);

  @override
  State<ProxyPage> createState() => _ProxyPageState();
}

class _ProxyPageState extends State<ProxyPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [

                const NavBar(title: "Proxy"),

                CustomSpacers.height4,

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [

                        // your proxy title
                        Text("Your Proxy",
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
                                  image: CachedNetworkImageProvider("https://images.unsplash.com/photo-1554244933-d876deb6b2ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80"),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),

                            CustomSpacers.width10,

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("sara.milan@ekikrit.com",
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
                      image: AssetImage('assets/proxy-guardian/proxy_illustration.png'),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ButtonPrimary(onTap: (){
                    CustomNavigator.pushTo(Routes.CONSUMER_CREATE_PROXY);
                  }, buttonText: "Create"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
