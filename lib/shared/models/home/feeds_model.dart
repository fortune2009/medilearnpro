// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'dart:convert';

FeedModel feedModelFromJson(String str) => FeedModel.fromJson(json.decode(str));

String feedModelToJson(FeedModel data) => json.encode(data.toJson());

class FeedModel {
  Result? result;

  FeedModel({
    this.result,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        result: json["Result"] == null ? null : Result.fromJson(json["Result"]),
      );

  Map<String, dynamic> toJson() => {
        "Result": result?.toJson(),
      };
}

class Result {
  String? error;
  int? total;
  Query? query;
  String? language;
  Resources? resources;

  Result({
    this.error,
    this.total,
    this.query,
    this.language,
    this.resources,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        error: json["Error"],
        total: json["Total"],
        query: json["Query"] == null ? null : Query.fromJson(json["Query"]),
        language: json["Language"],
        resources: json["Resources"] == null
            ? null
            : Resources.fromJson(json["Resources"]),
      );

  Map<String, dynamic> toJson() => {
        "Error": error,
        "Total": total,
        "Query": query?.toJson(),
        "Language": language,
        "Resources": resources?.toJson(),
      };
}

class Query {
  String? apiVersion;
  String? apiType;
  String? topicId;
  dynamic toolId;
  dynamic categoryId;
  dynamic populationId;
  dynamic keyword;
  dynamic who;
  dynamic age;
  dynamic sex;
  dynamic pregnant;
  dynamic tobaccoUse;
  dynamic sexuallyActive;
  dynamic category;
  String? lang;
  dynamic type;
  String? returnType;
  dynamic callback;
  dynamic healthfinderPage;
  String? aPiType;

  Query({
    this.apiVersion,
    this.apiType,
    this.topicId,
    this.toolId,
    this.categoryId,
    this.populationId,
    this.keyword,
    this.who,
    this.age,
    this.sex,
    this.pregnant,
    this.tobaccoUse,
    this.sexuallyActive,
    this.category,
    this.lang,
    this.type,
    this.returnType,
    this.callback,
    this.healthfinderPage,
    this.aPiType,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        apiVersion: json["ApiVersion"],
        apiType: json["ApiType"],
        topicId: json["TopicId"],
        toolId: json["ToolId"],
        categoryId: json["CategoryId"],
        populationId: json["PopulationId"],
        keyword: json["Keyword"],
        who: json["Who"],
        age: json["Age"],
        sex: json["Sex"],
        pregnant: json["Pregnant"],
        tobaccoUse: json["TobaccoUse"],
        sexuallyActive: json["SexuallyActive"],
        category: json["Category"],
        lang: json["Lang"],
        type: json["Type"],
        returnType: json["ReturnType"],
        callback: json["Callback"],
        healthfinderPage: json["HealthfinderPage"],
        aPiType: json["APiType"],
      );

  Map<String, dynamic> toJson() => {
        "ApiVersion": apiVersion,
        "ApiType": apiType,
        "TopicId": topicId,
        "ToolId": toolId,
        "CategoryId": categoryId,
        "PopulationId": populationId,
        "Keyword": keyword,
        "Who": who,
        "Age": age,
        "Sex": sex,
        "Pregnant": pregnant,
        "TobaccoUse": tobaccoUse,
        "SexuallyActive": sexuallyActive,
        "Category": category,
        "Lang": lang,
        "Type": type,
        "ReturnType": returnType,
        "Callback": callback,
        "HealthfinderPage": healthfinderPage,
        "APiType": aPiType,
      };
}

class Resources {
  List<Resource>? resource;

  Resources({
    this.resource,
  });

  factory Resources.fromJson(Map<String, dynamic> json) => Resources(
        resource: json["Resource"] == null
            ? []
            : List<Resource>.from(
                json["Resource"]!.map((x) => Resource.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Resource": resource == null
            ? []
            : List<dynamic>.from(resource!.map((x) => x.toJson())),
      };
}

class Resource {
  String? type;
  String? id;
  String? title;
  String? translationId;
  String? translationTitle;
  String? categories;
  String? populations;
  String? myHfTitle;
  String? myHfDescription;
  String? myHfCategory;
  String? myHfCategoryHeading;
  String? lastUpdate;
  String? imageUrl;
  String? imageAlt;
  String? accessibleVersion;
  RelatedItems? relatedItems;
  Sections? sections;
  dynamic moreInfoItems;
  String? healthfinderLogo;
  String? healthfinderUrl;

  Resource({
    this.type,
    this.id,
    this.title,
    this.translationId,
    this.translationTitle,
    this.categories,
    this.populations,
    this.myHfTitle,
    this.myHfDescription,
    this.myHfCategory,
    this.myHfCategoryHeading,
    this.lastUpdate,
    this.imageUrl,
    this.imageAlt,
    this.accessibleVersion,
    this.relatedItems,
    this.sections,
    this.moreInfoItems,
    this.healthfinderLogo,
    this.healthfinderUrl,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        type: json["Type"],
        id: json["Id"],
        title: json["Title"],
        translationId: json["TranslationId"],
        translationTitle: json["TranslationTitle"],
        categories: json["Categories"],
        populations: json["Populations"],
        myHfTitle: json["MyHFTitle"],
        myHfDescription: json["MyHFDescription"],
        myHfCategory: json["MyHFCategory"],
        myHfCategoryHeading: json["MyHFCategoryHeading"],
        lastUpdate: json["LastUpdate"],
        imageUrl: json["ImageUrl"],
        imageAlt: json["ImageAlt"],
        accessibleVersion: json["AccessibleVersion"],
        relatedItems: json["RelatedItems"] == null
            ? null
            : RelatedItems.fromJson(json["RelatedItems"]),
        sections: json["Sections"] == null
            ? null
            : Sections.fromJson(json["Sections"]),
        moreInfoItems: json["MoreInfoItems"],
        healthfinderLogo: json["HealthfinderLogo"],
        healthfinderUrl: json["HealthfinderUrl"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Id": id,
        "Title": title,
        "TranslationId": translationId,
        "TranslationTitle": translationTitle,
        "Categories": categories,
        "Populations": populations,
        "MyHFTitle": myHfTitle,
        "MyHFDescription": myHfDescription,
        "MyHFCategory": myHfCategory,
        "MyHFCategoryHeading": myHfCategoryHeading,
        "LastUpdate": lastUpdate,
        "ImageUrl": imageUrl,
        "ImageAlt": imageAlt,
        "AccessibleVersion": accessibleVersion,
        "RelatedItems": relatedItems?.toJson(),
        "Sections": sections?.toJson(),
        "MoreInfoItems": moreInfoItems,
        "HealthfinderLogo": healthfinderLogo,
        "HealthfinderUrl": healthfinderUrl,
      };
}

class RelatedItems {
  List<RelatedItem>? relatedItem;

  RelatedItems({
    this.relatedItem,
  });

  factory RelatedItems.fromJson(Map<String, dynamic> json) => RelatedItems(
        relatedItem: json["RelatedItem"] == null
            ? []
            : List<RelatedItem>.from(
                json["RelatedItem"]!.map((x) => RelatedItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RelatedItem": relatedItem == null
            ? []
            : List<dynamic>.from(relatedItem!.map((x) => x.toJson())),
      };
}

class RelatedItem {
  String? type;
  String? id;
  String? title;
  String? url;

  RelatedItem({
    this.type,
    this.id,
    this.title,
    this.url,
  });

  factory RelatedItem.fromJson(Map<String, dynamic> json) => RelatedItem(
        type: json["Type"],
        id: json["Id"],
        title: json["Title"],
        url: json["Url"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Id": id,
        "Title": title,
        "Url": url,
      };
}

class Sections {
  List<Section>? section;

  Sections({
    this.section,
  });

  factory Sections.fromJson(Map<String, dynamic> json) => Sections(
        section: json["section"] == null
            ? []
            : List<Section>.from(
                json["section"]!.map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "section": section == null
            ? []
            : List<dynamic>.from(section!.map((x) => x.toJson())),
      };
}

class Section {
  String? title;
  String? description;
  String? content;

  Section({
    this.title,
    this.description,
    this.content,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        title: json["Title"],
        description: json["Description"],
        content: json["Content"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Description": description,
        "Content": content,
      };
}
