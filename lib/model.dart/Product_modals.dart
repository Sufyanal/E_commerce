import 'dart:convert';

ProductModal productModalFromJson(String str) => ProductModal.fromJson(json.decode(str));

String productModalToJson(ProductModal data) => json.encode(data.toJson());

class ProductModal {
    List<Product>? products;

    ProductModal({
        this.products,
    });

    factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Product {
    String? id;
    Category? category;
    Category? tag;
    String? name;
    String? price;
    String? description;
    String? image;
    String? rating;
    int? reviews;
    DateTime? dateModified;
    DateTime? dateCreated;
    bool isfavorited,addcart;
    dynamic quantity;

    Product({
        this.id,
        this.category,
        this.tag,
        this.name,
        this.price,
        this.description,
        this.image,
        this.rating,
        this.reviews,
        this.dateModified,
        this.dateCreated,
        this.isfavorited=false,
        this.addcart = false,
        this.quantity
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        tag: json["tag"] == null ? null : Category.fromJson(json["tag"]),
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        rating: json["rating"],
     
        reviews: json["reviews"],
        dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    );



    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category?.toJson(),
        "tag": tag?.toJson(),
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "rating": rating,
        "reviews": reviews,
       
        "date_modified": dateModified?.toIso8601String(),
        "date_created": dateCreated?.toIso8601String(),
    };
}

class Category {
    String? id;
    String? name;
    String? image;
    DateTime? dateModified;
    DateTime? dateCreated;

    Category({
        this.id,
        this.name,
        this.image,
        this.dateModified,
        this.dateCreated,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
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
