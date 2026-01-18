class AddCart {
  AddCart({
      this.guestId, 
      this.items,});

  AddCart.fromJson(dynamic json) {
    guestId = json['guest_id'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  String? guestId;
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guest_id'] = guestId;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Items({
      this.productId, 
      this.quantity, 
      this.addons,});

  Items.fromJson(dynamic json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    if (json['addons'] != null) {
      addons = [];
      json['addons'].forEach((v) {
        addons?.add(Addons.fromJson(v));
      });
    }
  }
  num? productId;
  num? quantity;
  List<Addons>? addons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['quantity'] = quantity;
    if (addons != null) {
      map['addons'] = addons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Addons {
  Addons({
      this.id, 
      this.name, 
      this.price,});

  Addons.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
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