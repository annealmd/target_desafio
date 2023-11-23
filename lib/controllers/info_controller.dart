import 'package:flutter/material.dart';

class InfoController {
  final List<String> _infoList = [];

  List<String> get infoList => _infoList;

  List<String> addInfo(String info) {
    _infoList.add(info);
    return _infoList;
  }

  List<String> editInfo(int index, String info) {
    _infoList[index] = info;
    return _infoList;
  }

  List<String> deleteInfo(int index) {
    debugPrint(_infoList[index]);
    _infoList.removeAt(index);

    return _infoList;
  }
}
