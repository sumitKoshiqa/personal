import 'dart:convert';

AddressResponseModel addressResponseModelFromJson(String str) => AddressResponseModel.fromJson(json.decode(str));

String addressResponseModelToJson(AddressResponseModel data) => json.encode(data.toJson());

class AddressResponseModel {
  AddressResponseModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.data,
  });

  int? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  Data? data;

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) => AddressResponseModel(
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
  Data({
    this.userId,
    this.profileId,
    this.active,
    this.addressList,
  });

  String? userId;
  String? profileId;
  bool? active;
  List<AddressList>? addressList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    profileId: json["profileId"],
    active: json["active"],
    addressList: json["addressList"] == null ? [] : List<AddressList>.from(json["addressList"]!.map((x) => AddressList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "profileId": profileId,
    "active": active,
    "addressList": addressList == null ? [] : List<dynamic>.from(addressList!.map((x) => x.toJson())),
  };
}

class AddressList {
  AddressList({
    this.id,
    this.name,
    this.line1,
    this.line2,
    this.pinCodeId,
    this.cityId,
    this.stateId,
    this.countryId,
    this.latitude,
    this.longitude,
    this.mailId,
    this.phoneNumber,
    this.isDefault,
    this.pinCode,
    this.city,
    this.state,
    this.country,
  });

  String? id;
  String? name;
  String? line1;
  String? line2;
  String? pinCodeId;
  String? cityId;
  String? stateId;
  String? countryId;
  double? latitude;
  double? longitude;
  String? mailId;
  String? phoneNumber;
  bool? isDefault;
  PinCode? pinCode;
  City? city;
  State? state;
  City? country;

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
    id: json["id"],
    name: json["name"],
    line1: json["line1"],
    line2: json["line2"],
    pinCodeId: json["pinCodeId"],
    cityId: json["cityId"],
    stateId: json["stateId"],
    countryId: json["countryId"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    mailId: json["mailId"],
    phoneNumber: json["phoneNumber"],
    isDefault: json["isDefault"],
    pinCode: json["pinCode"] == null ? null : PinCode.fromJson(json["pinCode"]),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    state: json["state"] == null ? null : State.fromJson(json["state"]),
    country: json["country"] == null ? null : City.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "line1": line1,
    "line2": line2,
    "pinCodeId": pinCodeId,
    "cityId": cityId,
    "stateId": stateId,
    "countryId": countryId,
    "latitude": latitude,
    "longitude": longitude,
    "mailId": mailId,
    "phoneNumber": phoneNumber,
    "isDefault": isDefault,
    "pinCode": pinCode?.toJson(),
    "city": city?.toJson(),
    "state": state?.toJson(),
    "country": country?.toJson(),
  };
}

class City {
  City({
    this.id,
    this.name,
    this.shortCode,
    this.pinCodeList,
    this.stateList,
  });

  String? id;
  String? name;
  String? shortCode;
  dynamic pinCodeList;
  dynamic stateList;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    shortCode: json["shortCode"],
    pinCodeList: json["pinCodeList"],
    stateList: json["stateList"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "shortCode": shortCode,
    "pinCodeList": pinCodeList,
    "stateList": stateList,
  };
}

class PinCode {
  PinCode({
    this.id,
    this.pinCode,
    this.cityList,
  });

  String? id;
  String? pinCode;
  dynamic cityList;

  factory PinCode.fromJson(Map<String, dynamic> json) => PinCode(
    id: json["id"],
    pinCode: json["pinCode"],
    cityList: json["cityList"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pinCode": pinCode,
    "cityList": cityList,
  };
}

class State {
  State({
    this.id,
    this.name,
    this.shortCode,
    this.cityList,
    this.countryList,
  });

  String? id;
  String? name;
  String? shortCode;
  dynamic cityList;
  dynamic countryList;

  factory State.fromJson(Map<String, dynamic> json) => State(
    id: json["id"],
    name: json["name"],
    shortCode: json["shortCode"],
    cityList: json["cityList"],
    countryList: json["countryList"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "shortCode": shortCode,
    "cityList": cityList,
    "countryList": countryList,
  };
}
