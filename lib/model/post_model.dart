// To parse this JSON data, do
//
//     final postModel = postModelFromMap(jsonString);

import 'dart:convert';

List<PostModel> postModelFromMap(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromMap(x)));

String postModelToMap(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PostModel {
  PostModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.links,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  Status? status;
  Type? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  CommentStatus? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  Format? format;
  List<dynamic>? meta;
  List<int>? categories;
  List<int>? tags;
  Links? links;

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
    guid: json["guid"] == null ? null : Guid.fromMap(json["guid"]),
    modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
    slug: json["slug"],
    status: json["status"] == null ? null : statusValues.map![json["status"]],
    type: json["type"] == null ? null : typeValues.map![json["type"]],
    link: json["link"],
    title: json["title"] == null ? null : Guid.fromMap(json["title"]),
    content: json["content"] == null ? null : Content.fromMap(json["content"]),
    excerpt: json["excerpt"] == null ? null : Content.fromMap(json["excerpt"]),
    author: json["author"],
    featuredMedia: json["featured_media"],
    commentStatus: json["comment_status"] == null ? null : commentStatusValues.map![json["comment_status"]],
    pingStatus: json["ping_status"],
    sticky: json["sticky"],
    template: json["template"],
    format: json["format"] == null ? null : formatValues.map![json["format"]],
    meta: json["meta"] == null ? null : List<dynamic>.from(json["meta"].map((x) => x)),
    categories: json["categories"] == null ? null : List<int>.from(json["categories"].map((x) => x)),
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((x) => x)),
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "date": date == null ? null : date!.toIso8601String(),
    "date_gmt": dateGmt == null ? null : dateGmt!.toIso8601String(),
    "guid": guid == null ? null : guid!.toMap(),
    "modified": modified == null ? null : modified!.toIso8601String(),
    "modified_gmt": modifiedGmt == null ? null : modifiedGmt!.toIso8601String(),
    "slug": slug,
    "status": status == null ? null : statusValues.reverse![status],
    "type": type == null ? null : typeValues.reverse![type],
    "link": link,
    "title": title == null ? null : title!.toMap(),
    "content": content == null ? null : content!.toMap(),
    "excerpt": excerpt == null ? null : excerpt!.toMap(),
    "author": author,
    "featured_media": featuredMedia,
    "comment_status": commentStatus == null ? null : commentStatusValues.reverse![commentStatus],
    "ping_status": pingStatus,
    "sticky": sticky,
    "template": template,
    "format": format == null ? null : formatValues.reverse![format],
    "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
    "_links": links == null ? null : links!.toMap(),
  };
}

enum CommentStatus { CLOSED, OPEN }

final commentStatusValues = EnumValues({
  "closed": CommentStatus.CLOSED,
  "open": CommentStatus.OPEN
});

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Content.fromMap(Map<String, dynamic> json) => Content(
    rendered: json["rendered"],
    protected: json["protected"],
  );

  Map<String, dynamic> toMap() => {
    "rendered": rendered,
    "protected": protected,
  };
}

enum Format { STANDARD }

final formatValues = EnumValues({
  "standard": Format.STANDARD
});

class Guid {
  Guid({
    this.rendered,
  });

  String? rendered;

  factory Guid.fromMap(Map<String, dynamic> json) => Guid(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toMap() => {
    "rendered": rendered,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;
  List<VersionHistory>? versionHistory;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromMap(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromMap(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromMap(x))),
    author: json["author"] == null ? null : List<Author>.from(json["author"].map((x) => Author.fromMap(x))),
    replies: json["replies"] == null ? null : List<Author>.from(json["replies"].map((x) => Author.fromMap(x))),
    versionHistory: json["version-history"] == null ? null : List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromMap(x))),
    wpAttachment: json["wp:attachment"] == null ? null : List<About>.from(json["wp:attachment"].map((x) => About.fromMap(x))),
    wpTerm: json["wp:term"] == null ? null : List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromMap(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toMap())),
    "about": about == null ? null : List<dynamic>.from(about!.map((x) => x.toMap())),
    "author": author == null ? null : List<dynamic>.from(author!.map((x) => x.toMap())),
    "replies": replies == null ? null : List<dynamic>.from(replies!.map((x) => x.toMap())),
    "version-history": versionHistory == null ? null : List<dynamic>.from(versionHistory!.map((x) => x.toMap())),
    "wp:attachment": wpAttachment == null ? null : List<dynamic>.from(wpAttachment!.map((x) => x.toMap())),
    "wp:term": wpTerm == null ? null : List<dynamic>.from(wpTerm!.map((x) => x.toMap())),
    "curies": curies == null ? null : List<dynamic>.from(curies!.map((x) => x.toMap())),
  };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromMap(Map<String, dynamic> json) => About(
    href: json["href"],
  );

  Map<String, dynamic> toMap() => {
    "href": href,
  };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromMap(Map<String, dynamic> json) => Author(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toMap() => {
    "embeddable": embeddable,
    "href": href,
  };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  Name? name;
  Href? href;
  bool? templated;

  factory Cury.fromMap(Map<String, dynamic> json) => Cury(
    name: json["name"] == null ? null : nameValues.map![json["name"]],
    href: json["href"] == null ? null : hrefValues.map![json["href"]],
    templated: json["templated"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : nameValues.reverse![name],
    "href": href == null ? null : hrefValues.reverse![href],
    "templated": templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
  "wp": Name.WP
});

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromMap(Map<String, dynamic> json) => VersionHistory(
    count: json["count"],
    href: json["href"],
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "href": href,
  };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromMap(Map<String, dynamic> json) => WpTerm(
    taxonomy: json["taxonomy"] == null ? null : taxonomyValues.map![json["taxonomy"]],
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toMap() => {
    "taxonomy": taxonomy == null ? null : taxonomyValues.reverse![taxonomy],
    "embeddable": embeddable,
    "href": href,
  };
}

enum Taxonomy { CATEGORY, POST_TAG }

final taxonomyValues = EnumValues({
  "category": Taxonomy.CATEGORY,
  "post_tag": Taxonomy.POST_TAG
});

enum Status { PUBLISH }

final statusValues = EnumValues({
  "publish": Status.PUBLISH
});

enum Type { POST }

final typeValues = EnumValues({
  "post": Type.POST
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
