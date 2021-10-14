import 'dart:convert';

SearchResult searchResultFromJson(String str) => SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
    SearchResult({
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

    SearchResult copyWith({
        int? id,
        String? title,
        String? url,
        String? type,
        String? subtype,
        Links? links,
    }) => 
        SearchResult(
            id: id ?? this.id,
            title: title ?? this.title,
            url: url ?? this.url,
            type: type ?? this.type,
            subtype: subtype ?? this.subtype,
            links: links ?? this.links,
        );

    factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        type: json["type"],
        subtype: json["subtype"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "type": type,
        "subtype": subtype,
        "_links": links!.toJson(),
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

    Links copyWith({
        List<Self>? self,
        List<About>? about,
        List<About>? collection,
    }) => 
        Links(
            self: self ?? this.self,
            about: about ?? this.about,
            collection: collection ?? this.collection,
        );

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Self>.from(json["self"].map((x) => Self.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
    };
}

class About {
    About({
        this.href,
    });

    String? href;

    About copyWith({
        String? href,
    }) => 
        About(
            href: href ?? this.href,
        );

    factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Self {
    Self({
        this.embeddable,
        this.href,
    });

    bool? embeddable;
    String? href;

    Self copyWith({
        bool? embeddable,
        String? href,
    }) => 
        Self(
            embeddable: embeddable ?? this.embeddable,
            href: href ?? this.href,
        );

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}
