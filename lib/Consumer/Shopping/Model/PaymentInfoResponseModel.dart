import 'dart:convert';

PaymentInfoResponseModel paymentInfoResponseModelFromJson(String str) => PaymentInfoResponseModel.fromJson(json.decode(str));

String paymentInfoResponseModelToJson(PaymentInfoResponseModel data) => json.encode(data.toJson());

class PaymentInfoResponseModel {
  PaymentInfoResponseModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.data,
  });

  DateTime? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  Data? data;

  factory PaymentInfoResponseModel.fromJson(Map<String, dynamic> json) => PaymentInfoResponseModel(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    data: json["response"] == null ? null : Data.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.orderState,
    this.paymentDetails,
  });

  String? orderState;
  PaymentDetails? paymentDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderState: json["orderState"],
    paymentDetails: json["paymentDetails"] == null ? null : PaymentDetails.fromJson(json["paymentDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "orderState": orderState,
    "paymentDetails": paymentDetails?.toJson(),
  };
}

class PaymentDetails {
  PaymentDetails({
    this.paymentGateway,
    this.clientSecret,
  });

  String? paymentGateway;
  String? clientSecret;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
    paymentGateway: json["paymentGateway"],
    clientSecret: json["clientSecret"],
  );

  Map<String, dynamic> toJson() => {
    "paymentGateway": paymentGateway,
    "clientSecret": clientSecret,
  };
}
