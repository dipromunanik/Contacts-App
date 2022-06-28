import 'package:contacts_app/models/contact_model.dart';
import 'package:contacts_app/pages/contact_details_page.dart';
import 'package:flutter/material.dart';
class ContactItem extends StatefulWidget {
  final ContactModel contact;
  final int index;

  ContactItem(this.contact,this.index);

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: (){
          Navigator.pushNamed(context, ContactDetails.routeName,arguments: widget.contact.id);
        },
        title: Text(widget.contact.name),
        subtitle: Text(widget.contact.designation! ),
      ),
    );
  }
}
