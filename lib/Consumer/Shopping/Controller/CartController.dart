import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Model/CartResponseModel.dart';
import '../Model/CheckoutResponseModel.dart';
import '../Model/OrdersResponseModel.dart';
import '../Model/PaymentInfoResponseModel.dart';
import '../Networking/ShoppingApi.dart';
import '../Pages/Payment.dart';

// enum OrderState { IN_PROGRESS, FAILED, INITIATE_PAYMENT}

class CartController extends GetxController with StateMixin{

  RxList<CartItem> cartList = <CartItem>[].obs;
  RxList<OrderList> ordersList = <OrderList>[].obs;
  Rxn<CartResponseModel> cartModel = Rxn<CartResponseModel>();
  Rxn<CheckoutResponseModel> checkoutModel = Rxn<CheckoutResponseModel>();

  RxString subTotalAmount = "".obs;
  RxString estimatedTax = "".obs;
  RxString shippingPrice = "".obs;
  RxString totalAmount = "".obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingOrders = false.obs;

  int currentRetries = 0;

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }


  getCartItems() async{
    isLoading.value = true;
    var data = await ShoppingApi().getCartItems();
    cartList.clear();
    if (data != null){
      CartResponseModel cartResponseModel = data;
      cartModel.value = cartResponseModel;
      cartList.assignAll(cartResponseModel.data!.cartItems!);
      subTotalAmount.value = cartResponseModel.data!.subTotalAmount.toString();
      estimatedTax.value = cartResponseModel.data!.estimatedTax.toString();
      shippingPrice.value = cartResponseModel.data!.shippingPrice.toString();
      totalAmount.value = cartResponseModel.data!.totalAmount.toString();
    }
    cartList.refresh();
    isLoading.value = false;
  }

  modifyCart({sellerProductId, quantity, cartType}) async{
    isLoading.value = true;
    var data = await ShoppingApi().modifyCart(
      sellerProductId: sellerProductId,
      quantity: quantity,
      cartType: cartType
    );
    if (data != null){

    }
    isLoading.value = false;
    getCartItems();
  }

  getCheckout({cartId, billingAddressId, shippingAddressId, isPayOnDelivery}) async{
    isLoading.value = true;
    var data = await ShoppingApi().getCheckout(
      cartId: cartId,
      billingAddressId: billingAddressId,
      shippingAddressId: shippingAddressId,
      isPayOnDelivery: isPayOnDelivery
    );
    if (data != null){
      CheckoutResponseModel checkoutResponseModel = data;
      checkoutModel.value = checkoutResponseModel;
      getPaymentIntent(
        orderId: checkoutResponseModel.data.id,
        paymentGateway: "STRIPE",
        amount: cartModel.value!.data!.subTotalAmount!,
        currency: "INR"
      );
    }else{
      isLoading.value = false;
      getCartItems();
    }
  }

  getPaymentIntent({orderId, paymentGateway, amount, currency}) async{
    print("Getting payment intent..............................................");
    isLoading.value = true;
    var data = await ShoppingApi().getPaymentIntent(
        orderId: orderId,
        paymentGateway: paymentGateway,
        amount: amount,
        currency: currency
    );
    if (data != null){
      print("Current route ${Get.currentRoute}");
      PaymentInfoResponseModel paymentInfoResponseModel = data;
      if (paymentInfoResponseModel.data!.orderState == "INITIATE_PAYMENT"){
        if (kIsWeb){
          print("Opening web payments");
          await launchUrl(
            Uri.parse("https://pinpointcode.com/ekikrit/payments?amount=$amount&pi=${paymentInfoResponseModel.data!.paymentDetails!.clientSecret}"),
            webOnlyWindowName:'_blank',
          );
        }else{
          Get.off(Payment(
            amount: amount.toString(),
            pi: paymentInfoResponseModel.data!.paymentDetails!.clientSecret,
          ));
        }
        currentRetries = 0;
        isLoading.value = false;
      }else if (paymentInfoResponseModel.data!.orderState == "IN_PROGRESS"){
        if (currentRetries < 3){
          Future.delayed(const Duration(milliseconds: 2500), () {
            getPaymentIntent(
                orderId: orderId,
                paymentGateway: "STRIPE",
                amount: cartModel.value!.data!.subTotalAmount!,
                currency: "INR"
            );
          });
          currentRetries++;
        }
      }
    }else{
      isLoading.value = false;
    }
    isLoading.value = false;
    getCartItems();
  }

  getOrders() async{
    isLoadingOrders.value = true;
    var data = await ShoppingApi().getOrders();
    ordersList.clear();
    if (data != null){
      OrdersResponseModel ordersResponseModel = data;
      ordersList.assignAll(ordersResponseModel.orderList!);
    }
    ordersList.refresh();
    isLoadingOrders.value = false;
  }


}