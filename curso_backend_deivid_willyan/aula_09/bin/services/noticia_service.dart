import '../models/noticia_model.dart';
import 'generic_service.dart';

import '../utils/list_extension.dart';

//Simulando que está trabalhando com banco de dados fake

class NoticiaService implements GenericService<NoticiaModel> {
  List<NoticiaModel> _fakeDB = [];

  @override
  bool delete(int id) {
    _fakeDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<NoticiaModel> findAll() {
    return _fakeDB;
  }

  @override
  NoticiaModel findOne(int id) {
    return _fakeDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(NoticiaModel value) {
    //Busca o primeiro elemento que sadiisfazer a condição.
    //Caso não encontre, retorna o elemento que foi passado (value).
    NoticiaModel? model = _fakeDB.firstWhereOrNull((e) => e.id == value.id);
    if (model == null) {
      _fakeDB.add(value);
    } else {
      var index = _fakeDB.indexOf(model);
      _fakeDB[index] = value;
    }
    return true;
  }
}
