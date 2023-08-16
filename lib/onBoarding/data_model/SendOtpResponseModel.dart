import 'dart:convert';

SendOtpResponseModel sendOtpResponseModelFromJson(String str) => SendOtpResponseModel.fromJson(json.decode(str));

String sendOtpResponseModelToJson(SendOtpResponseModel data) => json.encode(data.toJson());

class SendOtpResponseModel {
  SendOtpResponseModel({
    required this.timestamp,
    required this.status,
    required this.statusCode,
    required this.statusSubCode,
    required this.message,
    required this.hostName,
    required this.requestId,
    required this.otpResponse,
  });

  int timestamp;
  int status;
  String statusCode;
  String statusSubCode;
  String message;
  String hostName;
  String requestId;
  OtpResponse otpResponse;

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) => SendOtpResponseModel(
    timestamp: json["timestamp"],
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    otpResponse: OtpResponse.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "otpResponse": otpResponse.toJson(),
  };
}

class OtpResponse {
  OtpResponse({
    required this.message,
  });

  String message;

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
