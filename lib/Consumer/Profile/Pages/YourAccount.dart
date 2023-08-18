import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/CustomContainer.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/Widgets/TextFieldPrimary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import 'package:ekikrit/Consumer/Profile/Controller/ProfileController.dart';
import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Common/Widgets/option_selector.dart';

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
  final AuthController authController = Get.put(AuthController());

  List<String> genderList = ["Male", "Female"];
  String selectedGender = "Male";

  bool isEditing = false;
  String imagePath = "";

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
      layout: Stack(
        children: [
          Column(
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
                                onTap: (){
                                  pickImage();
                                },
                                child: Container(
                                  height: 30,
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      color: Constants.lightGreen,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Constants.accentGreen)
                                  ),
                                  child: Center(
                                    child: Text("Update Picture",
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

                      OptionSelector(
                          selectedOption: selectedGender,
                          options: genderList,
                          bgColor: 0xFFFFF7EB,
                          setNewValue: (val) {
                            setState(() {
                              selectedGender = val;
                            });
                          }
                      ),

                      // TextFieldPrimary(
                      //   textEditingController: etGender,
                      //   isEnabled: isEditing,
                      //   color: Constants.lightOrange,
                      //   hint: "Gender",
                      //   imagePath: 'assets/your-account/name.png',
                      // ),

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
                        isEnabled: false,
                        color: Constants.lightGreen,
                        hint: "Last 4 digit of SSN",
                        imagePath: 'assets/your-account/ssn.png',
                      ),

                      CustomSpacers.height14,

                      TextFieldPrimary(
                        textEditingController: etDob,
                        isEnabled: false,
                        color: Constants.lightOrange,
                        hint: "Date of Birth",
                        imagePath: 'assets/your-account/dob.png',
                      ),

                      CustomSpacers.height14,

                      TextFieldPrimary(
                        textEditingController: etZip,
                        isEnabled: false,
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
                child: ButtonPrimary(onTap: ()async{
                  if (!isEditing){
                    setState(() {
                      isEditing = !isEditing;
                    });
                  }else{
                    String stParam = getUserProfileParam();
                    print('stParam>>> ${jsonDecode(stParam)}');
                    await profileController.editUserProfile(
                        jsonParam: jsonEncode(stParam),
                    );
                    setState(() {
                      isEditing = !isEditing;
                    });
                  }



                }, buttonText: isEditing ? "Save Profile" : "Edit Profile"),
              )
            ],
          ),
          
          Obx(() => 
            profileController.isLoading.value ? Container(
              height: Get.height,
              width: Get.width,
              color: Colors.white.withOpacity(0.4),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ) : Container(),
          )
        ],
      ),
    );
  }

  pickImage() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imagePath = image!.path;
    if (image.path != null){}
    setState(() {});
    if (imagePath != null){
      print("Uplaod image $imagePath");
    }else{
      print("Uplaod image null");
    }

    profileController.uploadImage(filePath: imagePath);

  }

  String getUserProfileParam() {
    String stParam = '''{
      "name": {
        "firstName": "${etFirstName.text.trim()}",
        "lastName": "${etLastName.text.trim()}"
      },
      "email": "${etEmail.text.trim()}",
      "phone": {
        "countryCode": "+91",
        "number": "${etPhone.text.trim()}"
      },
      "gender": "${selectedGender.toUpperCase()}",
    }''';
    return stParam;
  }
}
