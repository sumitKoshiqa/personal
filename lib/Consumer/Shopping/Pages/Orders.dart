import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controller/CartController.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  CartController cartController = Get.put(CartController());

  Future<void> onRefresh() async {
    cartController.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: RefreshIndicator(
              onRefresh: onRefresh,
              child: Column(
                children: [

                  const NavBar(title: "Orders",),

                  Expanded(
                      child: Obx(() => !cartController.isLoadingOrders.value
                          ? ListView.builder(
                              itemCount: cartController.ordersList.length,
                              itemBuilder: (context, position) {
                                return GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Constants.accentGreen,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Image(
                                          height: 80,
                                          width: 80,
                                          image: CachedNetworkImageProvider(
                                              cartController
                                                  .ordersList[position]
                                                  .orderItems![0]
                                                  .imageList![0]),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartController
                                                    .ordersList[position]
                                                    .orderItems![0]
                                                    .name!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "${cartController.ordersList[position].orderState}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "${DateFormat("hh:mm a  dd-MM-yyyy").format(cartController.ordersList[position].orderItems![0].updatedAt!)} ",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                          color: CupertinoColors.activeBlue,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              color: Colors.white,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )))
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
      cartController.getOrders();
    });
  }
}
