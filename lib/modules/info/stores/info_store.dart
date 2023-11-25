import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_test/modules/info/models/info_model.dart';
import 'package:target_test/modules/info/services/info_service.dart';
import 'package:uuid/uuid.dart';

part 'info_store.g.dart';

class InfoStore = InfoStoreBase with _$InfoStore;

abstract class InfoStoreBase with Store {
  late SharedPreferences _prefs;
  final InfoService service = InfoService();

  @observable
  // ignore: prefer_final_fields
  ObservableList<InfoModel> _infoList = ObservableList<InfoModel>();

  @computed
  ObservableList<InfoModel> get infoList => _infoList;

  InfoStoreBase() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();

    await _loadInfoList();
  }

  Future<void> _loadDatabase() async {
    var dbList = await service.getInfo();
    Set<int?> existingIds = _infoList.map((info) => info.id).toSet();
    _infoList.addAll(dbList.where(
        (dbItem) => !existingIds.contains(dbItem.id))); // add from database
  }

  Future<void> _loadInfoList() async {
    final List<String>? storedList = _prefs.getStringList('infoList');
    if (storedList != null) {
      _infoList.addAll(storedList.map((e) => InfoModel.fromJson(e)));
      await _loadDatabase();
    }
  }

  Future<void> _saveInfoList() async {
    await _prefs.setStringList(
        'infoList', (_infoList.map((e) => e.toJson())).toList());
  }

  @action
  Future<void> addInfo(String infoText) async {
    var uuid = const Uuid().v4();
    InfoModel info = InfoModel(
        title: infoText, id: int.parse(uuid.split('-').first, radix: 16));
    debugPrint(
        '****************${int.parse(uuid.split('-').first, radix: 16)}');
    _infoList.add(info);
    await service.createInfo(info); // create database
    await _saveInfoList();
  }

  @action
  Future<void> editInfo(String infoTitle, int index) async {
    _infoList[index] = _infoList[index].copyWith(title: infoTitle);
    await service.updateInfo(_infoList[index]); //update database
    await _saveInfoList();
  }

  @action
  Future<void> deleteInfo(int index) async {
    debugPrint('${_infoList[index]}');
    _infoList.removeAt(index);
    await service.deleteInfo(_infoList[index].id!); //delete database
    debugPrint('**********${_infoList[index].id}');
    await _saveInfoList();
  }
}
