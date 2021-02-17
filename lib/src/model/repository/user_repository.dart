import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../appstartup/firebase_setup.dart';

///[UserRepository]
class UserRepository extends FirebaseSetup {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final storage = const FlutterSecureStorage();

  ///[generate Token] this helps to generate token for various users
  String generateToken() {
    final r = Random();
    return String.fromCharCodes(
        List.generate(12, (index) => r.nextInt(33) + 89));
  }

  ///[Register user] this is use to register users into our database
  @override
  Future<void> addUser(
      {String userEmail, String userPassword, String userName, String token}) {
    return users.doc(token).set(<String, dynamic>{
      'useremail': userEmail,
      'userpassword': userPassword,
      'userName': userName
    });
  }

  @override
  void addToDatabase() {}

  @override
  void removeFromDatabase() {
    // TODO: implement removeFromDatabase
  }

  Future<void> deleteToken() async {
    // Delete value
    await storage.delete(key: 'token');
  }

  Future<void> persistToken() async {
    await storage.write(key: 'token', value: generateToken());
  }

  Future<bool> hasToken() async {
    // Read value
    final value = await storage.read(key: 'token');
    if (value == null) {
      debugPrint(value);
      return false;
    } else {
      debugPrint('false');
      return true;
    }
  }
}
