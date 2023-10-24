import '../entities/entity_base.dart';
import '../entities/order.dart';
import '../irepository.dart';
import '../istorage.dart';

// abstraction
class OrdersRepository implements IRepository {
  const OrdersRepository(this.storage);

  final IStorage storage;

  // return orders from storage File or Sql
  @override
  List<EntityBase> getAll() => storage.fetchAll<Order>();

  // save orders to storage File or Sql
  @override
  void save(EntityBase entityBase) {
    storage.store<Order>(entityBase as Order);
  }
}
