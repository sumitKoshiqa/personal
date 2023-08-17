import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) => json.encode(data.toJson());

class ProfileResponseModel {
  int? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  Data? data;

  ProfileResponseModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
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
  Profile? profile;
  List<Profile>? minorProfileList;
  List<ProxyList>? proxyList;
  IdentityDto? identityDto;

  Data({
    this.id,
    this.profile,
    this.minorProfileList,
    this.proxyList,
    this.identityDto,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    minorProfileList: json["minorProfileList"] == null ? [] : List<Profile>.from(json["minorProfileList"]!.map((x) => Profile.fromJson(x))),
    proxyList: json["proxyList"] == null ? [] : List<ProxyList>.from(json["proxyList"]!.map((x) => ProxyList.fromJson(x))),
    identityDto: json["identityDto"] == null ? null : IdentityDto.fromJson(json["identityDto"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile": profile?.toJson(),
    "minorProfileList": minorProfileList == null ? [] : List<dynamic>.from(minorProfileList!.map((x) => x.toJson())),
    "proxyList": proxyList == null ? [] : List<dynamic>.from(proxyList!.map((x) => x.toJson())),
    "identityDto": identityDto?.toJson(),
  };
}

class IdentityDto {
  String? id;
  String? ssn;
  String? zipCode;
  DateTime? dob;
  Name? name;
  String? email;
  dynamic phone;
  String? gender;

  IdentityDto({
    this.id,
    this.ssn,
    this.zipCode,
    this.dob,
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  factory IdentityDto.fromJson(Map<String, dynamic> json) => IdentityDto(
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

class Profile {
  String? id;
  Name? name;
  String? email;
  Phone? phone;
  String? gender;
  ProfileImage? profileImage;

  Profile({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.profileImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    email: json["email"],
    phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
    gender: json["gender"],
    profileImage: json["profileImage"] == null ? null : ProfileImage.fromJson(json["profileImage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name?.toJson(),
    "email": email,
    "phone": phone?.toJson(),
    "gender": gender,
    "profileImage": profileImage?.toJson(),
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

class ProxyList {
  String? userId;
  String? profileId;
  String? email;
  Phone? phone;
  Profile? profile;
  dynamic isVerified;

  ProxyList({
    this.userId,
    this.profileId,
    this.email,
    this.phone,
    this.profile,
    this.isVerified,
  });

  factory ProxyList.fromJson(Map<String, dynamic> json) => ProxyList(
    userId: json["userId"],
    profileId: json["profileId"],
    email: json["email"],
    phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    isVerified: json["isVerified"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "profileId": profileId,
    "email": email,
    "phone": phone?.toJson(),
    "profile": profile?.toJson(),
    "isVerified": isVerified,
  };
}
