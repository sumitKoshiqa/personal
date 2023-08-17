import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';
import 'package:ekikrit/Consumer/Profile/Networking/ProfileApi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class ProfileController extends GetxController{

  // RxList<AddressList> addressList = <AddressList>[].obs;
  Rxn<ProfileResponseModel> profileModel = Rxn<ProfileResponseModel>();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  getProfile() async{
    isLoading.value = true;
    var data = await ProfileApi().getProfile();
    profileModel.value = null;
    if (data != null){

    }
    isLoading.value = false;
  }

  createProxy({email, countryCode, phoneNumber}) async{
    isLoading.value = true;
    var data = await ProfileApi().createProxy(
      email: email,
      countryCode: countryCode,
      phoneNumber: phoneNumber
    );
    if (data != null){

    }
    isLoading.value = false;
  }


  searchMinor({ssn, zipcode, dob}) async{
    isLoading.value = true;
    var data = await ProfileApi().searchMinor(
      ssn: ssn,
      zipcode: zipcode,
      dob: dob
    );
    if (data != null){

    }
    isLoading.value = false;
  }

  createMinor({ssn, zipcode, dob}) async{
    isLoading.value = true;
    var data = await ProfileApi().createMinor(
        ssn: ssn,
        zipcode: zipcode,
        dob: dob
    );
    if (data != null){

    }
    isLoading.value = false;
  }



}