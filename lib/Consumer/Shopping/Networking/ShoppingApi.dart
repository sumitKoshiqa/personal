import 'package:dio/dio.dart';
import 'package:ekikrit/Common/utils/ApiEndPoints.dart';
import 'package:ekikrit/Common/utils/GetDio.dart';
import 'package:ekikrit/Consumer/Shopping/Model/ProductModel.dart';
import '../Model/CartResponseModel.dart';
import '../Model/CheckoutResponseModel.dart';
import '../Model/OrdersResponseModel.dart';
import '../Model/PaymentInfoResponseModel.dart';
import '../Model/ProductInventoryInfoModel.dart';


class ShoppingApi {

  var dio = GetDio().getDio();

  // get products
  Future<dynamic> getProducts() async{
    try {
      Response response = await dio.get(
        "http://3.142.229.170:30001/gateway/inventory/user/seller-product",
      );
      print("Get products Response $response");
      if (response.statusCode == 200) {
        ProductModel productModel = ProductModel.fromJson(response.data);
        return productModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred fetching products $e");
      return null;
    }
  }

  // get inventory detail
  Future<dynamic> getInventoryInfo({sellerProductId}) async{
    try {
      print("Fetching info seller id $sellerProductId");
      Response response = await dio.get(
        "${ApiEndPoints.baseUrl}inventory/user/seller-product/id/$sellerProductId",
      );
      print("Get inventory info Response $response");
      if (response.statusCode == 200) {
        ProductInventoryInfoModel productInventoryInfoModel = ProductInventoryInfoModel.fromJson(response.data);
        return productInventoryInfoModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred fetching inventory info $e");
      return null;
    }
  }

  // get cart items
  Future<dynamic> getCartItems() async{
    try {
      Response response = await dio.get(
        "http://3.142.229.170:30001/gateway/cart/user/shopping-cart?cartType=SHOPPING_CART",
      );
      print("Get Cart Response $response");
      if (response.statusCode == 200) {
        CartResponseModel cartResponseModel = CartResponseModel.fromJson(response.data);
        return cartResponseModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred fetching cart $e");
      return null;
    }
  }

  // modify cart
  Future<dynamic> modifyCart({sellerProductId, quantity, cartType}) async{
    try {
      print("Sending param $sellerProductId $quantity $cartType");
      var postParam = '{ "cartType": "$cartType", "sellerProductId": "$sellerProductId", "quantity": $quantity }';
      Response response = await dio.post(
        "http://3.142.229.170:30001/gateway/cart/user/shopping-cart/item",
        data: postParam
      );
      print("Modify cart Response $response");
      if (response.statusCode == 200) {
        return "OK";
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred modifying cart $e");
      return null;
    }
  }


  // get checkout
  Future<dynamic> getCheckout({cartId, billingAddressId, shippingAddressId, isPayOnDelivery}) async {
    try {
      print(
          "Sending param cartId $cartId billingId $billingAddressId shippingId $shippingAddressId isPayOnDelivery $isPayOnDelivery");
      var postParam = '{ "cartId": "$cartId", "billingAddressId": "$billingAddressId", "shippingAddressId": "$shippingAddressId", "isPayOnDelivery": $isPayOnDelivery }';
      Response response = await dio.post(
          "http://3.142.229.170:20004/order/user/order/checkout",
          data: postParam
      );
      print("Get checkout Response $response");
      if (response.statusCode == 200) {
        CheckoutResponseModel checkoutResponseModel = CheckoutResponseModel.fromJson(response.data);
        return checkoutResponseModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred checkout api $e");
      return null;
    }
  }


  // get payment intent
  Future<dynamic> getPaymentIntent({orderId, paymentGateway, amount, currency}) async {
    try {
      print(
          "Sending param $orderId $paymentGateway $amount $currency");
      var postParam = '{ "orderId": "$orderId", "paymentGateway": "$paymentGateway", "amount": $amount, "currency": "$currency" }';
      Response response = await dio.post(
          "${ApiEndPoints.baseUrl}order/user/order/payment",
          data: postParam
      );
      print("Get payment intent Response $response");
      if (response.statusCode == 200) {
        PaymentInfoResponseModel paymentInfoResponseModel = PaymentInfoResponseModel.fromJson(response.data);
        return paymentInfoResponseModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred fetching payment intent api $e");
      return null;
    }
  }


  // get orders
  Future<dynamic> getOrders() async {
    try {
      Response response = await dio.get(
          "${ApiEndPoints.baseUrl}order/user/order/allOrders?pageNo=0&pageSize=5",
      );
      print("Get orders Response $response");
      if (response.statusCode == 200) {
        OrdersResponseModel ordersResponseModel = OrdersResponseModel.fromJson(response.data);
        return ordersResponseModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred fetching orders $e");
      return null;
    }
  }
}
