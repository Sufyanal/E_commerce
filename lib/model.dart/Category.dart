import 'dart:convert';

Category1 categoryFromJson(String str) => Category1.fromJson(json.decode(str));

String categoryToJson(Category1 data) => json.encode(data.toJson());

class Category1 {
    List<CategoryElement>? categories;

    Category1({
        this.categories,
    });

    factory Category1.fromJson(Map<String, dynamic> json) => Category1(
        categories: json["categories"] == null ? [] : List<CategoryElement>.from(json["categories"]!.map((x) => CategoryElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class CategoryElement {
    String? id;
    String? name;
    String? image;
    DateTime? dateModified;
    DateTime? dateCreated;

    CategoryElement({
        this.id,
        this.name,
        this.image,
        this.dateModified,
        this.dateCreated,
    });

    factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "date_modified": dateModified?.toIso8601String(),
        "date_created": dateCreated?.toIso8601String(),
    };
}
