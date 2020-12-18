import 'dart:io';
import 'package:airapy/services/database.dart';
import 'package:airapy/widgets/custom_flashbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_kit/fit_kit.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:airapy/theme/theme.dart';

class TrackFoodViewModel with ChangeNotifier {
  final TextEditingController foodTEC = new TextEditingController();
  var formKey = GlobalKey<FormState>();

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

  void clearImage() {
    _image = null;
    notifyListeners();
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

  String _meal;
  String _healthiness;
  String _portionSize;

  TrackFoodViewModel() {
    _meal = 'Breakfast';
    _healthiness = 'Very healthy';
    _portionSize = 'Large';
  }

  String get meal => _meal;
  String get healthiness => _healthiness;
  String get portionSize => _portionSize;

  void setMeal(String meal) {
    _meal = meal;
    notifyListeners();
  }

  void setHealthiness(String healthiness) {
    _healthiness = healthiness;
    notifyListeners();
  }

  void setPortionsize(String portionSize) {
    _portionSize = portionSize;
    notifyListeners();
  }

  void addMeal(String meal) {
    if (!(_meal == meal)) {
      _meal = meal;
      notifyListeners();
    }
  }

  void addHealthiness(String healthiness) {
    if (!(_meal == healthiness)) {
      _meal = healthiness;
      notifyListeners();
    }
  }

  void addPortionSize(String portionSize) {
    if (!(_meal == portionSize)) {
      _meal = portionSize;
      notifyListeners();
    }
  }

  logFood(BuildContext context) async {
    try {
      if (_image == null) {
        await ServerDatabase().logFood(
          food: foodTEC.text,
          mealType: _meal,
          healthiness: _healthiness,
          portionSize: _portionSize,
          photo: '',
        );
      } else if (_image != null) {
        var url = await uploadFile();
        await ServerDatabase().logFood(
          food: foodTEC.text,
          mealType: _meal,
          healthiness: _healthiness,
          portionSize: _portionSize,
          photo: url,
        );
      }
      foodTEC.text = '';
      _image = null;
      notifyListeners();
    } catch (error) {
      print(error);
      showOverlayNotification((context) {
        return CustomFlashbar(
          title: 'An error occured',
          subtitle: 'Please try again later',
          action: () {},
          color: red,
        );
      }, duration: Duration(milliseconds: 3000));
    }
  }
}

class StepsViewModel with ChangeNotifier {
  var duration = new Duration(days: 1);
  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime(2020, 01, 01);
  DataType type = DataType.STEP_COUNT;
  bool _isAuthorized;

  StepsViewModel() {
    loadAuthorization();
  }

  bool get isAuthorized => _isAuthorized;

  void authorize() async {
    var isAuthorized = await FitKit.requestPermissions([DataType.STEP_COUNT]);
    _isAuthorized = isAuthorized;
    notifyListeners();
    saveAuthorization();
  }

  void setAuthorization(bool authorization) {
    _isAuthorized = authorization;
    notifyListeners();
    saveAuthorization();
  }

  Future<List<FitData>> fetchData() async {
    if (!_isAuthorized) {
      print('Not authorized');
    }
    List<FitData> _healthDataList = [];
    try {
      List<FitData> healthData = await FitKit.read(
        type,
        dateFrom: startDate,
        dateTo: endDate,
      );
      _healthDataList.addAll(healthData);
    } catch (error) {
      print('hello $error');
    }
    print(_healthDataList);
    return _healthDataList;
  }

  saveAuthorization() async {
    var authorization = await Hive.openBox('authorization');
    authorization.put('authorization', _isAuthorized);
  }

  loadAuthorization() async {
    var authorization = await Hive.openBox('authorization');
    bool savedAuthorization = authorization.get('authorization');

    savedAuthorization != null
        ? _isAuthorized = savedAuthorization
        : _isAuthorized = false;
    notifyListeners();
  }
}
