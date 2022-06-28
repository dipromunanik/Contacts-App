import 'package:contacts_app/models/contact_model.dart';
import 'package:contacts_app/pages/contact_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactCardDesign extends StatefulWidget {
  final ContactModel contact;
  final int index;

  ContactCardDesign(this.contact, this.index);

  @override
  _ContactCardDesignState createState() => _ContactCardDesignState();
}

class _ContactCardDesignState extends State<ContactCardDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ContactDetails.routeName,arguments: widget.contact.id);
      },
      child: Card(
          elevation: 3,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Stack(
            children: [
              Image.asset('images/card_image.png',
                  width: double.infinity, height: 250, fit: BoxFit.cover),
              Positioned(
                top: 10,
                  left: 20,
                  child: Text(widget.contact.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold))),
              Positioned(
                  top: 40,
                  left: 20,
                  child: Text(widget.contact.designation!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
              Positioned(
                bottom: 20,
                  right: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.contact.address!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                      const SizedBox(height: 2),
                      Text(widget.contact.mobile,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                      const SizedBox(height: 2),
                      Text(widget.contact.emailAddress!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
                    ],
                  )
              )
            ],
          ),
      ),
    );
  }
}
