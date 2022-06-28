const String tblContact ='tblContact';
const String tblContactColId ='id';
const String tblContactColName ='name';
const String tblContactColEmail ='emailAddress';
const String tblContactColMobile ='mobile';
const String tblContactColAddress ='address';
const String tblContactColCompanyName ='companyName';
const String tblContactColDesignation ='designation';

class ContactModel{
  int id;
  String name;
  String? emailAddress;
  String mobile;
  String? address;
  String? companyName;
  String? designation;

  ContactModel(
      {this.id=-1,
      required this.name,
      this.emailAddress,
      required this.mobile,
      this.address,
      this.companyName,
      this.designation});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
     tblContactColName: name,
      tblContactColEmail:emailAddress,
      tblContactColMobile:mobile,
      tblContactColAddress:address,
      tblContactColCompanyName:companyName,
      tblContactColDesignation:designation
    };
    if(id>0){
      map[tblContactColId] =id;
    }
    return map;
  }
  factory ContactModel.fromMap(Map<String, dynamic> map) => ContactModel(
    id: map[tblContactColId],
    name: map[tblContactColName],
    emailAddress: map[tblContactColEmail],
    mobile: map[tblContactColMobile],
    address: map[tblContactColAddress],
    companyName: map[tblContactColCompanyName],
    designation: map[tblContactColDesignation],

  );
}