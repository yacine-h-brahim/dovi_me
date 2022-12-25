import 'package:get/get.dart';

class UserAccount extends GetxController {
  UserAccount({
    required this.id,
    required this.email,
    required this.pwd,
    required this.username,
    this.photoUrl,
  });
  String? id;
  String? email;
  String? pwd;
  String? username;
  String? photoUrl;
  toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'pwd': pwd,
      'photUrl': photoUrl,
    };
  }
}
