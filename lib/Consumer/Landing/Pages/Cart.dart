import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../../Shopping/Controller/AddressController.dart';
import '../../Shopping/Controller/CartController.dart';
import '../../Shopping/Pages/AddAddress.dart';
import '../../Shopping/Pages/Checkout.dart';
import '../Controller/HomeNavigationController.dart';
import '../../Shopping/Widgets/CartListItem.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  HomeNavigationController homeNavigationController = Get.put(HomeNavigationController());
  CartController cartController = Get.put(CartController());
  AddressController addressController = Get.put(AddressController());

  List<String> addressList = [
    "3590 Bartlett Avenue, Farmington Hills, Michigan,+1 248-488-0822, 48331, United States",
    "203 Southside Lane, Los Angeles, California,+1 248-488-0822, 90045, United States",
  ];

  // int selectedAddress = 1;

  Future<void> onRefresh() async{
    cartController.getCartItems();
  }

  final List<String> subscriptionPeriods = ['30 Days', '15 Days',]; // Option 2
  String? selectedSubscriptionPeriod = "30 Days";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: onRefresh,
            child: Container(
              child: Column(
                children: [

                  // nav bar
                  const NavBar(title: "Your Cart", hideBackButton: true,),

                  Expanded(
                    child: Stack(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: ListView(
                            children: [

                              const SizedBox(height: 20,),

                              const Row(
                                children: [
                                  Image(
                                    height: 30,
                                    width: 30,
                                    image: CachedNetworkImageProvider("https://cdn-icons-png.flaticon.com/128/891/891462.png"),
                                  ),

                                  SizedBox(width: 10,),

                                  Text("Cart",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),

                              const SizedBox(height: 10,),

                              // sub total price
                              Obx(() =>
                              cartController.cartList.isNotEmpty
                                  ? Container(
                                height: 80,
                                width: Get.width,
                                padding: const EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                    color: Constants.lightGreen,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 10.0,
                                        offset: const Offset(0,3)
                                    ),]
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Sub-Total Price:",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          Text("Excluding taxes and Shipping Charges",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Obx(() =>
                                        Text("\$${cartController.subTotalAmount}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                    ),
                                  ],
                                ),
                              ) : Container(),
                              ),

                             CustomSpacers.height14,

                             // cart items list
                             Obx(() =>
                                 ListView.builder(
                                   shrinkWrap: true,
                                   physics: const ClampingScrollPhysics(),
                                   itemCount: cartController.cartList.length,
                                   itemBuilder: (context, position){
                                     return CartListItem(
                                       cartItem: cartController.cartList[position],
                                     );
                                   },
                                 )
                             ),

                            ],
                          ),
                        ),

                        // Loader
                        Obx(() =>
                          cartController.isLoading.value
                              ? Container(
                                  color: Colors.white,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ) : Container()
                        ),



                        // empty cart
                        Obx(() =>
                        cartController.cartList.isEmpty
                            ? Container(
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Your Cart Is Empty",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ) : Container()
                        )

                      ],
                    )
                  ),
                  

                  // checkout button
                   Obx(() =>
                    cartController.cartList.isNotEmpty && cartController.isLoading.value == false
                        ? GestureDetector(
                      onTap: (){
                        CustomNavigator.pushTo("${Routes.CONSUMER_CHECKOUT}?cartId=${cartController.cartModel.value!.data!.cartId!}");
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
                         child: Text("Proceed to Checkout",
                           style: TextStyle(
                               fontWeight: FontWeight.w500,
                               color: Colors.white,
                               fontSize: 16
                           ),
                         ),
                       ),
                   ),
                    ) : Container()
                   )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
