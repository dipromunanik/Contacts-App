import 'package:contacts_app/models/contact_model.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewContactPage extends StatefulWidget {

  static const String routeName ='/new_contact_page';

  const NewContactPage({Key? key}) : super(key: key);

  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {

  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _companyNameController =TextEditingController();
  final _designationController=TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _companyNameController.dispose();
    _designationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Details',style: TextStyle(color: Colors.black,fontSize: 22)),
        actions: [
          IconButton(onPressed: _saveContact, icon: Icon(Icons.save))
        ],
      ),
      body: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: 'Contact Name',
                    labelText: 'Contact',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.pink,
                          width: 2,
                        )
                    )
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your information';
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: 'Mobile number',
                    labelText: 'Phone',
                    prefixIcon: const Icon(Icons.call),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.pink,
                          width: 2,
                        )
                    )
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your information';
                  }
                  if (value.length != 11) {
                    return 'phone number invalid';
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Email address',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.pink,
                          width: 2,
                        )
                    )
                ),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                    hintText: 'Address',
                    labelText: 'Address',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.pink,
                          width: 2,
                        )
                    )
                ),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _companyNameController,
                decoration: InputDecoration(
                    hintText: 'Company name',
                    labelText: 'Name',
                    prefixIcon:const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.pink,
                          width: 2,
                        )
                    )
                ),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _designationController,
                decoration: InputDecoration(
                    hintText: 'Designation',
                    labelText: 'Information',
                    prefixIcon:const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.pink,
                          width: 2,
                        )
                    )
                ),
                validator: (value) {
                  return null;
                },
              ),
            ],
          )),
    );
  }

  void _saveContact() {
    if (_formkey.currentState!.validate()) {
      final contact = ContactModel(
        name: _nameController.text,
        emailAddress: _emailController.text,
        mobile: _phoneController.text,
        address: _addressController.text,
        companyName: _companyNameController.text,
        designation: _designationController.text
      );
      Provider
          .of<ContactProvider>(context, listen: false)
          .addContact(contact).then((value) =>
          Navigator.pop(context));
    }
  }
}