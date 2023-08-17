import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Consumer/Landing/Controller/HomeNavigationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/CartController.dart';

class CheckoutBanner extends StatefulWidget {
  const CheckoutBanner({Key? key}) : super(key: key);

  @override
  State<CheckoutBanner> createState() => _CheckoutBannerState();
}

class _CheckoutBannerState extends State<CheckoutBanner> {

  CartController cartController = Get.put(CartController());
  HomeNavigationController homeNavigationController = Get.put(HomeNavigationController());


  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Positioned(
        bottom: 5,
        left: 5,
        right: 5,
        child: cartController.cartList.isNotEmpty
            ? GestureDetector(
          onTap: () {
            // Get.to(const Cart(showBackButton: true,));
            print("Current route ${Get.currentRoute}");
            if (Get.currentRoute.toString() == "/HomeContainerConsumer"){
              homeNavigationController.selectedIndex.value = 3;
            }
          },
          child: Container(
            height: 50,
            width: Get.width,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Constants.accentGreen,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Checkout",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 20.0),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text("Cart Amount",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[200])),
                        Obx(
                              () => Text(
                              "Rs ${cartController.subTotalAmount}/-",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
            : Container(),
      ),
    );
  }
}
