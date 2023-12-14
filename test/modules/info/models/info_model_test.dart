import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:target_test/modules/info/models/info_model.dart';

// class InfoModel {
//   final int? userId;
//   final int? id;
//   final String title;
//   final bool? completed;

void main() {
  late InfoModel sut;
  late Map infoMap;
  late String infoJson;
  setUp(() {
    sut = InfoModel(title: 'test1');
    infoMap = {'id': 2, 'title': 'testJson'};
    infoJson = jsonEncode(infoMap);
  });
  test('Should create infoModel object', () {
    expect(sut, isA<InfoModel>());
  });

  test('Should create a new infoModel object with copywith', () {
    var result = sut.copyWith(userId: 10);
    expect(result.userId, equals(10));
    expect(result.title, equals('test1'));
  });

  test('Should create a new infoModel object from Json', () {
    debugPrint('*********** json:   $infoJson');
    var result = InfoModel.fromJson(infoJson);
    debugPrint('*********** InfoModel:   $result');
    expect(result, isA<InfoModel>());
    expect(result.id, equals(2));
    expect(result.title, equals('testJson'));
  });

   test('Should create a new Json from InfoModel', () {
    var result = sut.toJson();
    debugPrint('*********** Json:   $result');
    expect(result, isA<String>()); 
     });

    test('Should create a InfoModel from Map', () {
    var result = InfoModel.fromMap(infoMap.cast<String, dynamic>());
    debugPrint('*********** InfoModel:   $result');
    expect(result, isA<InfoModel>());
    expect(result.title, equals('testJson'));
      });

  test('Should create a Map from an object InfoModel', () {
    var result = sut.toMap();
    debugPrint('*********** Map:   $result');
    expect(result, isA<Map<String,dynamic>>());
    expect(result['title'], equals('test1'));
      });

  test('Should convert an InfoModel object into a String', () {
    var result = sut.toString();
    debugPrint('*********** String:   $result');
    expect(result, isA<String>());
      });
}
