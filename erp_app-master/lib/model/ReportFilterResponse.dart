// To parse this JSON data, do
//
//     final reportFilterResponse = reportFilterResponseFromJson(jsonString);

import 'dart:convert';

ReportFilterResponse reportFilterResponseFromJson(String str) => ReportFilterResponse.fromJson(json.decode(str));

String reportFilterResponseToJson(ReportFilterResponse data) => json.encode(data.toJson());

class ReportFilterResponse {
  List<ReportFilter>? ReportFilterList;
  bool? success;
  String? resultMessage;

  ReportFilterResponse({
     this.ReportFilterList,
     this.success,
     this.resultMessage,
  });

  factory ReportFilterResponse.fromJson(Map<String, dynamic> json) => ReportFilterResponse(
    ReportFilterList: List<ReportFilter>.from(json["value"].map((x) => ReportFilter.fromJson(x))),
    success: json["success"],
    resultMessage: json["resultMessage"],
  );

  Map<String, dynamic> toJson() => {
    "value": List<dynamic>.from(ReportFilterList!.map((x) => x.toJson())),
    "success": success,
    "resultMessage": resultMessage,
  };
}

class ReportFilter {
  int? id;
  String? name;
  String? line1;
  String? line2;
  String? line3;
  int? transportId;
  dynamic? transportName;
  int? agentId;
  dynamic? agentName;
  int? hasteId;
  dynamic? hasteName;
  dynamic? station;
  dynamic? rateCateId;
  dynamic? rateCateName;

  ReportFilter({
     this.id,
     this.name,
     this.line1,
     this.line2,
     this.line3,
     this.transportId,
    this.transportName,
     this.agentId,
    this.agentName,
     this.hasteId,
    this.hasteName,
    this.station,
    this.rateCateId,
    this.rateCateName,
  });

  factory ReportFilter.fromJson(Map<String, dynamic> json) => ReportFilter(
    id: json["id"],
    name: json["name"],
    line1: json["line1"],
    line2: json["line2"],
    line3: json["line3"],
    transportId: json["transportId"],
    transportName: json["transportName"],
    agentId: json["agentId"],
    agentName: json["agentName"],
    hasteId: json["hasteId"],
    hasteName: json["hasteName"],
    station: json["station"],
    rateCateId: json["rateCateId"],
    rateCateName: json["rateCateName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "line1": line1,
    "line2": line2,
    "line3": line3,
    "transportId": transportId,
    "transportName": transportName,
    "agentId": agentId,
    "agentName": agentName,
    "hasteId": hasteId,
    "hasteName": hasteName,
    "station": station,
    "rateCateId": rateCateId,
    "rateCateName": rateCateName,
  };
}
