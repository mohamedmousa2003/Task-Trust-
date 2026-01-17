class DtoCategories {
  int? id;
  String? nameEn;
  String? nameAr;
  String? image;
  List<Product>? products;

  DtoCategories({
    this.id,
    this.nameEn,
    this.nameAr,
    this.image,
    this.products,
  });

  factory DtoCategories.fromJson(Map<String, dynamic> json) {
    return DtoCategories(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      image: json['image'],
      products: (json['products'] as List?)
          ?.map((e) => Product.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'products': products?.map((e) => e.toJson()).toList(),
    };
  }
}


class Product {
  int? id;
  String? name;
  String? nameEn;
  String? nameAr;
  String? descriptionEn;
  String? descriptionAr;
  String? image;
  double? price;
  int? priceTax;
  bool? onSale;
  int? points;

  Product({
    this.id,
    this.name,
    this.nameEn,
    this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    this.image,
    this.price,
    this.priceTax,
    this.onSale,
    this.points,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      image: json['image'],
      price: _parseDouble(json['price']),
      priceTax: json['price_tax'],
      onSale: json['on_sale'],
      points: json['points'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_en': nameEn,
      'name_ar': nameAr,
      'description_en': descriptionEn,
      'description_ar': descriptionAr,
      'image': image,
      'price': price,
      'price_tax': priceTax,
      'on_sale': onSale,
      'points': points,
    };
  }
}



class MetaData {
  MetaData({
      this.id,
      this.key,
      this.value,});

  MetaData.fromJson(dynamic json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }
  int? id;
  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['key'] = key;
    map['value'] = value;
    return map;
  }

}



class DateModified {
  DateModified({
      this.date,
      this.timezoneType,
      this.timezone,});

  DateModified.fromJson(dynamic json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }
  String? date;
  int? timezoneType;
  String? timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['timezone_type'] = timezoneType;
    map['timezone'] = timezone;
    return map;
  }

}



class DateCreated {
  DateCreated({
      this.date,
      this.timezoneType,
      this.timezone,});

  DateCreated.fromJson(dynamic json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }
  String? date;
  int? timezoneType;
  String? timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['timezone_type'] = timezoneType;
    map['timezone'] = timezone;
    return map;
  }

}

double? _parseDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}
