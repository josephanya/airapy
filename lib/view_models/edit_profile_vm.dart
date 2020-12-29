import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:airapy/services/database.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/widgets/custom_flashbar.dart';

class EditProfileViewModel with ChangeNotifier {
  final TextEditingController bioTEC = new TextEditingController();
  final TextEditingController locationTEC = new TextEditingController();

  File _image;

  File get image => _image;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
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

  Future<String> uploadFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference storageReference = FirebaseStorage().ref();
    var uploadTask =
        storageReference.child(fileName).putFile(File(_image.path));
    var storageSnapshot = await uploadTask.onComplete;
    var url = await storageSnapshot.ref.getDownloadURL();
    return url;
  }

  void updateProfile(BuildContext context) {
    try {
      if (_image != null) {
        ServerDatabase().updateData({
          'bio': bioTEC.text,
          'location': locationTEC.text,
        });
        uploadFile().then(
          (url) => ServerDatabase().updateData({
            'profilePic': url,
          }),
        );
        _image = null;
        notifyListeners();
        savePreferences(bioTEC.text, locationTEC.text);
        Navigator.pop(context);
      } else if (_image == null) {
        ServerDatabase().updateData({
          'bio': bioTEC.text,
          'location': locationTEC.text,
        });
        savePreferences(bioTEC.text, locationTEC.text);
        Navigator.pop(context);
      }
    } catch (error) {
      showOverlayNotification((context) {
        return CustomFlashbar(
          title: 'Error',
          subtitle: 'An error occured',
          action: () {},
          color: red,
        );
      }, duration: Duration(milliseconds: 3000));
    }
  }

  void fetchPreferences() async {
    var bio = await Hive.openBox('bio');
    var location = await Hive.openBox('location');
    String savedBio = bio.get('bio');
    String savedLocation = location.get('location');
    savedBio != null ? bioTEC.text = savedBio : bioTEC.text = '';
    savedLocation != null
        ? locationTEC.text = savedLocation
        : locationTEC.text = '';
    notifyListeners();
  }

  savePreferences(String bioText, locationText) async {
    var bio = await Hive.openBox('bio');
    var location = await Hive.openBox('location');
    bio.put('bio', bioText);
    location.put('location', locationText);
  }
}
