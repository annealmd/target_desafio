import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'info_store.g.dart';

class InfoStore = InfoStoreBase with _$InfoStore;

abstract class InfoStoreBase with Store {
  late SharedPreferences _prefs;

  @observable
  ObservableList<String> _infoList = ObservableList<String>();

  @computed
  ObservableList<String> get infoList => _infoList;

  // Constructor to initialize SharedPreferences
  InfoStoreBase() {
    _initPrefs();
  }

  // Initialize SharedPreferences
  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadInfoList(); // Move this call after initializing _prefs
  }

  // Load infoList from SharedPreferences
  Future<void> _loadInfoList() async {
    final List<String>? storedList = _prefs.getStringList('infoList');
    if (storedList != null) {
      _infoList.addAll(storedList);
    }
  }

  // Save infoList to SharedPreferences
  Future<void> _saveInfoList() async {
    await _prefs.setStringList('infoList', _infoList.toList());
  }

  @action
  Future<void> addInfo(String info) async {
    _infoList.add(info);
    await _saveInfoList();
  }

  @action
  Future<void> editInfo(int index, String info) async {
    _infoList[index] = info;
    await _saveInfoList();
  }

  @action
  Future<void> deleteInfo(int index) async {
    debugPrint(_infoList[index]);
    _infoList.removeAt(index);
    await _saveInfoList();
  }
}
