import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/modules/prject.dart';

List<Project> getMyProjects(String ownerId) {
  final CollectionReference<Map<String, dynamic>> projects =
      FirebaseFirestore.instance.collection('projects');
  projects.where('');

  return [];
}
