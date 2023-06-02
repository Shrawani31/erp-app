

import 'package:meta/meta.dart';
import 'dart:convert';

import 'accountMasterRequest.dart';

ReportFilterRequest getreportfilterRequestFromJson(String str) => ReportFilterRequest.fromJson(json.decode(str));

String getreportfilterRequestToJson(ReportFilterRequest data) => json.encode(data.toJson());

class ReportFilterRequest {
  ReportFilterRequest({
    required this.p_pagenumber,
    required this.p_rowsperpage,
    required this.p_search,
    required this.p_spname,

  });

  String p_pagenumber;
  String p_rowsperpage;
  String p_search;
  String p_spname;


  factory ReportFilterRequest.fromJson(Map<String, dynamic> json) => ReportFilterRequest(
    p_pagenumber: json["p_PageNumber"],
    p_rowsperpage: json["p_RowsPerPage"],
    p_search: json["p_Search"],
    p_spname: json["p_SpName"],

  );

  Map<String, dynamic> toJson() => {
    "p_PageNumber": p_pagenumber,
    "p_RowsPerPage": p_rowsperpage,
    "p_Search": p_search,
    "p_SpName": p_spname,

  };
}
