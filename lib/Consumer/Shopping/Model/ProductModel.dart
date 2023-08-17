import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  DateTime? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  List<ProductList>? data;

  ProductModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    data: json["response"] == null ? [] : List<ProductList>.from(json["response"]!.map((x) => ProductList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProductList {
  SellerDto? sellerDto;
  ProductDto? productDto;
  String? productId;
  String? sellerId;
  double? sellingPrice;
  int? availableUnits;
  String? id;
  String? datumId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductList({
    this.sellerDto,
    this.productDto,
    this.productId,
    this.sellerId,
    this.sellingPrice,
    this.availableUnits,
    this.id,
    this.datumId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    sellerDto: json["sellerDto"] == null ? null : SellerDto.fromJson(json["sellerDto"]),
    productDto: json["productDto"] == null ? null : ProductDto.fromJson(json["productDto"]),
    productId: json["productId"],
    sellerId: json["sellerId"],
    sellingPrice: json["sellingPrice"],
    availableUnits: json["availableUnits"],
    id: json["id"],
    datumId: json["id"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "sellerDto": sellerDto?.toJson(),
    "productDto": productDto?.toJson(),
    "productId": productId,
    "sellerId": sellerId,
    "sellingPrice": sellingPrice,
    "availableUnits": availableUnits,
    "id": datumId,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Id {
  int? timestamp;
  int? counter;
  int? randomValue1;
  int? randomValue2;

  Id({
    this.timestamp,
    this.counter,
    this.randomValue1,
    this.randomValue2,
  });

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

class ProductDto {
  String? name;
  String? description;
  String? sku;
  double? mrp;
  double? weight;
  List<String>? categoryIdList;
  String? brandId;
  String? sellerId;
  int? availableUnits;
  int? lowStockLimit;
  List<String>? imageList;
  String? thumbnailImage;
  Id? id;
  String? productDtoId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductDto({
    this.name,
    this.description,
    this.sku,
    this.mrp,
    this.weight,
    this.categoryIdList,
    this.brandId,
    this.sellerId,
    this.availableUnits,
    this.lowStockLimit,
    this.imageList,
    this.thumbnailImage,
    this.id,
    this.productDtoId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
    name: json["name"],
    description: json["description"],
    sku: json["sku"],
    mrp: json["mrp"],
    weight: json["weight"],
    categoryIdList: json["categoryIdList"] == null ? [] : List<String>.from(json["categoryIdList"]!.map((x) => x)),
    brandId: json["brandId"],
    sellerId: json["sellerId"],
    availableUnits: json["availableUnits"],
    lowStockLimit: json["lowStockLimit"],
    imageList: json["imageList"] == null ? [] : List<String>.from(json["imageList"]!.map((x) => x)),
    thumbnailImage: json["thumbnailImage"],
    id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
    productDtoId: json["id"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "sku": sku,
    "mrp": mrp,
    "weight": weight,
    "categoryIdList": categoryIdList == null ? [] : List<dynamic>.from(categoryIdList!.map((x) => x)),
    "brandId": brandId,
    "sellerId": sellerId,
    "availableUnits": availableUnits,
    "lowStockLimit": lowStockLimit,
    "imageList": imageList == null ? [] : List<dynamic>.from(imageList!.map((x) => x)),
    "thumbnailImage": thumbnailImage,
    "_id": id?.toJson(),
    "id": productDtoId,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class SellerDto {
  String? name;
  String? description;
  String? type;
  String? link;
  ContactInfo? contactInfo;
  Id? id;
  String? sellerDtoId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  SellerDto({
    this.name,
    this.description,
    this.type,
    this.link,
    this.contactInfo,
    this.id,
    this.sellerDtoId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SellerDto.fromJson(Map<String, dynamic> json) => SellerDto(
    name: json["name"],
    description: json["description"],
    type: json["type"],
    link: json["link"],
    contactInfo: json["contactInfo"] == null ? null : ContactInfo.fromJson(json["contactInfo"]),
    id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
    sellerDtoId: json["id"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "type": type,
    "link": link,
    "contactInfo": contactInfo?.toJson(),
    "_id": id?.toJson(),
    "id": sellerDtoId,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class ContactInfo {
  String? phoneNumber;
  String? email;

  ContactInfo({
    this.phoneNumber,
    this.email,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
    phoneNumber: json["phoneNumber"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "email": email,
  };
}
