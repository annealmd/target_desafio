import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:target_test/modules/info_service.dart';
import 'package:target_test/modules/models/info_model.dart';

void main() {
  late InfoService sut;

  setUpAll(() {
    sut = InfoService();
  });

  test('should return 3 InfoModels', () async {
    var result = await sut.getInfo();

    expect(result, isA<List<InfoModel>>());
    expect(result.length, 3);
    expect(result[0].title, 'delectus aut autem');
  });

  test('should return the item added', () async {
    var item = InfoModel(userId: 1, id: 1, title: 'certo', completed: true);
    var result = await sut.addInfo(item);

    expect(result, isA<InfoModel>());
    expect(result.title, 'certo');
  });
  test('should return the item updated', () async {
    var item = InfoModel(userId: 1, id: 2, title: 'quis ut', completed: false);
    var result = await sut.updatedInfo(item);
    debugPrint('********** $result');

    expect(result, isA<InfoModel>());
    expect(result.title, 'quis ut');
  });
  test('should delete the item ', () async {
    var item = InfoModel(userId: 1, id: 2, title: 'quis ut', completed: false);
    var result = await sut.deleteInfo(item.id);
    debugPrint('********** $result');

    expect(result, isA<bool>());
    expect(result, true);
  });
}
