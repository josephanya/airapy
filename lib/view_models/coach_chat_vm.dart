import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/widgets/custom_flashbar.dart';

class CoachChatViewModel with ChangeNotifier {
  final _firestore = Firestore.instance;
  final TextEditingController chatFieldTEC = new TextEditingController();
  File _image;

  File get image => _image;

  Future getImage(String idTo, sender) async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
      uploadFile(idTo, sender);
    } else {
      showOverlayNotification((context) {
        return CustomFlashbar(
          title: 'Error',
          subtitle: 'No image selected',
          action: () {},
          color: red,
        );
      }, duration: Duration(milliseconds: 3000));
    }
  }

  void uploadFile(String idTo, sender) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    StorageReference storageReference = FirebaseStorage().ref();
    var uploadTask =
        storageReference.child(fileName).putFile(File(_image.path));
    var storageSnapshot = await uploadTask.onComplete;
    var url = await storageSnapshot.ref.getDownloadURL();
    print(url);
    if (url != null) {
      addChatDocumentAttachment(idTo, url, sender);
    }
  }

  void addChatDocumentAttachment(String idTo, text, sender) async {
    var user = await FirebaseAuth.instance.currentUser();
    _firestore
        .collection('users')
        .document(user.uid)
        .collection('messages')
        .add({
      'idFrom': user.uid,
      'idTo': idTo,
      'text': text,
      'sender': sender,
      'timestamp': FieldValue.serverTimestamp(),
      'type': 1,
    });
  }

  void addChatDocument(String idTo, sender) async {
    var user = await FirebaseAuth.instance.currentUser();
    if (chatFieldTEC.text != '') {
      _firestore
          .collection('users')
          .document(user.uid)
          .collection('messages')
          .add({
        'idFrom': user.uid,
        'idTo': idTo,
        'text': chatFieldTEC.text,
        'sender': sender,
        'timestamp': FieldValue.serverTimestamp(),
        'type': 0,
      });
      chatFieldTEC.text = '';
      notifyListeners();
    }
  }
}
