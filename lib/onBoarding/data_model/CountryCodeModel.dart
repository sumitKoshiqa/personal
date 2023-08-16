import 'dart:convert';

List<CountryCodeModel> countryCodeModelFromJson(String str) => List<CountryCodeModel>.from(json.decode(str).map((x) => CountryCodeModel.fromJson(x)));

String countryCodeModelToJson(List<CountryCodeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryCodeModel {
  CountryCodeModel({
    required this.name,
    required this.flag,
    required this.code,
    required this.dialCode,
  });

  String name;
  String flag;
  String code;
  String dialCode;

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) => CountryCodeModel(
    name: json["name"],
    flag: json["flag"],
    code: json["code"],
    dialCode: json["dial_code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "flag": flag,
    "code": code,
    "dial_code": dialCode,
  };
}
