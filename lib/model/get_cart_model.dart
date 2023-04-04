class GetCartModel {
  String? sId;
  String? name;
  String? email;
  String? address;
  List<Products>? products;
  int? total;
  int? iV;

  GetCartModel(
      {this.sId,
        this.name,
        this.email,
        this.address,
        this.products,
        this.total,
        this.iV});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  int? id;
  String? description;
  int? price;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  String? sId;

  Products(
      {this.id,
        this.description,
        this.price,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.sId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['_id'] = this.sId;
    return data;
  }
}
