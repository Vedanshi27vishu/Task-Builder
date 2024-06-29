import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskbuilder/User/usermodel.dart';

class UserRepository {
  static final _db = FirebaseFirestore.instance;

  // Function to create a user in Firestore
  static Future<void> createUser(UserModel user, BuildContext context) async {
    try {
      await _db.collection("Users").doc(user.username).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Authentication Error")));
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? "Firebase Error")));
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? "Platform Error")));
    } on FormatException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An unknown error occurred: $e")));
    }
  }

  static Future<UserModel?> getuseremail(String email) async {
    try {
      final data =
          await _db.collection("Users").where("Email", isEqualTo: email).get();
      if (data.docs.isNotEmpty) {
        return UserModel.fromSnapshot(data.docs[0]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
