import 'dart:convert';

CheckoutResponseModel checkoutResponseModelFromJson(String str) => CheckoutResponseModel.fromJson(json.decode(str));

String checkoutResponseModelToJson(CheckoutResponseModel data) => json.encode(data.toJson());

class CheckoutResponseModel {
  CheckoutResponseModel({
    required this.timestamp,
    required this.status,
    required this.statusCode,
    required this.statusSubCode,
    required this.message,
    required this.hostName,
    required this.requestId,
    required this.data,
  });

  DateTime timestamp;
  int status;
  String statusCode;
  String statusSubCode;
  String message;
  String hostName;
  String requestId;
  Data data;

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) => CheckoutResponseModel(
    timestamp: DateTime.parse(json["timestamp"]),
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    data: Data.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.amount,
    required this.payableAmount,
    required this.promoCode,
    required this.billingAddressId,
    required this.shippingAddressId,
    required this.orderState,
    required this.metaData,
    required this.orderItemList,
  });

  String id;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String userId;
  double amount;
  double payableAmount;
  String promoCode;
  String billingAddressId;
  String shippingAddressId;
  String orderState;
  String metaData;
  List<OrderItemList> orderItemList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    userId: json["userId"],
    amount: json["amount"],
    payableAmount: json["payableAmount"],
    promoCode: json["promoCode"],
    billingAddressId: json["billingAddressId"],
    shippingAddressId: json["shippingAddressId"],
    orderState: json["orderState"],
    metaData: json["metaData"],
    orderItemList: List<OrderItemList>.from(json["orderItemList"].map((x) => OrderItemList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "userId": userId,
    "amount": amount,
    "payableAmount": payableAmount,
    "promoCode": promoCode,
    "billingAddressId": billingAddressId,
    "shippingAddressId": shippingAddressId,
    "orderState": orderState,
    "metaData": metaData,
    "orderItemList": List<dynamic>.from(orderItemList.map((x) => x.toJson())),
  };
}

class OrderItemList {
  OrderItemList({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.orderId,
    required this.sellerProductId,
    required this.quantity,
    required this.amount,
    required this.payableAmount,
    this.promoCode,
    required this.orderItemState,
    this.metaData,
  });

  String id;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String orderId;
  String sellerProductId;
  int quantity;
  double amount;
  double payableAmount;
  dynamic promoCode;
  String orderItemState;
  dynamic metaData;

  factory OrderItemList.fromJson(Map<String, dynamic> json) => OrderItemList(
    id: json["id"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    orderId: json["orderId"],
    sellerProductId: json["sellerProductId"],
    quantity: json["quantity"],
    amount: json["amount"],
    payableAmount: json["payableAmount"],
    promoCode: json["promoCode"],
    orderItemState: json["orderItemState"],
    metaData: json["metaData"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "orderId": orderId,
    "sellerProductId": sellerProductId,
    "quantity": quantity,
    "amount": amount,
    "payableAmount": payableAmount,
    "promoCode": promoCode,
    "orderItemState": orderItemState,
    "metaData": metaData,
  };
}
