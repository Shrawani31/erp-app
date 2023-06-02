// To parse this JSON data, do
//
//     final authenticateuserRequest = authenticateuserRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AcountMasterRequest AccountListingRequestFromJson(String str) => AcountMasterRequest.fromJson(json.decode(str));

String AccountListingRequestToJson(AcountMasterRequest data) => json.encode(data.toJson());

class AcountMasterRequest {
  AcountMasterRequest({ 
    required this.p_pagenumber,
    required this.p_rowsperpage,
    required this.p_search,

  });

  String p_pagenumber;
  String p_rowsperpage;
  String p_search;


  factory AcountMasterRequest.fromJson(Map<String, dynamic> json) => AcountMasterRequest(
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
