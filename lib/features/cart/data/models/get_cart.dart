class GetCartModel {
  GetCartModel({
      this.cartItems, 
      this.totalPrice, 
      this.vat, 
      this.totalPriceWithTax, 
      this.totalItems, 
      this.totalPoints,});

  GetCartModel.fromJson(dynamic json) {
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(CartItemsModel.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    vat = json['VAT'];
    totalPriceWithTax = json['total_price_with_tax'];
    totalItems = json['total_items'];
    totalPoints = json['total_points'];
  }
  List<CartItemsModel>? cartItems;
  String? totalPrice;
  String? vat;
  String? totalPriceWithTax;
  num? totalItems;
  String? totalPoints;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cartItems != null) {
      map['cart_items'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['total_price'] = totalPrice;
    map['VAT'] = vat;
    map['total_price_with_tax'] = totalPriceWithTax;
    map['total_items'] = totalItems;
    map['total_points'] = totalPoints;
    return map;
  }

}

class CartItemsModel {
  CartItemsModel({
      this.productId, 
      this.productName, 
      this.productNameEn, 
      this.productNameAr, 
      this.quantity, 
      this.price, 
      this.addonPrice, 
      this.image, 
      this.addons, 
      this.points, 
      this.total,});

  CartItemsModel.fromJson(dynamic json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productNameEn = json['product_name_en'];
    productNameAr = json['product_name_ar'];
    quantity = json['quantity'];
    price = json['price'];
    addonPrice = json['addon_price'];
    image = json['image'];
    if (json['addons'] != null) {
      addons = [];
      json['addons'].forEach((v) {
        addons?.add(Addons.fromJson(v));
      });
    }
    points = json['points'];
    total = json['total'];
  }
  num? productId;
  String? productName;
  String? productNameEn;
  String? productNameAr;
  num? quantity;
  String? price;
  num? addonPrice;
  String? image;
  List<Addons>? addons;
  String? points;
  String? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_name_en'] = productNameEn;
    map['product_name_ar'] = productNameAr;
    map['quantity'] = quantity;
    map['price'] = price;
    map['addon_price'] = addonPrice;
    map['image'] = image;
    if (addons != null) {
      map['addons'] = addons?.map((v) => v.toJson()).toList();
    }
    map['points'] = points;
    map['total'] = total;
    return map;
  }

  CartItemsModel copyWith({
    num? quantity,
    String? productName,
    String? image,
    String? price,
  }) {
    return CartItemsModel(
      quantity: quantity ?? quantity,
      productName: productName ?? productName,
      image: image ?? image,
      price: price ?? price,
    );
  }


}

class Addons {
  Addons({
    this.id,
    this.name,
    this.price,
  });

  Addons.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'] != null ? num.tryParse(json['price'].toString()) : null;
  }

  num? id;
  String? name;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    return map;
  }
}










