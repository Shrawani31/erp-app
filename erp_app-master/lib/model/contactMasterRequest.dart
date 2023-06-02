// To parse this JSON data, do
//
//     final authenticateuserRequest = authenticateuserRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'accountMasterRequest.dart';

ContactMasterRequest getcontactRequestFromJson(String str) => ContactMasterRequest.fromJson(json.decode(str));

String getcontactRequestToJson(ContactMasterRequest data) => json.encode(data.toJson());

class ContactMasterRequest {
  ContactMasterRequest({
    required this.p_pagenumber,
    required this.p_rowsperpage,
    required this.p_search,

  });

  String p_pagenumber;
  String p_rowsperpage;
  String p_search;


  factory ContactMasterRequest.fromJson(Map<String, dynamic> json) => ContactMasterRequest(
    p_pagenumber: json["p_PageNumber"],
    p_rowsperpage: json["p_RowsPerPage"],
    p_search: json["p_Search"],

  );

  Map<String, dynamic> toJson() => {
    "p_PageNumber": p_pagenumber,
    "p_RowsPerPage": p_rowsperpage,
    "p_Search": p_search,

  };
}
