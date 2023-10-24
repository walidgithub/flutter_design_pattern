import '../entities/entity_base.dart';
import '../istorage.dart';
import '../json_helper.dart';

// implementation for abstraction
class FileStorage implements IStorage {
  // key is the Type and Type is Customer or Order
  // and value is list from Type as a text from Customer or Order
  final Map<Type, List<String>> fileStorage = {};

  // get title
  @override
  String getTitle() => 'File Storage';

  @override
  List<T> fetchAll<T extends EntityBase>() {
    if (!fileStorage.containsKey(T)) return [];

    // files has the Type from fileStorage
    // T is the key from fileStorage map and it will be Customer or Order
    final files = fileStorage[T]!;

    // we will map files to return list from Customer or Order (like {id:464, name:'dddd'})
    return files.map<T>((f) => JsonHelper.deserialiseObject<T>(f)).toList();
  }

  // store at Sql or File
  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!fileStorage.containsKey(T)) fileStorage[T] = [];

    // T is the key from fileStorage map and it will be Customer or Order
    // and we will fill the value with any of EntityBase concrete classes like Orders or Customers (like {id:464, name:'dddd'})
    fileStorage[T]!.add(JsonHelper.serialiseObject(entityBase));
  }
}
