import 'customer/customer_details.dart';
import 'icustomer_details_service.dart';

/* this is the proxy that will use original service as a parameter to use its function,
   but if the data or customer details are already found and downloaded before (cashed for example)
   so it will return old data and not use original service
*/
class CustomerDetailsServiceProxy implements ICustomerDetailsService {
  final ICustomerDetailsService service;

  CustomerDetailsServiceProxy(this.service);

  final Map<String, CustomerDetails> customerDetailsCache = {};

  @override
  Future<CustomerDetails> getCustomerDetails(String id) async {
    if (customerDetailsCache.containsKey(id)) return customerDetailsCache[id]!;

    final customerDetails = await service.getCustomerDetails(id);
    customerDetailsCache[id] = customerDetails;

    return customerDetails;
  }
}
