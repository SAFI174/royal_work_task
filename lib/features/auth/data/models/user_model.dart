import 'package:royal_task/core/common/entites/user.dart';

class UserModel extends User {
  UserModel({
    required super.uid,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }
}
