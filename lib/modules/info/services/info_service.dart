import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:target_test/modules/info/models/info_model.dart';

class InfoService {
  var baseUrl = 'jsonplaceholder.typicode.com';

  Future<List<InfoModel>> getInfo() async {
    var uri = Uri.https(baseUrl, '/todos', {'_limit': '3'});
    try {
      var response = await http.get(uri);
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

  Future<InfoModel> createInfo(InfoModel item) async {
    var addItem = item.toJson();
    var uri = Uri.https(baseUrl, '/todos', {'_limit': '3'});
    var response = await http.post(
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

  Future<InfoModel> updateInfo(InfoModel item) async {
    var addItem = item.toJson();
    var uri = Uri.https(baseUrl, '/todos/${item.id}');
    var response = await http.put(
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

  Future<bool> deleteInfo(int id) async {
    //var addItem = item.toJson();
    var uri = Uri.https(baseUrl, '/todos/$id');
    var response = await http.delete(
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

// fetch('https://jsonplaceholder.typicode.com/posts/1', {
//   method: 'PUT',
//   body: JSON.stringify({
//     id: 1,
//     title: 'foo',
//     body: 'bar',
//     userId: 1,
//   }),
//   headers: {
//     'Content-type': 'application/json; charset=UTF-8',
//   },
// })
//   .then((response) => response.json())
//   .then((json) => console.log(json));

// class CepService {
//   final http.Client client;
//   CepService([http.Client? client]) : this.client = client ?? http.Client();

//   Future<CepModel> fetchCep(String cep) async {
//     var url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
//     //var url = Uri.parse('xxxxxx');
//     try {
//       final response = await client.get(url);
//       final json = jsonDecode(response.body) as Map<String, dynamic>;
//       var city = CepModel.fromMap(json);
//       return city;
//     } on Exception catch (e) {
//       throw Exception('Error: $e ');
//     }
//   }
// }