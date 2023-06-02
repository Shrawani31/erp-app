
import 'package:meta/meta.dart';
import 'dart:convert';

UserVerificationRequest userVerificationRequestFromJson(String str) => UserVerificationRequest.fromJson(json.decode(str));

String userVerificationRequestToJson(UserVerificationRequest data) => json.encode(data.toJson());

class UserVerificationRequest {
  UserVerificationRequest({
    required this.username,
    required this.clientcode,
    required this.password,
    required this.afcm,
    required this.ifcm,
  });

  String username;
  String clientcode;
  String password;
  String afcm;
  String ifcm;

  factory UserVerificationRequest.fromJson(Map<String, dynamic> json) => UserVerificationRequest(
    username: json["username"],
    clientcode: json["clientcode"],
    password: json["password"],
    afcm: json["AFCM"],
    ifcm: json["IFCM"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "clientcode": clientcode,
    "password": password,
    "AFCM": afcm,
    "IFCM": ifcm,
  };
}
