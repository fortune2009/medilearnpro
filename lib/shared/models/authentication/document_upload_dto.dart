// To parse this JSON data, do
//
//     final documentUploadDto = documentUploadDtoFromJson(jsonString);

import 'dart:convert';

DocumentUploadDto documentUploadDtoFromJson(String str) => DocumentUploadDto.fromJson(json.decode(str));

String documentUploadDtoToJson(DocumentUploadDto data) => json.encode(data.toJson());

class DocumentUploadDto {
  final bool? error;
  final String? message;
  final Data? data;

  DocumentUploadDto({
    this.error,
    this.message,
    this.data,
  });

  factory DocumentUploadDto.fromJson(Map<String, dynamic> json) => DocumentUploadDto(
    error: json["error"],
    message: json["message"],
    data: json["data"] == null ? null : json["data"] is List ? Data() :Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final List<dynamic>? recordUploaded;
  final List<RecordExist>? recordExist;

  Data({
    this.recordUploaded,
    this.recordExist,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    recordUploaded: json["Record Uploaded"] == null ? [] : List<dynamic>.from(json["Record Uploaded"]!.map((x) => x)),
    recordExist: json["Record Exist"] == null ? [] : List<RecordExist>.from(json["Record Exist"]!.map((x) => RecordExist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Record Uploaded": recordUploaded == null ? [] : List<dynamic>.from(recordUploaded!.map((x) => x)),
    "Record Exist": recordExist == null ? [] : List<dynamic>.from(recordExist!.map((x) => x.toJson())),
  };
}

class RecordExist {
  final int? userId;
  final String? documentCategory;
  final dynamic file;

  RecordExist({
    this.userId,
    this.documentCategory,
    this.file,
  });

  factory RecordExist.fromJson(Map<String, dynamic> json) => RecordExist(
    userId: json["user_id"],
    documentCategory: json["document_category"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "document_category": documentCategory,
    "file": file,
  };
}
