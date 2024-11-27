import 'package:crudprovider/model/studentModal/studentModals.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class simpleSaveItems extends ChangeNotifier {
  List<studentModal> storeAllDatas = [];

  Future addStudentDetails(studentModal values) async {
    final storeInHive = await Hive.openBox<studentModal>('saveDatas');
    storeInHive.add(values);
    storeAllDatas.addAll(storeInHive.values);
    notifyListeners();
  }

  Future getallDatas() async {
    final storeInHive = await Hive.openBox<studentModal>('saveDatas');
    storeAllDatas.clear();
    storeAllDatas.addAll(storeInHive.values);
    notifyListeners();
  }

  Future editStudent(int index, value) async {
    final storeInHive = await Hive.openBox<studentModal>('saveDatas');
    storeInHive.putAt(index, value);
    notifyListeners();
    getallDatas();
  }
}
