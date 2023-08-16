import 'dart:convert';

VerifyOtpResponseModel verifyOtpResponseModelFromJson(String str) => VerifyOtpResponseModel.fromJson(json.decode(str));

String verifyOtpResponseModelToJson(VerifyOtpResponseModel data) => json.encode(data.toJson());

class VerifyOtpResponseModel {
  VerifyOtpResponseModel({
    required this.timestamp,
    required this.status,
    required this.statusCode,
    required this.statusSubCode,
    required this.message,
    required this.hostName,
    required this.requestId,
    required this.verifyResponse,
  });

  int timestamp;
  int status;
  String statusCode;
  String statusSubCode;
  String message;
  String hostName;
  String requestId;
  VerifyResponse verifyResponse;

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) => VerifyOtpResponseModel(
    timestamp: json["timestamp"],
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    verifyResponse: VerifyResponse.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "VerifyResponse": verifyResponse.toJson(),
  };
}

class VerifyResponse {
  VerifyResponse({
    required this.token,
    required this.issuedAt,
    required this.expiresAt,
  });

  String token;
  int issuedAt;
  int expiresAt;

  factory VerifyResponse.fromJson(Map<String, dynamic> json) => VerifyResponse(
    token: json["token"],
    issuedAt: json["issuedAt"],
    expiresAt: json["expiresAt"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "issuedAt": issuedAt,
    "expiresAt": expiresAt,
  };
}
