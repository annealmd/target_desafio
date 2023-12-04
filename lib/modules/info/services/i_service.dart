import '../models/info_model.dart';

abstract class IService {
  Future<List<InfoModel>> getInfo();

  Future<InfoModel> createInfo(InfoModel item);

  Future<InfoModel> updateInfo(InfoModel item);

  Future<bool> deleteInfo(int id);
}
