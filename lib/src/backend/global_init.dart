import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///[storage] intializing Flutter storage
const storage = FlutterSecureStorage();
  ///[users] geting the firesbase collection instance
  CollectionReference users = FirebaseFirestore.instance.collection('users');