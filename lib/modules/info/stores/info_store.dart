import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
<<<<<<< HEAD
import 'package:target_test/modules/info/models/info_model.dart';
import 'package:target_test/modules/info/services/info_service.dart';
import 'package:uuid/uuid.dart';
=======
>>>>>>> 6415cf5e6dc9020d31cf27022dd51d488194bbb9

part 'info_store.g.dart';

class InfoStore = InfoStoreBase with _$InfoStore;

abstract class InfoStoreBase with Store {
  late SharedPreferences _prefs;
<<<<<<< HEAD
  final InfoService service = InfoService();

  @observable
  // ignore: prefer_final_fields
  ObservableList<InfoModel> _infoList = ObservableList<InfoModel>();

  @computed
  ObservableList<InfoModel> get infoList => _infoList;
=======

  @observable
  // ignore: prefer_final_fields
  ObservableList<String> _infoList = ObservableList<String>();

  @computed
  ObservableList<String> get infoList => _infoList;
>>>>>>> 6415cf5e6dc9020d31cf27022dd51d488194bbb9

  InfoStoreBase() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadInfoList();
  }

  Future<void> _loadInfoList() async {
    final List<String>? storedList = _prefs.getStringList('infoList');
    if (storedList != null) {
<<<<<<< HEAD
      _infoList.addAll(storedList.map((e) => InfoModel.fromJson(e)));
      //_infoList.addAll(storedList);
=======
      _infoList.addAll(storedList);
>>>>>>> 6415cf5e6dc9020d31cf27022dd51d488194bbb9
    }
  }

  Future<void> _saveInfoList() async {
<<<<<<< HEAD
    await _prefs.setStringList(
        'infoList', (_infoList.map((e) => e.toJson())).toList());
  }

  @action
  Future<void> addInfo(String infoText) async {
    var uuid = Uuid().v4();
    InfoModel info = InfoModel(
        title: infoText, id: int.parse(uuid.split('-').first, radix: 16));
    debugPrint(
        '****************${int.parse(uuid.split('-').first, radix: 16)}');
=======
    await _prefs.setStringList('infoList', _infoList.toList());
  }

  @action
  Future<void> addInfo(String info) async {
>>>>>>> 6415cf5e6dc9020d31cf27022dd51d488194bbb9
    _infoList.add(info);
    await _saveInfoList();
  }

  @action
<<<<<<< HEAD
  Future<void> editInfo(String infoTitle, int index) async {
    _infoList[index] = _infoList[index].copyWith(title: infoTitle);
=======
  Future<void> editInfo(int index, String info) async {
    _infoList[index] = info;
>>>>>>> 6415cf5e6dc9020d31cf27022dd51d488194bbb9
    await _saveInfoList();
  }

  @action
  Future<void> deleteInfo(int index) async {
<<<<<<< HEAD
    debugPrint('${_infoList[index]}');
=======
    debugPrint(_infoList[index]);
>>>>>>> 6415cf5e6dc9020d31cf27022dd51d488194bbb9
    _infoList.removeAt(index);
    await _saveInfoList();
  }
}
