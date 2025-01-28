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


  Future<ResultHelper> addItem(List<Map<String, dynamic>> items) async {
    var completer = Completer<ResultHelper>();

    // Ensure the user is authenticated
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print('User is not authenticated');
      completer.complete(ResultHelper(
          result: null, errorMessage: "User is not authenticated"));
      return completer.future;
    }

    // Reference to the Firestore collection
    CollectionReference collection = FirebaseFirestore.instance.collection("ITEMS");

    // Document data to be added
    Map<String, dynamic> documentData = {
      'items': items, // List of maps with name and amount
      'userId': user.uid,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      await collection.add(documentData);
      print('Document added successfully');

      completer.complete(ResultHelper(
          result: "Document added successfully", errorMessage: null));
    } catch (e) {
      print('Error adding document: $e');
      completer.complete(ResultHelper(
          result: null, errorMessage: "Error adding document: $e"));
    }

    return completer.future;
  }


  Future<ItemDocument> getItems() async {
    // Ensure the user is authenticated
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("User is not authenticated");}

    // Reference to the Firestore collection
    CollectionReference collection = FirebaseFirestore.instance.collection("ITEMS");

    try {
      // Query documents for the current user
      QuerySnapshot querySnapshot = await collection.where('userId', isEqualTo: user.uid).get();

      // Assuming you only want the first document
      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> data = querySnapshot.docs.first.data() as Map<String, dynamic>;
        return ItemDocument.fromJson(data);
      } else {throw Exception("No documents found for this user");
      }
    } catch (e) {
      print('Error fetching documents: $e');
      throw Exception("Error fetching documents: $e");
    }
  }


}



class ItemDocument {
  final List<Item> items;
  final String userId;
  final Timestamp timestamp;

  ItemDocument({
    required this.items,
    required this.userId,
    required this.timestamp,
  });

  factory ItemDocument.fromJson(Map<String, dynamic> json) {
    return ItemDocument(
      items: (json['items'] as List)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList(),
      userId: json['userId'] as String,
      timestamp: json['timestamp'] as Timestamp,
    );
  }
}

class Item {
  final String image;
  final String name;
  final String amount;

  Item({
    required this.image,required this.name,required this.amount,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      image: json['image'] as String,
      name: json['name'] as String,
      amount: json['amount'] as String,
    );
  }
}