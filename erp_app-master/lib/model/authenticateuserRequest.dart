// To parse this JSON data, do
//
//     final authenticateuserRequest = authenticateuserRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AuthenticateuserRequest authenticateuserRequestFromJson(String str) => AuthenticateuserRequest.fromJson(json.decode(str));

String authenticateuserRequestToJson(AuthenticateuserRequest data) => json.encode(data.toJson());

class AuthenticateuserRequest {
  AuthenticateuserRequest({
    required this.username,
    required this.password,
    required this.clientCode,
    required this.ifcm,
    required this.afcm,
    required this.iDeviceType,
    required this.aDeviceType,
  });

  String username;
  String password;
  String clientCode;
  String ifcm;
  String afcm;
  String iDeviceType;
  String aDeviceType;

  factory AuthenticateuserRequest.fromJson(Map<String, dynamic> json) => AuthenticateuserRequest(
    username: json["username"],
    password: json["password"],
    clientCode: json["ClientCode"],
    ifcm: json["IFCM"],
    afcm: json["AFCM"],
    iDeviceType: json["IDeviceType"],
    aDeviceType: json["ADeviceType"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "ClientCode": clientCode,
    "IFCM": ifcm,
    "AFCM": afcm,
    "IDeviceType": iDeviceType,
    "ADeviceType": aDeviceType,
  };
}
