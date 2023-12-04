import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:target_test/modules/info/models/info_model.dart';
import 'package:target_test/modules/info/services/i_service.dart';

class InfoService implements IService {
  final String baseUrl = 'jsonplaceholder.typicode.com';

  final Client client;

  InfoService({required this.client});

  @override
  Future<List<InfoModel>> getInfo() async {
    var uri = Uri.https(baseUrl, '/todos', {'_limit': '3'});
    try {
      var response = await client.get(uri);
      List<InfoModel> listInfo = [];
      if (response.statusCode == 200) {
        debugPrint('RESPONSE: $response.');
        final json = jsonDecode(response.body) as List<dynamic>;
        debugPrint('JSON: $json');

        for (int i = 0; i < json.length; i++) {
          var info = InfoModel.fromMap(json[i]);
          listInfo.add(info);
          debugPrint('INFO: $info');
        }
      }
      return listInfo;
    } on Exception catch (e) {
      throw Exception('Error: $e ');
    }
  }

  @override
  Future<InfoModel> createInfo(InfoModel item) async {
    var addItem = item.toJson();
    var uri = Uri.https(baseUrl, '/todos', {'_limit': '3'});
    var response = await client.post(
      uri,
      body: addItem,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      var info = InfoModel.fromMap(json);
      return info;
    } else {
      throw Exception();
    }
  }

  @override
  Future<InfoModel> updateInfo(InfoModel item) async {
    var addItem = item.toJson();
    var uri = Uri.https(baseUrl, '/todos/${item.id}');
    var response = await client.put(
      uri,
      body: addItem,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      var info = InfoModel.fromMap(json);
      return info;
    }
    return InfoModel(userId: 0, id: 0, title: 'errado', completed: false);
  }

  @override
  Future<bool> deleteInfo(int id) async {
    //var addItem = item.toJson();
    var uri = Uri.https(baseUrl, '/todos/$id');
    var response = await client.delete(
      uri,
    );
    debugPrint('********** ${response.statusCode}');
    debugPrint('********** ${response.body}');
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
