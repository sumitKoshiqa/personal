// To parse this JSON data, do
//
//     final minorSearchResponseModel = minorSearchResponseModelFromJson(jsonString);

import 'dart:convert';

MinorSearchResponseModel minorSearchResponseModelFromJson(String str) => MinorSearchResponseModel.fromJson(json.decode(str));

String minorSearchResponseModelToJson(MinorSearchResponseModel data) => json.encode(data.toJson());

class MinorSearchResponseModel {
  int? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  Data? data;

  MinorSearchResponseModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.data,
  });

  factory MinorSearchResponseModel.fromJson(Map<String, dynamic> json) => MinorSearchResponseModel(
    timestamp: json["timestamp"],
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    data: json["response"] == null ? null : Data.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
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
  String? id;
  String? ssn;
  String? zipCode;
  DateTime? dob;
  Name? name;
  String? email;
  dynamic phone;
  String? gender;

  Data({
    this.id,
    this.ssn,
    this.zipCode,
    this.dob,
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    ssn: json["ssn"],
    zipCode: json["zipCode"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ssn": ssn,
    "zipCode": zipCode,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "name": name?.toJson(),
    "email": email,
    "phone": phone,
    "gender": gender,
  };
}

class Name {
  String? firstName;
  String? lastName;

  Name({
    this.firstName,
    this.lastName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
  };
}
