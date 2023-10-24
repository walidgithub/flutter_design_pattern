import '../entities/customer.dart';
import '../entities/entity_base.dart';
import '../irepository.dart';
import '../istorage.dart';

// abstraction
class CustomersRepository implements IRepository {
  const CustomersRepository(this.storage);

  final IStorage storage;

  // return customers from storage File or Sql
  @override
  List<EntityBase> getAll() => storage.fetchAll<Customer>();

  // save customers to storage File or Sql
  @override
  void save(EntityBase entityBase) {
    storage.store<Customer>(entityBase as Customer);
  }
}
