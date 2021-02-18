import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/user.dart';
import '../firebase/firebase_setup.dart';
import '../global_init.dart';

class SignUpFailure implements Exception {}

class LoginFailure implements Exception {}

class LogOutFailure implements Exception {}

class AuthenticationRepository extends FirebaseSetup {
  ///[users] geting the firesbase collection instance
  CollectionReference users = FirebaseFirestore.instance.collection('users');

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
    return users.doc(userEmail).set(<String, dynamic>{
      'token': token,
      'useremail': userEmail,
      'userpassword': userPassword,
      'userName': userName,
    });
  }

  ///[deleteToken] this method is use for deleting generated user token
  Future<void> deleteToken() async {
    // Delete value
    await storage.delete(key: 'token');
  }

  ///[presistToken] this method is use to save our new token
  Future<void> presistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String> readToken() async {
    final user = await storage.read(key: 'token');
    return user;
  }

  @override
  void addToDatabase() {
    // TODO: implement addToDatabase
  }

  @override
  void removeFromDatabase() {
    // TODO: implement removeFromDatabase
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

  Stream<User> get user async* {
    final userId = await readToken();
    users.doc(userId).snapshots().map((event) {
      return event.data() != null
          ? User(
              email: event.data()['email'].toString(),
              password: event.data()['password'].toString(),
              username: event.data()['username'].toString())
          : User.empty;
    });
  }
}
