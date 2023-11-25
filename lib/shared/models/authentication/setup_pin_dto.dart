// To parse this JSON data, do
//
//     final setupPinDto = setupPinDtoFromJson(jsonString);

import 'dart:convert';

SetupPinDto setupPinDtoFromJson(String str) => SetupPinDto.fromJson(json.decode(str));

String setupPinDtoToJson(SetupPinDto data) => json.encode(data.toJson());

class SetupPinDto {
  final bool? error;
  final String? message;
  final Data? data;

  SetupPinDto({
    this.error,
    this.message,
    this.data,
  });

  factory SetupPinDto.fromJson(Map<String, dynamic> json) => SetupPinDto(
    error: json["error"],
    message: json["message"],
    data: json["data"] == null ? null : json["data"] is List ? Data() : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String? referralCode;

  Data({
    this.referralCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    referralCode: json["referral_code"],
  );

  Map<String, dynamic> toJson() => {
    "referral_code": referralCode,
  };
}
