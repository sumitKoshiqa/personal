import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/Consumer/Profile/Model/MinorSearchResponseModel.dart';
import 'package:ekikrit/Consumer/Profile/Model/OtherProfileResponseModel.dart';
import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';
import 'package:ekikrit/Consumer/Profile/Networking/ProfileApi.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/onBoarding/networking/auth_api_calls.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class ProfileController extends GetxController with StateMixin{

  // RxList<AddressList> addressList = <AddressList>[].obs;
  Rxn<ProfileResponseModel> profileModel = Rxn<ProfileResponseModel>();
  Rxn<OtherProfileResponseModel> otherProfileModel = Rxn<OtherProfileResponseModel>();
  Rxn<MinorSearchResponseModel> minorModel = Rxn<MinorSearchResponseModel>();
  RxString actingUserId = PreferenceManager().getActingAsUserId().obs;
  RxString actingProfileId = PreferenceManager().getActingAsProfileId().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getOtherUserProfile();
  }

  editUserProfile({jsonParam})async{
    var data = await ProfileApi().editUserProfile(
        jsonParam: jsonParam
    );
    print('data>>> $data');
    if(data != null) {
      return true;
    }
  }

  Future<void> getProfile() async{
    isLoading.value = true;
    var data = await ProfileApi().getProfile();
    profileModel.value = null;
    if (data != null){
      profileModel.value = data;
    }
    isLoading.value = false;
  }

  Future<void> saveProfile() async{
    isLoading.value = true;

    isLoading.value = false;
  }

  Future<void> getOtherUserProfile() async{
    isLoading.value = true;
    var data = await ProfileApi().getOtherUserProfile();
    otherProfileModel.value = null;
    if (data != null){
      otherProfileModel.value = data;
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
      getProfile();
      Get.back();
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
    minorModel.value = null;
    if (data != null){
      minorModel.value = data;
      Map map = {};
      map["minorModel"] = minorModel.value;
      CustomNavigator.pushTo(Routes.CONSUMER_MINOR_SEARCH_RESULTS, arguments: map);
    }
    isLoading.value = false;
  }

  Future<void> createMinor({ssn, zipcode, dob}) async{
    isLoading.value = true;
    var data = await ProfileApi().createMinor(
        ssn: ssn,
        zipcode: zipcode,
        dob: dob
    );
    if (data == "ok"){
      Get.back();
      ShowMessages().showSnackBarRed("Minor Added", "");
      getProfile();
    }
    isLoading.value = false;
  }


  Future<void> uploadImage({filePath}) async{
    isLoading.value = true;
    var data = await ProfileApi().uploadImage(
      filePath: filePath
    );
    if (data){
      getProfile();

    }
    isLoading.value = false;

  }

}