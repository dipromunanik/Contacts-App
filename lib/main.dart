import 'package:contacts_app/pages/contact_details_page.dart';
import 'package:contacts_app/pages/contact_list_pages.dart';
import 'package:contacts_app/pages/new_contact_page.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ContactProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ContactListPage.routeName,
        routes: {
          ContactListPage.routeName:(context)=>ContactListPage(),
          ContactDetails.routeName:(context)=>ContactDetails(),
          NewContactPage.routeName:(context)=>NewContactPage(),
        },
      ),
    );
  }
}
