// To parse this JSON data, do
//
//     final acountMaster = acountMasterFromJson(jsonString);

import 'dart:convert';

AcountMasterResponce acountMasterFromJson(String str) => AcountMasterResponce.fromJson(json.decode(str));

String acountMasterToJson(AcountMasterResponce data) => json.encode(data.toJson());

class AcountMasterResponce {
  AcountMasterResponce({
    this.AccountMasterList,
     this.success,
     this.resultMessage,
  });

  List<AccountMaster>? AccountMasterList;
  bool? success;
  String? resultMessage;

  factory AcountMasterResponce.fromJson(Map<String, dynamic> json) => AcountMasterResponce(
    AccountMasterList: List<AccountMaster>.from(json["value"].map((x) => AccountMaster.fromJson(x))),
    success: json["success"],
    resultMessage: json["resultMessage"],
  );

  Map<String, dynamic> toJson() => {
    "value": List<dynamic>.from(AccountMasterList!.map((x) => x.toJson())),
    "success": success,
    "resultMessage": resultMessage,
  };
}

class AccountMaster {
  AccountMaster({
     this.id,
    this.name,
     this.displayName,
     this.type,
     this.typeName,
     this.schdId,
     this.schdName,
     this.custType,
     this.registrationType,
     this.group,
     this.groupName,
     this.gst,
     this.add1,
     this.add2,
     this.city,
     this.state,
     this.district,
     this.market,
     this.phone,
     this.mobile,
     this.mobileSms,
     this.email,
     this.contactPerson,
     this.bankName,
     this.acountNumber,
     this.ifscCode,
     this.branchName,
    this.tanNo,
     this.panNo,
     this.dhara,
     this.mudat,
     this.interestRate,
     this.crDays,
     this.dhara1,
     this.dhara2,
     this.dhara3,
     this.transport,
     this.transportName,
     this.station,
     this.refName,
     this.remark,
     this.reftxt1,
     this.reftxt2,
     this.reftxt3,
     this.agentId,
     this.agentName,
     this.isActive,
     this.actionBy,
  });

  int? id;
  String? name;
  String? displayName;
  int?type;
  String? typeName;
  int? schdId;
  String? schdName;
  String? custType;
  String? registrationType;
  int? group;
  String? groupName;
  String? gst;
  String? add1;
  String? add2;
  String? city;
  String? state;
  String? district;
  String? market;
  String? phone;
  String? mobile;
  String? mobileSms;
  String? email;
  String? contactPerson;
  String? bankName;
  String? acountNumber;
  String? ifscCode;
  String? branchName;
  String? tanNo;
  String? panNo;
  String? dhara;
  String? mudat;
  double? interestRate;
  String? crDays;
  String? dhara1;
  String? dhara2;
  String? dhara3;
  int? transport;
  String? transportName;
  String? station;
  String? refName;
  String? remark;
  String? reftxt1;
  String? reftxt2;
  String? reftxt3;
  int? agentId;
  String? agentName;
  String? isActive;
  int? actionBy;

  factory AccountMaster.fromJson(Map<String, dynamic> json) => AccountMaster(
    id: json["id"],
    name: json["name"],
    displayName: json["displayName"],
    type: json["type"],
    typeName: json["typeName"],
    schdId: json["schdId"],
    schdName: json["schdName"],
    custType: json["custType"],
    registrationType: json["registrationType"],
    group: json["group"],
    groupName: json["groupName"],
    gst: json["gst"],
    add1: json["add1"],
    add2: json["add2"],
    city: json["city"],
    state: json["state"],
    district: json["district"],
    market: json["market"],
    phone: json["phone"],
    mobile: json["mobile"],
    mobileSms: json["mobileSMS"],
    email: json["email"],
    contactPerson: json["contactPerson"],
    bankName: json["bankName"],
    acountNumber: json["acountNumber"],
    ifscCode: json["ifscCode"],
    branchName: json["branchName"],
    tanNo: json["tanNo"],
    panNo: json["panNo"],
    dhara: json["dhara"],
    mudat: json["mudat"],
    interestRate: json["interestRate"],
    crDays: json["crDays"],
    dhara1: json["dhara1"],
    dhara2: json["dhara2"],
    dhara3: json["dhara3"],
    transport: json["transport"],
    transportName: json["transportName"],
    station: json["station"],
    refName: json["refName"],
    remark: json["remark"],
    reftxt1: json["reftxt1"],
    reftxt2: json["reftxt2"],
    reftxt3: json["reftxt3"],
    agentId: json["agentId"],
    agentName: json["agentName"],
    isActive: json["isActive"],
    actionBy: json["actionBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "displayName": displayName,
    "type": type,
    "typeName": typeName,
    "schdId": schdId,
    "schdName": schdName,
    "custType": custType,
    "registrationType":registrationType,
    "group": group,
    "groupName": groupName,
    "gst": gst,
    "add1": add1,
    "add2": add2,
    "city": city,
    "state": state,
    "district": district,
    "market": market,
    "phone": phone,
    "mobile": mobile,
    "mobileSMS": mobileSms,
    "email": email,
    "contactPerson": contactPerson,
    "bankName": bankName,
    "acountNumber": acountNumber,
    "ifscCode": ifscCode,
    "branchName": branchName,
    "tanNo": tanNo,
    "panNo": panNo,
    "dhara": dhara,
    "mudat": mudat,
    "interestRate": interestRate,
    "crDays": crDays,
    "dhara1": dhara1,
    "dhara2": dhara2,
    "dhara3": dhara3,
    "transport": transport,
    "transportName": transportName,
    "station": station,
    "refName":refName,
    "remark": remark,
    "reftxt1": reftxt1,
    "reftxt2": reftxt2,
    "reftxt3": reftxt3,
    "agentId": agentId,
    "agentName": agentName,
    "isActive": isActive,
    "actionBy": actionBy,
  };
}



