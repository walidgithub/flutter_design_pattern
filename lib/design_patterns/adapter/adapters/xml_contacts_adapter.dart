import 'package:xml/xml.dart';

import '../apis/xml_contacts_api.dart';
import '../contact.dart';
import '../icontacts_adapter.dart';

class XmlContactsAdapter implements IContactsAdapter {
  final XmlContactsApi api;

  const XmlContactsAdapter({
    // take an instance from xml class
    this.api = const XmlContactsApi(),
  });

  @override
  List<Contact> getContacts() {
    // get xml file or variable and convert it
    final contactsXml = api.getContactsXml();
    final contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }

  // converter from xml to dart
  List<Contact> _parseContactsXml(String contactsXml) {
    final xmlDocument = XmlDocument.parse(contactsXml);
    final contactsList = <Contact>[];

    for (final xmlElement in xmlDocument.findAllElements('contact')) {
      final fullName = xmlElement.findElements('fullname').single.innerText;
      final email = xmlElement.findElements('email').single.innerText;
      final favouriteString =
          xmlElement.findElements('favourite').single.innerText;
      final favourite = favouriteString.toLowerCase() == 'true';

      contactsList.add(
        Contact(
          fullName: fullName,
          email: email,
          favourite: favourite,
        ),
      );
    }

    return contactsList;
  }
}
