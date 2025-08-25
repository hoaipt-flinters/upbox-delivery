import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  firebase_storage.FirebaseStorage getStorage() {
    return firebase_storage.FirebaseStorage.instance;
  }

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    final storage = getStorage();
    try {
      await storage.ref('test/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<String> downloadUrl(String imageName) async {
    final storage = getStorage();
    String downloadUrl = await storage.ref('test/$imageName').getDownloadURL();
    return downloadUrl;
  }
}
