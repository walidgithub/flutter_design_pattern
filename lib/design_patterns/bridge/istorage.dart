import 'entities/entity_base.dart';

// implementation for abstraction
abstract interface class IStorage {
  // title of list Sql or File
  String getTitle();
  // T it will be Customer or Order
  List<T> fetchAll<T extends EntityBase>();
  void store<T extends EntityBase>(T entityBase);
}
