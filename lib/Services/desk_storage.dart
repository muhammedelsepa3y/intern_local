import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class DeskStorage with ChangeNotifier {
int counter=0;
   getCounter() async {
     var secureStorage = FlutterSecureStorage();
     final encryptionKey = await secureStorage.read(key: 'encryptionKey');
     final key =base64Decode(encryptionKey!);
     var hive=await Hive.openBox('myBox',encryptionCipher: HiveAesCipher(key));
    counter= hive.get('counter',defaultValue: 0);
    notifyListeners();
  }
  addCounter() async{
     var secureStorage = FlutterSecureStorage();
     final encryptionKey = await secureStorage.read(key: 'encryptionKey');
     final key =base64Decode(encryptionKey!);
    var hive=await Hive.openBox('myBox',encryptionCipher: HiveAesCipher(key));
    hive.put('counter', (hive.get('counter',defaultValue: 0)+1));
    counter++;
    notifyListeners();
  }

}


// Authentication
// Cloud Firestore
// Notifications
// Storage
// Cloud Functions

