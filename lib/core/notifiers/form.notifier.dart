import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:studio_web_app/meta/utils/base_helper.dart';

class FormNotifier extends ChangeNotifier{
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<void> submitForm({
    required String speciality,
    required String info,
    required Uint8List file,
    required String fileName,
  }) async {

    try{

    final submissionRef = _firebaseStorage.ref().child('submissions/$fileName');

    final uploadTask = await submissionRef.putData(file);
    String fileUrl = await submissionRef.getDownloadURL();

      await _firebaseFireStore.collection("submissions").doc(fileName).set({
        "speciality" : speciality,
        "info" : info,
        "fileUrl": fileUrl,
        "uploadedDate" : fileName.split('.')[0]
      });
      BaseHelper.showSnackBar("Form submitted");
    }on FirebaseException catch (e){
      BaseHelper.showSnackBar("${e.message}");
    }

  }

}