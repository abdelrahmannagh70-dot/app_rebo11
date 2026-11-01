class BookModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  BookModel({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  BookModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : Data.fromJson(json["data"]);

    message = json["message"];
    error = json["error"] ?? [];
    status = int.tryParse(json["status"].toString());
  }
}

class Data {
  List<Products>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    products = json["products"] == null
        ? []
        : (json["products"] as List)
        .map((e) => Products.fromJson(e))
        .toList();
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  Products({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json["id"].toString());

    name = json["name"]?.toString();
    description = json["description"]?.toString();
    price = json["price"]?.toString();

    discount = int.tryParse(json["discount"].toString());

    priceAfterDiscount =
        double.tryParse(json["price_after_discount"].toString());

    stock = int.tryParse(json["stock"].toString());

    bestSeller =
        int.tryParse(json["best_seller"].toString());

    image = json["image"]?.toString();
    category = json["category"]?.toString();
  }
}