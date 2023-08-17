import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Consumer/Profile/Controller/ProfileController.dart';
import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourAccount extends StatefulWidget {
  const YourAccount({Key? key}) : super(key: key);

  @override
  State<YourAccount> createState() => _YourAccountState();
}

class _YourAccountState extends State<YourAccount> {

  ProfileController profileController = Get.put(ProfileController());

  TextEditingController etFirstName = TextEditingController(text: "abc");
  TextEditingController etLastName = TextEditingController(text: "abc");
  TextEditingController etGender = TextEditingController(text: "abc");
  TextEditingController etEmail = TextEditingController(text: "abc");
  TextEditingController etPhone = TextEditingController(text: "abc");
  TextEditingController etSsn = TextEditingController(text: "abc");
  TextEditingController etDob = TextEditingController(text: "abc");
  TextEditingController etZip = TextEditingController(text: "abc");

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  getProfile() async{
    await profileController.getProfile();
    if (profileController.profileModel.value != null){
      ProfileResponseModel profileModel = profileController.profileModel.value!;
      etFirstName.text = profileModel.data!.profile!.name!.firstName!;
      etLastName.text = profileModel.data!.profile!.name!.lastName!;
      etGender.text = profileModel.data!.profile!.gender!;
      etEmail.text = profileModel.data!.profile!.email!;
      etPhone.text = "${profileModel.data!.profile!.phone!.countryCode!} ${profileModel.data!.profile!.phone!.number!}";

      etSsn.text = profileModel.data!.identityDto != null ? profileModel.data!.identityDto!.ssn! : "Not Provided";
      etDob.text = profileModel.data!.identityDto != null ? profileModel.data!.identityDto!.dob!.toString() : "Not Provided";
      etZip.text = profileModel.data!.identityDto != null ? profileModel.data!.identityDto!.zipCode!.toString() : "Not Provided";


      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      layout: Column(
        children: [

          const NavBar(title: "Your Account"),

          CustomSpacers.height14,

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: ListView(
                children: [

                  // profile pic and update button
                  Obx(() =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // self image
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 30,
                            backgroundImage: CachedNetworkImageProvider(profileController.profileModel.value!.data!.profile!.profileImage!.url!),
                          ),

                          InkWell(
                            onTap: (){},
                            child: Container(
                              height: 30,
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Constants.lightGreen,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Constants.accentGreen)
                              ),
                              child: Center(
                                child: Text("Update Profile",
                                  style: Get.theme.textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etFirstName,
                    isEnabled: isEditing,
                    color: Constants.lightOrange,
                    hint: "First Name",
                    imagePath: 'assets/your-account/name.png',
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etLastName,
                    isEnabled: isEditing,
                    color: Constants.lightGreen,
                    hint: "Last Name",
                    imagePath: 'assets/your-account/name.png',
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etGender,
                    isEnabled: isEditing,
                    color: Constants.lightOrange,
                    hint: "Gender",
                    imagePath: 'assets/your-account/name.png',
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etEmail,
                    isEnabled: isEditing,
                    color: Constants.lightGreen,
                    hint: "Email Address",
                    imagePath: 'assets/your-account/mail.png',
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etPhone,
                    isEnabled: isEditing,
                    color: Constants.lightOrange,
                    hint: "Phone",
                    imagePath: 'assets/your-account/phone.png',
                  ),

                  CustomSpacers.height18,


                  Text("This information is fetched from your EMR-EHR",
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                        fontSize: 12
                    ),
                  ),

                  CustomSpacers.height18,

                  TextFieldPrimary(
                    textEditingController: etSsn,
                    isEnabled: isEditing,
                    color: Constants.lightGreen,
                    hint: "Last 4 digit of SSN",
                    imagePath: 'assets/your-account/ssn.png',
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etDob,
                    isEnabled: isEditing,
                    color: Constants.lightOrange,
                    hint: "Date of Birth",
                    imagePath: 'assets/your-account/dob.png',
                  ),

                  CustomSpacers.height14,

                  TextFieldPrimary(
                    textEditingController: etZip,
                    isEnabled: isEditing,
                    color: Constants.lightGreen,
                    hint: "Zip Code",
                    imagePath: 'assets/your-account/zip.png',
                  ),


                  CustomSpacers.height24,

                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonPrimary(onTap: (){
              if (!isEditing){
                setState(() {
                  isEditing = !isEditing;
                });
              }else{
                setState(() {
                  isEditing = !isEditing;
                });
              }
            }, buttonText: isEditing ? "Save Profile" : "Edit Profile"),
          )
        ],
      ),
    );
  }
}
