// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dovi_me/modules/prduct.dart';

class Project {
  String? id;
  String? customerName;
  String? ownerId;
  String? dateTime;
  String? dateTimeEnd;
  num? discount;
  num? subTotal;
  num? total;
  //list of products//
  List<Product?>? products;
  Project({
    required this.id,
    this.customerName,
    this.ownerId,
    this.dateTime,
    this.dateTimeEnd,
    this.discount,
    this.subTotal,
    this.total,
    this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerName': customerName,
      'ownerId': ownerId,
      'dateTime': dateTime,
      'dateTimeEnd': dateTimeEnd,
      'discount': discount,
      'subTotal': subTotal,
      'total': total,
      'products': products!.map((x) => x?.toMap()).toList(),
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'] != null ? map['id'] as String : null,
      customerName:
          map['customerName'] != null ? map['customerName'] as String : null,
      ownerId: map['ownerId'] != null ? map['ownerId'] as String : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      dateTimeEnd:
          map['dateTimeEnd'] != null ? map['dateTimeEnd'] as String : null,
      discount: map['discount'] != null ? map['discount'] as num : null,
      subTotal: map['subTotal'] != null ? map['subTotal'] as num : null,
      total: map['total'] != null ? map['total'] as num : null,
      products: map['products'] != null
          ? List<Product?>.from(
              (map['products'] as List).map<Product?>(
                (x) => Product?.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
