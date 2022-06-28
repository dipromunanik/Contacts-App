import 'package:contacts_app/db/db_helper.dart';
import 'package:contacts_app/models/contact_model.dart';
import 'package:flutter/cupertino.dart';

class ContactProvider with ChangeNotifier{

  List<ContactModel> _contactList =[];
  List<ContactModel> get getContactList=>_contactList;
  ContactModel? _contactModel;
  ContactModel? get contactModel => _contactModel;

   void getContacts() async {
    _contactList = await BDHelper.getAllContacts();
    notifyListeners();
  }

   Future<int> addContact(ContactModel contactModel) async{
    final rowId = BDHelper.insertNewContact(contactModel);
    _contactList.add(contactModel);
    notifyListeners();
    return rowId;
  }
  void getContactById(int id) async {
    _contactModel = await BDHelper.getContactById(id);
    notifyListeners();
  }
  void deleteContactById(int id) async {
    await BDHelper.deleteContactById(id).then((value) {
      //final contact = _contactList.firstWhere((element) => element.id == id);
      _contactList.remove(_contactModel);
      notifyListeners();
    });
  }
  void updateContactByIdAndFieldValue(int id, dynamic value, String columnName)   {
    BDHelper.updateContactByIdAndFieldValue(id, value, columnName);
  }
}