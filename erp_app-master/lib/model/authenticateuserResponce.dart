import 'package:meta/meta.dart';
import 'dart:convert';

AuthenticateuserResponce authenticateuserResponceFromJson(String str) =>
    AuthenticateuserResponce.fromJson(json.decode(str));

String authenticateuserResponceToJson(AuthenticateuserResponce data) =>
    json.encode(data.toJson());

class AuthenticateuserResponce {
  AuthenticateuserResponce({
    this.value,
    this.success,
    this.resultMessage,
  });

  Value? value;
  bool? success;
  String? resultMessage;

  factory AuthenticateuserResponce.fromJson(Map<String, dynamic> json) =>
      AuthenticateuserResponce(
        value: Value.fromJson(json["value"]),
        success: json["success"],
        resultMessage: json["resultMessage"],
      );

  Map<String, dynamic> toJson() => {
        "value": value!.toJson(),
        "success": success,
        "resultMessage": resultMessage,
      };
}

class Value {
  Value({
    required this.token,
    required this.firstName,
    required this.clientLogo,
    required this.lastUpload,
    required this.companyId,
    required this.fromDate,
    required this.uptoDate,
    required this.url,
    required this.clientId,
    required this.roleName,
  });

  String token;
  String firstName;
  String clientLogo;
  String lastUpload;
  int companyId;
  String fromDate;
  String uptoDate;
  String url;
  int clientId;
  String roleName;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        token: json["token"],
        firstName: json["firstName"],
        clientLogo: json["clientLogo"],
        lastUpload: json["lastUpload"],
        companyId: json["companyId"],
        fromDate: json["fromDate"],
        uptoDate: json["uptoDate"],
        url: json["url"],
        clientId: json["clientId"],
        roleName: json["roleName"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "firstName": firstName,
        "clientLogo": clientLogo,
        "lastUpload": lastUpload,
        "companyId": companyId,
        "fromDate": fromDate,
        "uptoDate": uptoDate,
        "url": url,
        "clientId": clientId,
        "roleName": roleName,
      };
}
