import 'dart:convert';

OtherProfileResponseModel otherProfileResponseModelFromJson(String str) => OtherProfileResponseModel.fromJson(json.decode(str));

String otherProfileResponseModelToJson(OtherProfileResponseModel data) => json.encode(data.toJson());

class OtherProfileResponseModel {
  int? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  Data? data;

  OtherProfileResponseModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.data,
  });

  factory OtherProfileResponseModel.fromJson(Map<String, dynamic> json) => OtherProfileResponseModel(
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
  Name? name;
  String? email;
  Phone? phone;
  String? gender;
  Attribute? attribute;
  ProfileImage? profileImage;
  AuthenticationRequestDto? authenticationRequestDto;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.attribute,
    this.profileImage,
    this.authenticationRequestDto,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
