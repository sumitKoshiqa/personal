import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/AddressController.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  AddressController addressController = Get.put(AddressController());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _doorNoController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _etcController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  String selectedCountry = "";
  String selectedLat = "0.0";
  String selectedLong = "0.0";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [

                // nav bar
                Container(
                  height: 50,
                  color: Constants.lightGreen,
                  child: Row(
                    children: [

                      Expanded(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back_ios, size: 18,),
                            ),

                            const Expanded(
                              child: Text("Add Address",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),


                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.search),
                      ),

                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.notifications_none_outlined),
                      ),


                    ],
                  ),
                ),

                // select on map
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     CupertinoButton(
                //       onPressed: (){
                //         Get.to(const SelectLocationOnMap())!.then((result) async{
                //           print("Result from maps $result");
                //           if (result["addressResponse"] != null){
                //             // setting country first ==> order is important
                //             var countryFromMap = await addressController.getCountryFromGeoCodeData(result);
                //             var cityFromMap = await addressController.getCityFromGeoCodeData(result);
                //             var stateFromMap = await addressController.getStateFromGeoCodeData(result);
                //           }
                //         });
                //       },
                //       child: Container(
                //         height: 50,
                //         // margin: const EdgeInsets.only(right: 20),
                //         padding: const EdgeInsets.only(left: 10, right: 10),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: CupertinoColors.black.withOpacity(0.4)),
                //             borderRadius: BorderRadius.circular(8)
                //         ),
                //         child: Row(
                //           children: const [
                //
                //             Image(
                //               height: 30,
                //               width: 30,
                //               image: CachedNetworkImageProvider("https://cdn-icons-png.flaticon.com/512/1865/1865269.png"),
                //             ),
                //
                //             SizedBox(width: 10,),
                //
                //             Text(
                //               "Select On Map",
                //               style: TextStyle(
                //                   fontSize: 14,
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                // const SizedBox(height: 10,),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     Text(
                //       "OR",
                //       style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),

                const SizedBox(height: 10,),

                Expanded(
                  child: Obx(() =>
                    addressController.isLoading.value
                        ? Container(
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                        )
                        : ListView(
                      children: [

                        // country dropdown
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Country",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Container(
                          height:50,
                          margin: const EdgeInsets.only(left: 20, right: 30, top: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              const SizedBox(width: 10,),

                              Expanded(
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  icon: Container(),
                                  value: addressController.selectedCountry.value,
                                  onChanged: (newValue) {
                                    addressController.selectCountry(newValue.toString());
                                    },
                                  items: addressController.countries.map((location) {
                                    return DropdownMenuItem(
                                      child: Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),

                              const Icon(Icons.arrow_drop_down, size: 20,),

                              const SizedBox(width: 10,),

                            ],
                          ),
                        ),

                        const SizedBox(height: 15,),

                        // name
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // phone field
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 2.0),
                                              child: TextField(
                                                controller: _nameController,
                                                textAlign: TextAlign.left,
                                                keyboardType: TextInputType.text,
                                                onChanged: (value) {

                                                },
                                                style: TextStyle(
                                                    fontSize: Constants.fontSizeText,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintText: "Name",
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                      Constants.fontSizeText,
                                                      fontWeight: FontWeight.w500),
                                                  filled: true,
                                                  contentPadding:
                                                  const EdgeInsets.all(16),
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),

                        const SizedBox(height: 15,),

                        // email
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Email Address",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // phone field
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 2.0),
                                              child: TextField(
                                                controller: _emailController,
                                                textAlign: TextAlign.left,
                                                keyboardType: TextInputType.text,
                                                onChanged: (value) {

                                                },
                                                style: TextStyle(
                                                    fontSize: Constants.fontSizeText,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintText: "Email Address",
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                      Constants.fontSizeText,
                                                      fontWeight: FontWeight.w500),
                                                  filled: true,
                                                  contentPadding:
                                                  const EdgeInsets.all(16),
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),

                        const SizedBox(height: 15,),

                        // phone
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Mobile",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // phone field
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 2.0),
                                              child: TextField(
                                                controller: _phoneController,
                                                maxLength: 10,
                                                textAlign: TextAlign.left,
                                                keyboardType: TextInputType.phone,
                                                onChanged: (value) {

                                                },
                                                style: TextStyle(
                                                    fontSize: Constants.fontSizeText,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintText: "Mobile No.",
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                      Constants.fontSizeText,
                                                      fontWeight: FontWeight.w500),
                                                  filled: true,
                                                  contentPadding:
                                                  const EdgeInsets.all(16),
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),

                        const SizedBox(height: 15,),

                        // door
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Door No.",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // phone field
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 2.0),
                                              child: TextField(
                                                controller: _doorNoController,
                                                textAlign: TextAlign.left,
                                                keyboardType: TextInputType.text,
                                                onChanged: (value) {

                                                },
                                                style: TextStyle(
                                                    fontSize: Constants.fontSizeText,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintText: "Door No.",
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                      Constants.fontSizeText,
                                                      fontWeight: FontWeight.w500),
                                                  filled: true,
                                                  contentPadding:
                                                  const EdgeInsets.all(16),
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),


                        const SizedBox(height: 15,),

                        // street
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Street",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // phone field
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 2.0),
                                              child: TextField(
                                                controller: _streetController,
                                                textAlign: TextAlign.left,
                                                keyboardType: TextInputType.text,
                                                onChanged: (value) {

                                                },
                                                style: TextStyle(
                                                    fontSize: Constants.fontSizeText,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintText: "Street",
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                      Constants.fontSizeText,
                                                      fontWeight: FontWeight.w500),
                                                  filled: true,
                                                  contentPadding:
                                                  const EdgeInsets.all(16),
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),

                        const SizedBox(height: 15,),

                        // city dropdown
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "City",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Container(
                          height:50,
                          margin: const EdgeInsets.only(left: 20, right: 30, top: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              const SizedBox(width: 10,),

                              Expanded(
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  icon: Container(),
                                  value: addressController.selectedCity.value,
                                  onChanged: (newValue) {
                                    addressController.selectedCity.value = newValue.toString();
                                  },
                                  items: addressController.cities.map((location) {
                                    return DropdownMenuItem(
                                      value: location,
                                      child: Text(location),
                                    );
                                  }).toList(),
                                ),
                              ),

                              const Icon(Icons.arrow_drop_down, size: 20,),

                              const SizedBox(width: 10,),

                            ],
                          ),
                        ),

                        const SizedBox(height: 15,),

                        // Apt. Suite. Etc(Optional)
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Apt. Suite. Etc(Optional)",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // phone field
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 2.0),
                                              child: TextField(
                                                controller: _etcController,
                                                textAlign: TextAlign.left,
                                                keyboardType: TextInputType.text,
                                                onChanged: (value) {

                                                },
                                                style: TextStyle(
                                                    fontSize: Constants.fontSizeText,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintText: "Apt. Suite. Etc",
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                      Constants.fontSizeText,
                                                      fontWeight: FontWeight.w500),
                                                  filled: true,
                                                  contentPadding:
                                                  const EdgeInsets.all(16),
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),


                        const SizedBox(height: 15,),

                        // state dropdown
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "State",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Container(
                          height:50,
                          margin: const EdgeInsets.only(left: 20, right: 30, top: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              const SizedBox(width: 10,),

                              Expanded(
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  icon: Container(),
                                  value: addressController.selectedState.value,
                                  onChanged: (newValue) {
                                    addressController.selectState(newValue.toString());
                                  },
                                  items: addressController.states.map((location) {
                                    return DropdownMenuItem(
                                      value: location,
                                      child: Text(location),
                                    );
                                  }).toList(),
                                ),
                              ),

                              const Icon(Icons.arrow_drop_down, size: 20,),

                              const SizedBox(width: 10,),

                            ],
                          ),
                        ),


                        const SizedBox(height: 15,),

                        // zipcode
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Zip Code",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // phone field
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 2.0),
                                              child: TextField(
                                                controller: _zipCodeController,
                                                textAlign: TextAlign.left,
                                                keyboardType: TextInputType.number,
                                                onChanged: (value) {

                                                },
                                                style: TextStyle(
                                                    fontSize: Constants.fontSizeText,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintText: "Zip Code",
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                      Constants.fontSizeText,
                                                      fontWeight: FontWeight.w500),
                                                  filled: true,
                                                  contentPadding:
                                                  const EdgeInsets.all(16),
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),

                        const SizedBox(height: 15,),

                        // save button
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              if (_nameController.text.isNotEmpty && _emailController.text.isNotEmpty
                                  && _phoneController.text.isNotEmpty && _doorNoController.text.isNotEmpty
                                  && _streetController.text.isNotEmpty && _zipCodeController.text.isNotEmpty
                              ){
                                addressController.saveAddress(
                                  name: _nameController.text,
                                  line1: "${_doorNoController.text}, ${_streetController.text}",
                                  line2: _etcController.text,
                                  pinCode: _zipCodeController.text,
                                  city: addressController.selectedCity,
                                  state: addressController.selectedState,
                                  country: addressController.selectedCountry,
                                  latitude: selectedLat,
                                  longitude: selectedLong,
                                  mailId: _emailController.text,
                                  phoneNumber: _phoneController.text,
                                  isDefault: true,
                                );
                              }else{
                                ShowMessages().showSnackBarRed("Fields Missing", "Mandatory Fields marked with * are required.");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Constants.accentGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                )
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Save"),
                            ),
                          ),
                        ),


                        const SizedBox(height: 25,),

                      ],
                    ),
                  )
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
