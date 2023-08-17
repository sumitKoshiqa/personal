// To parse this JSON data, do
//
//     final registrationDataModel = registrationDataModelFromJson(jsonString);

import 'dart:convert';

RegistrationDataModel registrationDataModelFromJson(String str) => RegistrationDataModel.fromJson(json.decode(str));

String registrationDataModelToJson(RegistrationDataModel data) => json.encode(data.toJson());

class RegistrationDataModel {
  int? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  RegResponse? response;

  RegistrationDataModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.response,
  });

  factory RegistrationDataModel.fromJson(Map<String, dynamic> json) => RegistrationDataModel(
    timestamp: json["timestamp"],
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    response: json["response"] == null ? null : RegResponse.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "response": response?.toJson(),
  };
}

class RegResponse {
  String? id;
  Profile? profile;
  dynamic minorProfileList;
  dynamic proxyList;
  dynamic identityDto;

  RegResponse({
    this.id,
    this.profile,
    this.minorProfileList,
    this.proxyList,
    this.identityDto,
  });

  factory RegResponse.fromJson(Map<String, dynamic> json) => RegResponse(
    id: json["id"],
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    minorProfileList: json["minorProfileList"],
    proxyList: json["proxyList"],
    identityDto: json["identityDto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile": profile?.toJson(),
    "minorProfileList": minorProfileList,
    "proxyList": proxyList,
    "identityDto": identityDto,
  };
}

class Profile {
  String? id;
  Name? name;
  String? email;
  Phone? phone;
  String? gender;
  Attribute? attribute;
  ProfileImage? profileImage;
  AuthenticationRequestDto? authenticationRequestDto;

  Profile({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.attribute,
    this.profileImage,
    this.authenticationRequestDto,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    email: json["email"],
    phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
    gender: json["gender"],
    attribute: json["attribute"] == null ? null : Attribute.fromJson(json["attribute"]),
    profileImage: json["profileImage"] == null ? null : ProfileImage.fromJson(json["profileImage"]),
    authenticationRequestDto: json["authenticationRequestDto"] == null ? null : AuthenticationRequestDto.fromJson(json["authenticationRequestDto"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name?.toJson(),
    "email": email,
    "phone": phone?.toJson(),
    "gender": gender,
    "attribute": attribute?.toJson(),
    "profileImage": profileImage?.toJson(),
    "authenticationRequestDto": authenticationRequestDto?.toJson(),
  };
}

class Attribute {
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  Attribute({
    this.additionalProp1,
    this.additionalProp2,
    this.additionalProp3,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    additionalProp1: json["additionalProp1"],
    additionalProp2: json["additionalProp2"],
    additionalProp3: json["additionalProp3"],
  );

  Map<String, dynamic> toJson() => {
    "additionalProp1": additionalProp1,
    "additionalProp2": additionalProp2,
    "additionalProp3": additionalProp3,
  };
}

class AuthenticationRequestDto {
  String? deviceId;
  String? appId;
  CaptchaRequest? captchaRequest;

  AuthenticationRequestDto({
    this.deviceId,
    this.appId,
    this.captchaRequest,
  });

  factory AuthenticationRequestDto.fromJson(Map<String, dynamic> json) => AuthenticationRequestDto(
    deviceId: json["deviceId"],
    appId: json["appId"],
    captchaRequest: json["captchaRequest"] == null ? null : CaptchaRequest.fromJson(json["captchaRequest"]),
  );

  Map<String, dynamic> toJson() => {
    "deviceId": deviceId,
    "appId": appId,
    "captchaRequest": captchaRequest?.toJson(),
  };
}

class CaptchaRequest {
  String? captchaProviderEnum;
  String? response;

  CaptchaRequest({
    this.captchaProviderEnum,
    this.response,
  });

  factory CaptchaRequest.fromJson(Map<String, dynamic> json) => CaptchaRequest(
    captchaProviderEnum: json["captchaProviderEnum"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "captchaProviderEnum": captchaProviderEnum,
    "response": response,
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

class Phone {
  String? countryCode;
  String? number;

  Phone({
    this.countryCode,
    this.number,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    countryCode: json["countryCode"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "number": number,
  };
}

class ProfileImage {
  String? url;
  String? id;

  ProfileImage({
    this.url,
    this.id,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    url: json["url"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "id": id,
  };
}
