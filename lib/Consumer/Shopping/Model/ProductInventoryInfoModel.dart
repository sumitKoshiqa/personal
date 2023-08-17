import 'dart:convert';

ProductInventoryInfoModel productInventoryInfoModelFromJson(String str) => ProductInventoryInfoModel.fromJson(json.decode(str));

String productInventoryInfoModelToJson(ProductInventoryInfoModel data) => json.encode(data.toJson());

class ProductInventoryInfoModel {
  ProductInventoryInfoModel({
    required this.timestamp,
    required this.status,
    required this.statusCode,
    required this.statusSubCode,
    required this.message,
    required this.hostName,
    required this.requestId,
    required this.inventoryInfo,
  });

  DateTime timestamp;
  int status;
  String statusCode;
  String statusSubCode;
  String message;
  String hostName;
  String requestId;
  InventoryInfo inventoryInfo;

  factory ProductInventoryInfoModel.fromJson(Map<String, dynamic> json) => ProductInventoryInfoModel(
    timestamp: DateTime.parse(json["timestamp"]),
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    inventoryInfo: InventoryInfo.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "inventoryInfo": inventoryInfo.toJson(),
  };
}

class InventoryInfo {
  InventoryInfo({
    required this.productId,
    required this.sellerId,
    required this.sellingPrice,
    // required this.availableUnits,
    // required this.id,
    // required this.inventoryInfoId,
    // required this.status,
    // required this.createdAt,
    // required this.updatedAt,
  });

  String productId;
  String sellerId;
  double sellingPrice;
  // int availableUnits;
  // Id id;
  // String inventoryInfoId;
  // int status;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory InventoryInfo.fromJson(Map<String, dynamic> json) => InventoryInfo(
    productId: json["productId"],
    sellerId: json["sellerId"],
    sellingPrice: json["sellingPrice"],
    // availableUnits: json["availableUnits"],
    // id: Id.fromJson(json["_id"]),
    // inventoryInfoId: json["id"],
    // status: json["status"],
    // createdAt: DateTime.parse(json["createdAt"]),
    // updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "sellerId": sellerId,
    "sellingPrice": sellingPrice,
    // "availableUnits": availableUnits,
    // "_id": id.toJson(),
    // "id": inventoryInfoId,
    // "status": status,
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
  };
}

class Id {
  Id({
    required this.timestamp,
    required this.counter,
    required this.randomValue1,
    required this.randomValue2,
  });

  int timestamp;
  int counter;
  int randomValue1;
  int randomValue2;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    timestamp: json["timestamp"],
    counter: json["counter"],
    randomValue1: json["randomValue1"],
    randomValue2: json["randomValue2"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "counter": counter,
    "randomValue1": randomValue1,
    "randomValue2": randomValue2,
  };
}
