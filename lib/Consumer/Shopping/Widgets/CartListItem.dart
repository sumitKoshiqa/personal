import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../Controller/CartController.dart';
import '../Model/CartResponseModel.dart';

class CartListItem extends StatefulWidget {
  final CartItem? cartItem;
  const CartListItem({this.cartItem, Key? key}) : super(key: key);

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {

  CartController cartController = Get.put(CartController());

  final List<String> subscriptionPeriods = ['30 Days', '15 Days',]; // Option 2
  String? selectedSubscriptionPeriod = "30 Days";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.3))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // product image
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image:  DecorationImage(
                  image: CachedNetworkImageProvider(widget.cartItem!.thumbnailImage!),
                  fit: BoxFit.cover
                )
            ),
          ),

          const SizedBox(width: 5,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(height: 5,),

                // name
                Row(
                  children: [
                    Expanded(
                      child: Text(widget.cartItem!.productName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(right: 5),
                      constraints: const BoxConstraints(),
                      onPressed: (){
                        cartController.modifyCart(
                            sellerProductId: widget.cartItem!.sellerProductId!,
                            cartType: "SHOPPING_CART",
                            quantity: 0
                        );
                      },
                      icon: const Icon(Icons.delete_outline, color: Colors.redAccent,),
                    )
                  ],
                ),

                // price
                Text("\$${widget.cartItem!.productSellingPrice!}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                    fontSize: 16
                  ),
                ),

                const SizedBox(height: 5,),

                // subscribe and save
                Row(
                  children: [
                    SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child:  Checkbox(
                          value: widget.cartItem!.isChecked!,
                          activeColor: Constants.accentGreen,
                          onChanged: (newValue){
                            widget.cartItem!.isChecked = !widget.cartItem!.isChecked!;
                            setState(() {});
                          },
                        )
                    ),

                    Text("Subscribe and Save 5%",
                      style: TextStyle(
                          color: Constants.accentGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),



                  ],
                ),

                const SizedBox(height: 10,),

                // subscription dropdown
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey)
                  ),
                  child:  DropdownButton(
                    isDense: true,
                    iconSize: 20,
                    underline: const SizedBox(),
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('$selectedSubscriptionPeriod',
                        style: const TextStyle(
                            color: Colors.black
                        ),
                      ),
                    ), // Not necessary for Option 1
                    value: selectedSubscriptionPeriod,
                    onChanged: (newValue) {
                      setState(() {
                        selectedSubscriptionPeriod = newValue.toString();
                      });
                    },
                    items: subscriptionPeriods.map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 5,),

                RichText(
                  text: const TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Save 10%',
                          style: TextStyle(
                              color: Colors.deepOrange
                          )
                      ),
                      TextSpan(text: ' by ordering 90 days supply', style: TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),

                const SizedBox(height: 5,),


              ],
            ),
          )

        ],
      ),
    );
  }
}
