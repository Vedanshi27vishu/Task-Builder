import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.username,
  });
  Map<String, dynamic> toJson() {
    return {
      "First": firstName,
      "Last": lastName,
      "Phone": phoneNumber,
      "Email": email,
      "Username": username,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      firstName: data["First"] ?? '',
      lastName: data["Last"] ?? '',
      phoneNumber: data["Phone"] ?? '',
      email: data["Email"] ?? '',
      username: data["Username"] ?? '',
    );
  }
}
