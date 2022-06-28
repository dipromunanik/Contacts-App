import 'package:contacts_app/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class BDHelper{

  static const String _createTableContact='''create table $tblContact(
  $tblContactColId integer primary key autoincrement,
  $tblContactColName text,
  $tblContactColEmail text,
  $tblContactColMobile text,
  $tblContactColAddress text,
  $tblContactColCompanyName text,
  $tblContactColDesignation text
  )''';
  static Future<Database> open() async{

    final rootDb =await getDatabasesPath();
    final dbPath = Path.join(rootDb,'contact_db');

    return openDatabase(dbPath,version: 1,onCreate: (db,version) async{
      await db.execute(_createTableContact);
      
    });

  }
  static Future<int> insertNewContact(ContactModel contactModel)async{
    final db =await open();
   return db.insert(tblContact, contactModel.toMap());
  }
  static Future<List<ContactModel>> getAllContacts() async{
    final db =await open();
   final mapList =await db.query(tblContact);
   
   return List.generate(mapList.length, (index) => ContactModel.fromMap(mapList[index]));
  }
  static Future<ContactModel> getContactById(int id) async {
    final db = await open();
    final mapList = await db.query(tblContact, where: '$tblContactColId = ?', whereArgs: [id]);
    return ContactModel.fromMap(mapList.first);
  }
  static Future<int> deleteContactById(int id)  async {
    final db = await open();
    return  db.delete(tblContact, where: '$tblContactColId = ?', whereArgs: [id]);
  }
  static Future<int> updateContactByIdAndFieldValue(int id, dynamic value, String columnName)  async {
    final db = await open();
    return  db.update(tblContact, {columnName : value}, where: '$tblContactColId = ?', whereArgs: [id]);
  }

}