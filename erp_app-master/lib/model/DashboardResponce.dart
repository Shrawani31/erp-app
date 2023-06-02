// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) => DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) => json.encode(data.toJson());

class DashboardResponse {
  List<Dashboard>? DashboardList;
  String? notificationCount;
  String? lastUpload;
  String? expDate;
  bool? success;
  String? resultMessage;

  DashboardResponse({
     this.DashboardList,
     this.notificationCount,
     this.lastUpload,
     this.expDate,
     this.success,
     this.resultMessage,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) => DashboardResponse(
    DashboardList: List<Dashboard>.from(json["value"].map((x) => Dashboard.fromJson(x))),
    notificationCount: json["notification_Count"],
    lastUpload: json["lastUpload"],
    expDate: json["expDate"],
    success: json["success"],
    resultMessage: json["resultMessage"],
  );


  Map<String, dynamic> toJson() => {
    "value": List<dynamic>.from(DashboardList!.map((x) => x.toJson())),
    "notification_Count": notificationCount,
    "lastUpload": lastUpload,
    "expDate": expDate,
    "success": success,
    "resultMessage": resultMessage,
  };
}

class Dashboard {
  int? menuId;
  String? menuName;
  String? menuDisplayName;
  String? iconUrl;
  int? type;
  List<dynamic>? childMenu;
  int? parentId;

  Dashboard({
     this.menuId,
     this.menuName,
     this.menuDisplayName,
     this.iconUrl,
     this.type,
     this.childMenu,
     this.parentId,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    menuId: json["menuId"],
    menuName: json["menuName"],
    menuDisplayName: json["menuDisplayName"],
    iconUrl: json["iconUrl"],
    type: json["type"],
    childMenu: List<dynamic>.from(json["childMenu"].map((x) => x)),
    parentId: json["parentId"],
  );

  Map<String, dynamic> toJson() => {
    "menuId": menuId,
    "menuName": menuName,
    "menuDisplayName": menuDisplayName,
    "iconUrl": iconUrl,
    "type": type,
    "childMenu": List<dynamic>.from(childMenu!.map((x) => x)),
    "parentId": parentId,
  };
}
