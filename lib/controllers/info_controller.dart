class InfoController {
  final List<String> _infoList = [
    'Fazer o teste',
    'Ir na academia',
    'Supermercado para comprar Verduras',
    'Aniversário da Maria',
    'Andar de Bike',
    'Correr 10 km',
    'Ler um livro',
  ];

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
    _infoList.removeAt(index);
    return _infoList;
  }
}
