import 'package:flutter/material.dart';

void showDialogWithInputText(
    {required BuildContext context,
      required String title,
      required Function(String? text) onUpdate
    }) {
  String? text;
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text('Edit $title',style: TextStyle(color: Colors.pink,fontSize: 20,fontWeight: FontWeight.bold)),
    content: TextField(
      decoration: InputDecoration(
        hintText: 'Enter new $title',
      ),
      onChanged: (value) {
        text = value;
      },
    ),
    actions: [
      TextButton(
        child: const Text('CLOSE',style: TextStyle(color: Colors.pink,fontSize: 16,fontWeight: FontWeight.bold)),
        onPressed: () => Navigator.pop(context),
      ),
      TextButton(
        child: const Text('UPDATE',style:TextStyle(color: Colors.pink,fontSize: 16,fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.pop(context);
          onUpdate(text);
        },
      ),

    ],
  ));
}