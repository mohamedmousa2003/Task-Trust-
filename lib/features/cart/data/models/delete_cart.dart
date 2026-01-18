class DeleteCart {
  DeleteCart({
      this.guestId, 
      this.productId, 
      this.quantity,});

  DeleteCart.fromJson(dynamic json) {
    guestId = json['guest_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
  }
  String? guestId;
  num? productId;
  num? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guest_id'] = guestId;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    return map;
  }

}