// To parse this JSON data, do
//
//     final outstandingResponse = outstandingResponseFromJson(jsonString);

import 'dart:convert';

OutstandingResponse outstandingResponseFromJson(String str) => OutstandingResponse.fromJson(json.decode(str));

String outstandingResponseToJson(OutstandingResponse data) => json.encode(data.toJson());

class OutstandingResponse {
  List<Outstanding>? OutstandingList;
  bool? success;
  String? resultMessage;

  OutstandingResponse({
     this.OutstandingList,
     this.success,
     this.resultMessage,
  });

  factory OutstandingResponse.fromJson(Map<String, dynamic> json) => OutstandingResponse(
    OutstandingList: List<Outstanding>.from(json["value"].map((x) => Outstanding.fromJson(x))),
    success: json["success"],
    resultMessage: json["resultMessage"],
  );

  Map<String, dynamic> toJson() => {
    "value": List<dynamic>.from(OutstandingList!.map((x) => x.toJson())),
    "success": success,
    "resultMessage": resultMessage,
  };
}

class Outstanding {
  int? reportId;
  String? repName;
  List<Filter>? filter;
  String? fromDate;
  String? toDate;
  bool? isVoucher;
  dynamic defaultFilter;
  List<dynamic>? ftp;

  Outstanding({
     this.reportId,
     this.repName,
     this.filter,
     this.fromDate,
     this.toDate,
     this.isVoucher,
    this.defaultFilter,
     this.ftp,
  });

  factory Outstanding.fromJson(Map<String, dynamic> json) => Outstanding(
    reportId: json["reportId"],
    repName: json["repName"],
    filter: List<Filter>.from(json["filter"].map((x) => Filter.fromJson(x))),
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    isVoucher: json["isVoucher"],
    defaultFilter: json["defaultFilter"],
    ftp: List<dynamic>.from(json["ftp"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "reportId": reportId,
    "repName": repName,
    "filter": List<dynamic>.from(filter!.map((x) => x.toJson())),
    "fromDate": fromDate,
    "toDate": toDate,
    "isVoucher": isVoucher,
    "defaultFilter": defaultFilter,
    "ftp": List<dynamic>.from(ftp!.map((x) => x)),
  };
}

class Filter {
  Name? name;
  SpName? spName;
  Tag? tag;

  Filter({
     this.name,
     this.spName,
     this.tag,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    name: nameValues.map[json["name"]]!,
    spName: spNameValues.map[json["spName"]]!,
    tag: tagValues.map[json["tag"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "spName": spNameValues.reverse[spName],
    "tag": tagValues.reverse[tag],
  };
}

enum Name { CUSTOMER, SUPPLIER, COMPANY }

final nameValues = EnumValues({
  "Company": Name.COMPANY,
  "Customer": Name.CUSTOMER,
  "Supplier": Name.SUPPLIER
});

enum SpName { PRC_CUSTOMER_BTN, PRC_SUPPLIER_BTN, PRC_COMPANY_BTN, SP_NAME_PRC_COMPANY_BTN }

final spNameValues = EnumValues({
  "PrcCompanyBtn": SpName.PRC_COMPANY_BTN,
  "PrcCustomerBtn": SpName.PRC_CUSTOMER_BTN,
  "PrcSupplierBtn": SpName.PRC_SUPPLIER_BTN,
  "prcCompanyBtn": SpName.SP_NAME_PRC_COMPANY_BTN
});

enum Tag { CUST, SUPP, COMP }

final tagValues = EnumValues({
  "Comp": Tag.COMP,
  "Cust": Tag.CUST,
  "Supp": Tag.SUPP
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
