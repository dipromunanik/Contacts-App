import 'package:contacts_app/models/contact_model.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:contacts_app/utils/custom_dailogbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_ios/url_launcher_ios.dart';


class ContactDetails extends StatefulWidget {

  static const String routeName ='/contact_details';
  
  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {

  late ContactProvider _provider;
  int id = -1;

  @override
  void didChangeDependencies() {
    _provider = Provider.of<ContactProvider>(context);
    id =ModalRoute.of(context)!.settings.arguments as int;
   _provider.getContactById(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(_provider.contactModel!.name,style:const TextStyle(fontSize: 22,color: Colors.black)),
        actions: [
          IconButton(
            icon:const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog();
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 3,
            shadowColor: Colors.pink,
            child: ListTile(
              title: Text(_provider.contactModel!.name),
              trailing: IconButton(onPressed: (){
                showDialogWithInputText(context: context, title: 'Name',
                    onUpdate:(value){
                  if(value !=null){
                    _provider.updateContactByIdAndFieldValue(id, value, tblContactColName);
                  }else{

                  }
                    } );

              }, icon:const Icon(Icons.edit,color: Colors.pink)),
            ),
          ),
          Card(
            elevation: 3,
            shadowColor: Colors.pink,
            child: ListTile(
              title: Text(_provider.contactModel!.designation!),
              trailing: IconButton(onPressed: (){
                showDialogWithInputText(context: context, title: 'Designation',
                    onUpdate: (value){
                  if(value !=null){
                    _provider.updateContactByIdAndFieldValue(id, value, tblContactColDesignation);
                  }else{

                  }
                } );

              }, icon:const Icon(Icons.edit,color: Colors.pink)),
            ),
          ),

          Card(
            elevation: 3,
            shadowColor: Colors.pink,
            child: ListTile(
              title: Text(_provider.contactModel!.companyName!),
              trailing: IconButton(onPressed: (){

                showDialogWithInputText(context: context, title: 'Company name',
                    onUpdate:  (value){
                      if(value !=null){
                        _provider.updateContactByIdAndFieldValue(id, value, tblContactColCompanyName);
                      }else{

                      }
                    });
              }, icon:const Icon(Icons.edit,color: Colors.pink)),
            ),
          ),

          Card(
            elevation: 3,
            shadowColor: Colors.pink,
            child: ListTile(
              title: Text(_provider.contactModel!.mobile),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){}, icon:const Icon(Icons.sms,color: Colors.pink)),
                  IconButton(onPressed: _callNumber, icon:const Icon(Icons.call,color: Colors.pink)),
                ],
              ),
            ),
          ),
          Card(

            elevation: 3,
            shadowColor: Colors.pink,
            child: ListTile(
                title: Text(_provider.contactModel!.address!),
                trailing: IconButton(onPressed: (){

                }, icon: Icon(Icons.add_location,color: Colors.pink)))
            ),
          Card(
            elevation: 3,
            shadowColor: Colors.pink,
            child: ListTile(
                title: Text(_provider.contactModel!.emailAddress!),
                trailing: IconButton(onPressed: (){

                }, icon:const  Icon(Icons.email,color: Colors.pink,))
            ),
          ),
        ],
      ),
    );
  }

  void _callNumber() async {
    final url ='tel: ${_provider.contactModel!.mobile}';
    // ignore: deprecated_member_use
    if(await canLaunch(url)){
      // ignore: deprecated_member_use
      await launch(url);
    }
    else{
      throw 'Could not launch application';
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Delete ${_provider.contactModel!.name}?'),
      content: const Text('Are you sure to delete this contact?'),
      actions: [
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: const Text('Cancel')),
        TextButton(onPressed: () {
          Navigator.pop(context);//pop the dialog
          _provider.deleteContactById(id);
          Navigator.pop(context);//pop the details page
        }, child: const Text('Yes')),
      ],
    ));
  }
}
