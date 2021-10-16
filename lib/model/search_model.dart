// To parse this JSON data, do
//
//     final searchModel = searchModelFromMap(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromMap(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromMap(x)));

String searchModelToMap(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class SearchModel {
  SearchModel({
    this.id,
    this.title,
    this.url,
    this.type,
    this.subtype,
    this.links,
  });

  int? id;
  String? title;
  String? url;
  String? type;
  String? subtype;
  Links? links;

  factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    type: json["type"] == null ? null : json["type"],
    subtype: json["subtype"] == null ? null : json["subtype"],
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "url": url == null ? null : url,
    "type": type == null ? null : type,
    "subtype": subtype == null ? null : subtype,
    "_links": links == null ? null : links!.toMap(),
  };
}

class Links {
  Links({
    this.self,
    this.about,
    this.collection,
  });

  List<Self>? self;
  List<About>? about;
  List<About>? collection;

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<Self>.from(json["self"].map((x) => Self.fromMap(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromMap(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "about": about == null ? null : List<dynamic>.from(about!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
  };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromMap(Map<String, dynamic> json) => About(
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "href": href == null ? null : href,
  };
}

class Self {
  Self({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Self.fromMap(Map<String, dynamic> json) => Self(
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toMap() => {
    "embeddable": embeddable == null ? null : embeddable,
    "href": href == null ? null : href,
  };
}
