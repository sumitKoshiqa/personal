import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../Model/AddressResponseModel.dart';
import '../Networking/AddressApi.dart';


class AddressController extends GetxController with StateMixin{

  RxList<AddressList> addressList = <AddressList>[].obs;
  Rxn<AddressList> selectedAddress = Rxn<AddressList>();

  List<String> tempUsaStates = ["Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District Of Columbia", "Federated States Of Micronesia", "Florida", "Georgia", "Guam", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Marshall Islands", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Northern Mariana Islands", "Ohio", "Oklahoma", "Oregon", "Palau", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virgin Islands", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyomin"];
  List<String> tempIndiaStates = ["Andaman and Nicobar Islands", "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chandigarh", "Chhattisgarh", "Dadra and Nagar Haveli", "Daman and Diu", "Delhi", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Ladakh", "Lakshadweep", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Puducherry", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal"];

  // dropdown elements
  final RxList<String> countries = ['India', 'USA',].obs; // Option 2
  RxString selectedCountry = "India".obs;

  final RxList<String> cities = ['Texas', 'Houston', 'Jaipur'].obs; // Option 2
  RxString selectedCity = "Texas".obs;

  final RxList<String> states = ['New Jersey', 'Rajasthan',].obs; // Option 2
  RxString selectedState = "New Jersey".obs;

  //----------------------------------------------------------------------

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAddress();
    selectCountry("USA");
  }

  saveAddress({name, line1, line2, pinCode, city, state, country, latitude, longitude, mailId, phoneNumber, isDefault}) async{
    isLoading.value = true;
    var data = await AddressApi().saveAddress(
        name: name,
        line1: line1,
        line2: line2,
        pinCode: pinCode,
        city: city,
        state: state,
        country: country,
        latitude: latitude,
        longitude: longitude,
        mailId: mailId,
        phoneNumber: phoneNumber,
        isDefault: isDefault,
    );
    if (data != null){
      Get.back();
      getAddress();
      ShowMessages().showSnackBarGreen("Address Saved", "");

    }
    isLoading.value = false;
  }


  getAddress() async{
    isLoading.value = true;
    var data = await AddressApi().getAddresses();
    addressList.clear();
    if (data != null){
      AddressResponseModel addressResponseModel = data;
      addressList.assignAll(addressResponseModel.data!.addressList!);
      if (addressResponseModel.data!.addressList!.isEmpty){

      }else{
        addressList.forEach((element) {
          if (element.isDefault!){
            selectedAddress.value = element;
          }
        });
      }
    }
    addressList.refresh();
    isLoading.value = false;
  }

  selectCountry(country) async{
    print("Selected country $country");
    selectedCountry.value = country;
    states.clear();
    if (country == "India"){
      states.assignAll(tempIndiaStates);
    }else{
      states.assignAll(tempUsaStates);
    }
    selectedState.value = states[0];
    getCities();
    states.refresh();
  }

  selectState(state) async{
    selectedState.value = state;
    getCities();
  }

  getCities() async{
    isLoading.value = true;
    String url = selectedCountry.value == "India"
        ? "http://3.13.92.74:30003/gateway/location/user/country/india.json"
        : "http://3.13.92.74:30003/gateway/location/user/country/usa.json";

    print("Fetching cities for url $url");
    var data = await AddressApi().getCities(url);
    if (data != null){
      Map rootMap = data;
      rootMap.forEach((key, value) {
        if (key == selectedState.value){
          List<dynamic> cityList = value;
          cities.clear();
          cities.assignAll(List<String>.from(cityList));
          selectedCity.value = cities[0];
          // print("Selected state is $key and cities list ${cityList[0]}");
        }
      });
     // print("Data for cities ${jsonDecode(data)}");
    }else{
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  Future<String> getCityFromGeoCodeData(Map map) async{
    String city = "";
    List<dynamic> addressComponentsList = map["addressResponse"]["results"][0]["address_components"];
    addressComponentsList.forEach((element) {
      if (element["types"][0] != null && element["types"][0] == "locality"){
        city = element["long_name"];
        selectedCity.value = city;
      }
    });
    return city;
  }

  Future<String> getStateFromGeoCodeData(Map map) async{
    String state = "";
    List<dynamic> addressComponentsList = map["addressResponse"]["results"][0]["address_components"];
    addressComponentsList.forEach((element) {
      if (element["types"][0] != null && element["types"][0] == "administrative_area_level_1"){
        state = element["long_name"];
        selectedState.value = state;

      }
    });
    return state;
  }

  Future<String> getCountryFromGeoCodeData(Map map) async{
    String country = "";
    List<dynamic> addressComponentsList = map["addressResponse"]["results"][0]["address_components"];
    addressComponentsList.forEach((element) {
      if (element["types"][0] != null && element["types"][0] == "country"){
        country = element["long_name"];
        selectedCountry.value = country;
      }
    });
    return country;
  }

}