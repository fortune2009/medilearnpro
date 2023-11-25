// To parse this JSON data, do
//
//     final setupMerchantAccountDto = setupMerchantAccountDtoFromJson(jsonString);

import 'dart:convert';

SetupMerchantAccountDto setupMerchantAccountDtoFromJson(String str) => SetupMerchantAccountDto.fromJson(json.decode(str));

String setupMerchantAccountDtoToJson(SetupMerchantAccountDto data) => json.encode(data.toJson());

class SetupMerchantAccountDto {
  final bool? error;
  final String? message;
  final SetupMerchantData? data;

  SetupMerchantAccountDto({
    this.error,
    this.message,
    this.data,
  });

  factory SetupMerchantAccountDto.fromJson(Map<String, dynamic> json) => SetupMerchantAccountDto(
    error: json["error"],
    message: json["message"],
    data: json["data"] == null ? null : json["data"] is List ? SetupMerchantData() : SetupMerchantData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data?.toJson(),
  };
}

class SetupMerchantData {
  final String? phoneno;
  final String? networkProvider;
  final String? countryCode;
  final String? firstname;
  final String? lastname;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  SetupMerchantData({
    this.phoneno,
    this.networkProvider,
    this.countryCode,
    this.firstname,
    this.lastname,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory SetupMerchantData.fromJson(Map<String, dynamic> json) => SetupMerchantData(
    phoneno: json["phoneno"],
    networkProvider: json["network_provider"],
    countryCode: json["country_code"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "phoneno": phoneno,
    "network_provider": networkProvider,
    "country_code": countryCode,
    "firstname": firstname,
    "lastname": lastname,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
