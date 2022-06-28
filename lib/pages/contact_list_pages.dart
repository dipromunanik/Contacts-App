import 'package:contacts_app/custom_design/contact_design.dart';
import 'package:contacts_app/pages/new_contact_page.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {

  late ContactProvider _provider;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    _provider = Provider.of<ContactProvider>(context);
    if(_isInit) {
      _provider.getContacts();
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title:const Text('Contacts',style: TextStyle(fontSize: 22,color: Colors.black)),
        ),
        body: Padding(
          padding:const EdgeInsets.all(3.0),
          child: ListView.builder(
            padding:const EdgeInsets.all(3.0),
            itemCount: _provider.getContactList.length,
            itemBuilder: (context,index){
              final contact =_provider.getContactList[index];
              return ContactCardDesign(contact, index);
            },
          )
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add,color: Colors.black,size: 30),
        onPressed: () => Navigator
            .pushNamed(context, NewContactPage.routeName),
      ),
    );
  }
}
