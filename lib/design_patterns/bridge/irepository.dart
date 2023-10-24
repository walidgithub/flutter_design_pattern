import 'entities/entity_base.dart';

// abstraction
abstract interface class IRepository {
  List<EntityBase> getAll();
  void save(EntityBase entityBase);
}
