import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String? id;
  String? name;
  String? unit;
  String? unitPrice;
  Product({
    this.id,
    this.name,
    this.unit,
    this.unitPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'unit': unit,
      'unitPrice': unitPrice,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
      unitPrice: map['unitPrice'] != null ? map['unitPrice'] as String : null,
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
