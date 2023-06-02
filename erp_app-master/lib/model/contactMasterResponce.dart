// To parse this JSON data, do
//
//     final contactMaster = contactMasterFromJson(jsonString);

import 'dart:convert';

ContactMasterResponce contactMasterFromJson(String str) => ContactMasterResponce.fromJson(json.decode(str));

String contactMasterToJson(ContactMasterResponce data) => json.encode(data.toJson());

class ContactMasterResponce {
  ContactMasterResponce({
     this.ContactMasterList,
     this.success,
     this.resultMessage,
  });
  List<ContactMaster>? ContactMasterList;
  bool? success;
  String? resultMessage;

  factory ContactMasterResponce.fromJson(Map<String, dynamic> json) => ContactMasterResponce(
    ContactMasterList: List<ContactMaster>.from(json["value"].map((x) => ContactMaster.fromJson(x))),
    success: json["success"],
    resultMessage: json["resultMessage"],
  );

  Map<String, dynamic> toJson() => {
    "value": List<dynamic>.from(ContactMasterList!.map((x) => x.toJson())),
    "success": success,
    "resultMessage": resultMessage,
  };
}

class ContactMaster {
  ContactMaster({
     this.name,
     this.contactDetail,
     this.mobile,
     this.phone,
     this.email,
  });

  String? name;
  String? contactDetail;
  String? mobile;
  String? phone;
  String? email;

  factory ContactMaster.fromJson(Map<String, dynamic> json) => ContactMaster(
    name: json["name"],
    contactDetail: json["contactDetail"],
    mobile: json["mobile"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contactDetail": contactDetail,
    "mobile": mobile,
    "phone": phone,
    "email": email,
  };
}





// new
// To parse this JSON data, do
//
//     final contactMaster = contactMasterFromJson(jsonString);

/*
import 'dart:convert';

ContactMaster contactMasterFromJson(String str) => ContactMaster.fromJson(json.decode(str));

String contactMasterToJson(ContactMaster data) => json.encode(data.toJson());

class ContactMaster {
  ContactMaster({
    required this.value,
    required this.success,
    required this.resultMessage,
  });

  List<Value> value;
  bool success;
  String resultMessage;

  factory ContactMaster.fromJson(Map<String, dynamic> json) => ContactMaster(
    value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    success: json["success"],
    resultMessage: json["resultMessage"],
  );

  Map<String, dynamic> toJson() => {
    "value": List<dynamic>.from(value.map((x) => x.toJson())),
    "success": success,
    "resultMessage": resultMessage,
  };
}

class Value {
  Value({
    required this.name,
    required this.contactDetail,
    required this.mobile,
    this.phone,
    this.email,
  });

  String name;
  String contactDetail;
  String mobile;
  String? phone;
  String? email;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    name: json["name"],
    contactDetail: json["contactDetail"],
    mobile: json["mobile"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contactDetail": contactDetail,
    "mobile": mobile,
    "phone": phone,
    "email": email,
  };
}
*/
