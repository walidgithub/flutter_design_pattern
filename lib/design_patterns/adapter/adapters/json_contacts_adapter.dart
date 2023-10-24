import 'dart:convert';

import '../apis/json_contacts_api.dart';
import '../contact.dart';
import '../icontacts_adapter.dart';

class JsonContactsAdapter implements IContactsAdapter {

  final JsonContactsApi api;

  const JsonContactsAdapter({
    // take an instance from json class
    this.api = const JsonContactsApi(),
  });

  @override
  List<Contact> getContacts() {
    // get json file or variable and convert it
    final contactsJson = api.getContactsJson();
    final contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  // converter from json to dart
  List<Contact> _parseContactsJson(String contactsJson) {
    final contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    final contactsJsonList = contactsMap['contacts'] as List;
    final contactsList = contactsJsonList.map((json) {
      final contactJson = json as Map<String, dynamic>;

      return Contact(
        fullName: contactJson['fullName'] as String,
        email: contactJson['email'] as String,
        favourite: contactJson['favourite'] as bool,
      );
    }).toList();

    return contactsList;
  }
}
