import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'info_store.g.dart';

class InfoStore = InfoStoreBase with _$InfoStore;

abstract class InfoStoreBase with Store {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @observable
  // ignore: prefer_final_fields
  ObservableList<String> _infoList = ObservableList<String>();

  @computed
  ObservableList<String> get infoList => _infoList;

  @action
  List<String> addInfo(String info) {
    _infoList.add(info);
    
    return _infoList;
  }

  @action
  ObservableList<String> editInfo(int index, String info) {
    _infoList[index] = info;
    return _infoList;
  }

  @action
  ObservableList<String> deleteInfo(int index) {
    debugPrint(_infoList[index]);
    _infoList.removeAt(index);

    return _infoList;
  }
}
