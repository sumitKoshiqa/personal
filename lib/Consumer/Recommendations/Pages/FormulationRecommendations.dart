import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/ButtonSecondary.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Consumer/Shopping/Controller/CartController.dart';
import 'package:ekikrit/Consumer/Shopping/Controller/ProductController.dart';
import 'package:ekikrit/Consumer/Shopping/Widgets/CheckoutBanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulationRecommendations extends StatefulWidget {
  const FormulationRecommendations({Key? key}) : super(key: key);

  @override
  State<FormulationRecommendations> createState() =>
      _FormulationRecommendationsState();
}

class _FormulationRecommendationsState
    extends State<FormulationRecommendations> {
  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());

  Future<void> onRefresh() async{
    productController.getProducts();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: RefreshIndicator(
              onRefresh: onRefresh,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),

                              Row(
                                children: const [
                                  Image(
                                    height: 20,
                                    width: 20,
                                    image: CachedNetworkImageProvider(
                                        "https://cdn-icons-png.flaticon.com/512/2954/2954893.png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Recommendation",
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),

                              // formulation list
                              Obx(() => ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount:
                                        productController.productList.length,
                                    itemBuilder: (context, position) {
                                      return Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            // product image
                                            Container(
                                              height: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: const DecorationImage(
                                                      image: CachedNetworkImageProvider(
                                                          "https://i.pinimg.com/736x/61/dc/88/61dc88dee4f6b45d0a69918001943c6a.jpg"),
                                                      fit: BoxFit.cover)),
                                            ),

                                            const SizedBox(
                                              height: 10,
                                            ),

                                            Text(
                                              productController
                                                  .productList[position]
                                                  .product!
                                                  .name!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),

                                            const SizedBox(
                                              height: 2,
                                            ),

                                            Text(
                                              productController
                                                  .productList[position]
                                                  .product!
                                                  .description!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey),
                                            ),

                                            const SizedBox(
                                              height: 5,
                                            ),

                                            // subscription button
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Constants.lightGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Row(
                                                children: [
                                                  const Expanded(
                                                    child: Text(
                                                      "On 30 Day Subscription",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: 35,
                                                      child: ButtonPrimary(onTap: (){}, buttonText: "Cancel Subscription"))
                                                ],
                                              ),
                                            ),

                                            CustomSpacers.height14,


                                            // add to cart button
                                            ButtonSecondary(
                                              onTap: (){
                                                cartController.modifyCart(
                                                    sellerProductId:
                                                    productController
                                                        .productList[position]
                                                        .id,
                                                    cartType: "SHOPPING_CART",
                                                    quantity: 1);
                                              },
                                              buttonText: "Add to Cart",
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  Obx(() => cartController.isLoading.value || productController.isLoading.value
                      ? Container(
                          color: Colors.white,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container()),

                  // checkout cart bottom
                  const CheckoutBanner()

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.getProducts();
    });
  }
}
