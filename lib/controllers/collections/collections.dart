import 'package:cloud_firestore/cloud_firestore.dart';

final products = FirebaseFirestore.instance.collection('products');
final projects = FirebaseFirestore.instance.collection('projects');
final users = FirebaseFirestore.instance.collection('users');
final productQuantity =
    FirebaseFirestore.instance.collection('productQuantity');
final units = FirebaseFirestore.instance.collection('units');
