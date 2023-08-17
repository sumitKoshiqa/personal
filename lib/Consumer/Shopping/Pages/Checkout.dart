import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../Controller/AddressController.dart';
import '../Controller/CartController.dart';
import '../Widgets/CartListItem.dart';
import 'AddAddress.dart';

class Checkout extends StatefulWidget {
  final String? cartId;
  const Checkout({this.cartId, Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  bool showOffers = false;
  CartController cartController = Get.put(CartController());
  AddressController addressController = Get.put(AddressController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [

                // nav bar
                const NavBar(title: "Checkout",),

                Expanded(
                    child: Stack(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: ListView(
                            children: [

                              const SizedBox(height: 20,),

                              // checkout image
                              Row(
                                children: const [
                                  Image(
                                    height: 25,
                                    width: 25,
                                    image: CachedNetworkImageProvider("https://cdn-icons-png.flaticon.com/512/5097/5097344.png"),
                                  ),

                                  SizedBox(width: 10,),

                                  Text("Checkout",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),

                              const SizedBox(height: 20,),

                              // price details
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color:  const Color(0xffFCF7EE))
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10,),

                                    // price
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child:  Text("Price:",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          ),

                                          Text("\$27.00",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 10,),

                                    // tax
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child:  Text("Tax:",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          ),

                                          Text("\$0.50",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 10,),

                                    // shipping
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child:  Text("Shipping:",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          ),

                                          Text("\$0.70",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 10,),

                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffFCF7EE)
                                      ),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child:  Text("Total:",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          ),

                                          Text("\$28.70",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20,),

                              // redeem points
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 40,
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        color: Constants.accentGreen,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: const Center(
                                        child: Text("Redeem Points",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                    ),

                                    const Text("\$0.70",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 15,),

                              Divider(color: Colors.grey.shade600,),

                              const SizedBox(height: 15,),

                              // delivery by
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                child: Row(
                                  children: const [
                                    Text("Delivery By:",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: CupertinoColors.activeBlue,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),

                                    const SizedBox(width: 10,),

                                    Text("Monday April 24th",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF2C7504),
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 15,),

                              // address and change address option
                              Obx(() =>
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Image(
                                          height: 30,
                                          width: 30,
                                          image: CachedNetworkImageProvider("https://cdn-icons-png.flaticon.com/512/535/535137.png"),
                                        ),


                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              addressController.addressList.isNotEmpty ?  const Padding(
                                                padding: EdgeInsets.only(left: 12.0),
                                                child: Text("John Smith - 13th Street. 47 W 13th St, New York, NY 10011, USA",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ) : Container(
                                                padding: EdgeInsets.only(left: 12),
                                                child: Text("No Address Found",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.red,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                ),
                                              ),


                                              CupertinoButton(
                                                padding: const EdgeInsets.only(left: 12, top: 0),
                                                onPressed: (){
                                                  showAddressBottomSheet();
                                                },
                                                child:  const Text("Change Address",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: CupertinoColors.activeBlue,
                                                      decoration: TextDecoration.underline,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ),

                              const SizedBox(height: 15,),

                              // pay using title
                              Container(
                                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCF7EE),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color:  const Color(0xffFCF7EE))
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                                  child: Row(
                                    children: const [

                                      Text("Pay Using",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 25,),

                              // credit card payment
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: const [
                                          Image(
                                            height: 30,
                                            width: 30,
                                            image: CachedNetworkImageProvider("https://cdn-icons-png.flaticon.com/512/1086/1086741.png"),
                                          ),

                                          SizedBox(width: 10,),

                                          Text("Credit Card",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Icon(Icons.arrow_forward_ios, size: 16,)
                                  ],
                                ),
                              ),

                              const SizedBox(height: 5,),

                              const Divider(),


                              const SizedBox(height: 15,),

                              // apple pay payment
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: const [
                                          Image(
                                            height: 30,
                                            width: 30,
                                            image: CachedNetworkImageProvider("https://cdn-icons-png.flaticon.com/512/5968/5968630.png"),
                                          ),

                                          SizedBox(width: 10,),

                                          Text("Apple Pay",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Icon(Icons.arrow_forward_ios, size: 16,)
                                  ],
                                ),
                              ),

                              const SizedBox(height: 5,),

                              const Divider(),


                              const SizedBox(height: 15,),

                              // paypal payment
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: const [
                                          Image(
                                            height: 30,
                                            width: 30,
                                            image: CachedNetworkImageProvider("https://cdn-icons-png.flaticon.com/512/174/174861.png"),
                                          ),

                                          SizedBox(width: 10,),

                                          Text("Paypal",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Icon(Icons.arrow_forward_ios, size: 16,)
                                  ],
                                ),
                              ),

                              const SizedBox(height: 5,),

                              const Divider(),


                            ],
                          ),
                        ),

                      ],
                    )
                ),

                // pay now button
                Obx(() =>
                  addressController.addressList.isNotEmpty ?  GestureDetector(
                  onTap: (){
                    cartController.getCheckout(
                      cartId: widget.cartId,
                      shippingAddressId: addressController.selectedAddress.value!.id,
                      billingAddressId: addressController.selectedAddress.value!.id,
                      isPayOnDelivery: false,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Constants.accentGreen,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10.0,
                            offset: const Offset(0,3)
                        ),]
                    ),
                    child: const Center(
                      child: Text("Pay Now",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ) : Container()
                ),

              ],
            ),

            cartController.isLoading.value ? Expanded(
              child: Obx(() =>
                  Center(
                    child: Lottie.asset('assets/card-processing.json',
                      repeat: true,
                      frameRate: FrameRate.max,
                    ),
                  )
              ),
            ) : Container()
          ],
        ),
      ),
    );
  }

  showAddressBottomSheet(){
    Get.bottomSheet(
        Container(
          color: Colors.white,
          child:  Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text("Shipping to",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.close))
                  ],
                ),
              ),

              Expanded(
                  child: Obx(() =>
                      ListView.builder(
                          itemCount: addressController.addressList.length,
                          itemBuilder: (context, position){
                            return GestureDetector(
                              onTap: (){
                                addressController.selectedAddress.value = addressController.addressList[position];
                                Get.back();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [

                                    const SizedBox(width: 20,),

                                    Radio(
                                        value: position,
                                        groupValue: addressController.selectedAddress.value!.id == addressController.addressList[position].id ? position : -1,
                                        activeColor: Colors.green,
                                        onChanged: (value){
                                          addressController.selectedAddress.value = addressController.addressList[position];
                                          Get.back();
                                        }
                                    ),

                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 15, right: 15, top: 0),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Constants.accentGreen.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Stack(
                                          children: [

                                            Column(
                                              children: [

                                                // address text
                                                Text("${addressController.addressList[position].name!}, ${addressController.addressList[position].line1!}, ${addressController.addressList[position].line2!} ${addressController.addressList[position].pinCode!.pinCode}, ${addressController.addressList[position].state!.name!}, ${addressController.addressList[position].country!.name}",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                ),

                                              ],
                                            ),

                                            // addressController.addressList[position].defaultStatus == "Y"
                                            //     ? Positioned(
                                            //   bottom: 10,
                                            //   right: 10,
                                            //   child: Container(
                                            //     height: 25,
                                            //     width: 25,
                                            //     decoration: BoxDecoration(
                                            //         color: Colors.green,
                                            //         borderRadius: BorderRadius.circular(12.5)
                                            //     ),
                                            //     child: const Center(
                                            //       child: Icon(Icons.check_circle_outline, color: Colors.white, size: 16,),
                                            //     ),
                                            //   ),
                                            // )
                                            //     : Container()

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                  )
              ),

              ElevatedButton(
                onPressed: (){
                  Get.back();
                  Get.to(const AddAddress(),
                      transition: Transition.downToUp
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.accentGreen
                ),
                child: const Text("Add New Address",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // cartController.getCheckout(
      //   cartId: widget.cartId,
      //   shippingAddressId: addressController.selectedAddress.value!.id,
      //   billingAddressId: addressController.selectedAddress.value!.id,
      //   isPayOnDelivery: false,
      // );
    });

  }
}
