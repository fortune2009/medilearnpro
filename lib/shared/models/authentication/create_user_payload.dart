// To parse this JSON data, do
//
//     final createAccountDto = createAccountDtoFromJson(jsonString);

import 'dart:convert';

CreateAccountDto createAccountDtoFromJson(String str) =>
    CreateAccountDto.fromJson(json.decode(str));

String createAccountDtoToJson(CreateAccountDto data) =>
    json.encode(data.toJson());

class CreateAccountDto {
  String? kind;
  String? idToken;
  String? email;
  String? displayName;
  String? refreshToken;
  String? expiresIn;
  String? localId;
  String? requestType;
  CreateAccountDtoError? error;

  CreateAccountDto({
    this.kind,
    this.idToken,
    this.email,
    this.displayName,
    this.refreshToken,
    this.expiresIn,
    this.localId,
    this.requestType,
    this.error,
  });

  factory CreateAccountDto.fromJson(Map<String, dynamic> json) =>
      CreateAccountDto(
        kind: json["kind"],
        idToken: json["idToken"],
        email: json["email"],
        displayName: json["displayName"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        localId: json["localId"],
        requestType: json["requestType"],
        error: json["error"] == null
            ? null
            : CreateAccountDtoError.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "idToken": idToken,
        "email": email,
        "displayName": displayName,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "localId": localId,
        "requestType": requestType,
        "error": error?.toJson(),
      };
}

class CreateAccountDtoError {
  int? code;
  String? message;
  List<ErrorElement>? errors;

  CreateAccountDtoError({
    this.code,
    this.message,
    this.errors,
  });

  factory CreateAccountDtoError.fromJson(Map<String, dynamic> json) =>
      CreateAccountDtoError(
        code: json["code"],
        message: json["message"],
        errors: json["errors"] == null
            ? []
            : List<ErrorElement>.from(
                json["errors"]!.map((x) => ErrorElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "errors": errors == null
            ? []
            : List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class ErrorElement {
  String? message;
  String? domain;
  String? reason;

  ErrorElement({
    this.message,
    this.domain,
    this.reason,
  });

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "domain": domain,
        "reason": reason,
      };
}
