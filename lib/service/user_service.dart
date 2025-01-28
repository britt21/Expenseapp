import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'helper/Result.dart';

class UserService extends GetxController {
  var isLoading = false.obs;

  Future<ResultHelper> addUser(name, email, phone) async {
    var completer = Completer<ResultHelper>();
    // Ensure the user is authenticated
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print('User is not authenticated');
    } else {
      print('User is authenticated');
    }

    // Reference to the Firestore collection
    CollectionReference users =
    FirebaseFirestore.instance.collection("");

    // User data to be added
    Map<String, dynamic> userData = {
      'name': '${name}',
      'email': '${email}',
      'phone': '${phone}',
      'userId': user?.uid,
      'isMerchant': false
    };

    try {
      await users.add(userData);
      print('User added successfully');

      return await ResultHelper(
          result: "User added successfully", errorMessage: null);
    } catch (e) {
      print('Error adding user: $e');
      return await ResultHelper(
          result: "Error adding user", errorMessage: null);
    }
    return completer.future;
  }
}
