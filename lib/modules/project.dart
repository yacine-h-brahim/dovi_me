// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dovi_me/modules/prduct.dart';
import 'package:get/get.dart';

class Project extends GetxController {
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
    this.id,
    this.customerName,
    this.ownerId,
    this.dateTime,
    this.dateTimeEnd,
    this.discount,
    this.subTotal,
    this.total,
    this.products,
  }) {
    update();
  }

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
    );
  }

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
