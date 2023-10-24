import '../entities/entity_base.dart';
import '../istorage.dart';

// implementation for abstraction
class SqlStorage implements IStorage {
  // key is the Type and Type is Customer or Order
  // and value is list from Type as an object from Customer or Order
  final Map<Type, List<EntityBase>> sqlStorage = {};

  // get title
  @override
  String getTitle() => 'SQL Storage';

  // files has the Type from sqlStorage
  // T is the key from sqlStorage map and it will be Customer or Order
  @override
  List<T> fetchAll<T extends EntityBase>() =>
      // we will return list from Customer or Order (like instance of Customer)
      sqlStorage.containsKey(T) ? sqlStorage[T]! as List<T> : [];

  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!sqlStorage.containsKey(T)) sqlStorage[T] = <T>[];

    sqlStorage[T]!.add(entityBase);
    // T is the key from sqlStorage map and it will be Customer or Order
    // and we will fill the value with any of EntityBase concrete classes like Orders or Customers (like instance of Customer)
  }
}
