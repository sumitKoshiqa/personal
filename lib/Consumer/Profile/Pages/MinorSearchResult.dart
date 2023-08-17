import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/ButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/Consumer/Profile/Controller/ProfileController.dart';
import 'package:ekikrit/Consumer/Profile/Model/MinorSearchResponseModel.dart';
import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinorSearchResult extends StatefulWidget {
  final MinorSearchResponseModel? minorSearchResponseModel;
  const MinorSearchResult({this.minorSearchResponseModel, Key? key}) : super(key: key);

  @override
  State<MinorSearchResult> createState() => _MinorSearchResultState();
}

class _MinorSearchResultState extends State<MinorSearchResult> {

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      layout: Column(
        children: [

          const NavBar(title: "Minor Search Results"),

          CustomSpacers.height4,

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [

                  // your proxy title
                  Text("Minor Results",
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),
                  ),

                  CustomSpacers.height14,

                  // minors list
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
                            Text(widget.minorSearchResponseModel!.data!.name!.firstName!,
                              style: Get.theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),
                            ),

                            CustomSpacers.height4,

                            Text("ID: ${widget.minorSearchResponseModel!.data!.id!.substring(0,5).toUpperCase()}",
                              style: Get.theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),
                      ),

                      // add minor
                      IconButton(
                        onPressed: () async{
                          await profileController.createMinor(
                            dob: widget.minorSearchResponseModel!.data!.dob!,
                            ssn: widget.minorSearchResponseModel!.data!.ssn!,
                            zipcode: widget.minorSearchResponseModel!.data!.zipCode!,
                          );
                        },
                        icon: Icon(Icons.add_circle_outline, color: Constants.accentGreen, size: 22,),
                      )
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
              CustomNavigator.pushTo(Routes.CONSUMER_SEARCH_MINORS);
            }, buttonText: "Search"),
          )
        ],
      ),
    );
  }
}
