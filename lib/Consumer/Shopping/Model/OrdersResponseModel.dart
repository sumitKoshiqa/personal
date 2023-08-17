import 'dart:convert';

OrdersResponseModel ordersResponseModelFromJson(String str) => OrdersResponseModel.fromJson(json.decode(str));

String ordersResponseModelToJson(OrdersResponseModel data) => json.encode(data.toJson());

class OrdersResponseModel {
  OrdersResponseModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.orderList,
  });

  DateTime? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  List<OrderList>? orderList;

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) => OrdersResponseModel(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    orderList: json["response"] == null ? [] : List<OrderList>.from(json["response"]!.map((x) => OrderList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "orderList": orderList == null ? [] : List<dynamic>.from(orderList!.map((x) => x.toJson())),
  };
}

class OrderList {
  OrderList({
    this.orderId,
    this.orderState,
    this.payableAmount,
    this.billingAddressId,
    this.shippingAddressId,
    this.orderItems,
    this.updatedAt,
  });

  String? orderId;
  String? orderState;
  double? payableAmount;
  String? billingAddressId;
  String? shippingAddressId;
  List<OrderItem>? orderItems;
  DateTime? updatedAt;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    orderId: json["orderId"],
    orderState: json["orderState"],
    payableAmount: json["payableAmount"],
    billingAddressId: json["billingAddressId"],
    shippingAddressId: json["shippingAddressId"],
    orderItems: json["orderItems"] == null ? [] : List<OrderItem>.from(json["orderItems"]!.map((x) => OrderItem.fromJson(x))),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "orderState": orderState,
    "payableAmount": payableAmount,
    "billingAddressId": billingAddressId,
    "shippingAddressId": shippingAddressId,
    "orderItems": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class OrderItem {
  OrderItem({
    this.sellerProductId,
    this.name,
    this.orderItemState,
    this.quantity,
    this.sellingPrice,
    this.imageList,
    this.thumbnailImage,
    this.updatedAt,
  });

  String? sellerProductId;
  String? name;
  String? orderItemState;
  int? quantity;
  double? sellingPrice;
  List<String>? imageList;
  String? thumbnailImage;
  DateTime? updatedAt;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    sellerProductId: json["sellerProductId"],
    name: json["name"],
    orderItemState: json["orderItemState"],
    quantity: json["quantity"],
    sellingPrice: json["sellingPrice"],
    imageList: json["imageList"] == null ? [] : List<String>.from(json["imageList"]!.map((x) => x)),
    thumbnailImage: json["thumbnailImage"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "sellerProductId": sellerProductId,
    "name": name,
    "orderItemState": orderItemState,
    "quantity": quantity,
    "sellingPrice": sellingPrice,
    "imageList": imageList == null ? [] : List<dynamic>.from(imageList!.map((x) => x)),
    "thumbnailImage": thumbnailImage,
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
