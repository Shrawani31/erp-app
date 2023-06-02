import 'package:meta/meta.dart';
import 'dart:convert';

OutstadingRequest getreportbymenuRequestFromJson(String str) =>
    OutstadingRequest.fromJson(json.decode(str));

String getreportbymenuRequestToJson(OutstadingRequest data) =>
    json.encode(data.toJson());

class OutstadingRequest {
  OutstadingRequest({
    required this.menuname,
    required this.repmode,
  });

  String menuname;
  String repmode;

  factory OutstadingRequest.fromJson(Map<String, dynamic> json) =>
      OutstadingRequest(
        menuname: json["MenuName"],
        repmode: json["RepMode"],
      );

  Map<String, dynamic> toJson() => {
        "MenuName": menuname,
        "RepMode": repmode,
      };
}
