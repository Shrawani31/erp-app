import 'package:meta/meta.dart';
import 'dart:convert';

UserVerificationResponce userVerificationResponceFromJson(String str) => UserVerificationResponce.fromJson(json.decode(str));

String userVerificationResponceToJson(UserVerificationResponce data) => json.encode(data.toJson());

class UserVerificationResponce {
  UserVerificationResponce({
     this.value,
     this.success,
     this.resultMessage,
  });

  Value? value;
  bool? success;
  String? resultMessage;

  factory UserVerificationResponce.fromJson(Map<String, dynamic> json) => UserVerificationResponce(
    value: Value.fromJson(json["value"]),
    success: json["success"],
    resultMessage: json["resultMessage"],
  );

  Map<String, dynamic> toJson() => {
    "value": value?.toJson(),
    "success": success,
    "resultMessage": resultMessage,
  };
}

class Value {
  Value({
    required this.smsurl,
    required this.isOtp,
    required this.otp,
    required this.mobileNo,
    required this.email,
    required this.deviceLock,
  });

  String smsurl;
  bool isOtp;
  String otp;
  String mobileNo;
  String email;
  bool deviceLock;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    smsurl: json["smsurl"],
    isOtp: json["isOTP"],
    otp: json["otp"],
    mobileNo: json["mobileNo"],
    email: json["email"],
    deviceLock: json["deviceLock"],
  );

  Map<String, dynamic> toJson() => {
    "smsurl": smsurl,
    "isOTP": isOtp,
    "otp": otp,
    "mobileNo": mobileNo,
    "email": email,
    "deviceLock": deviceLock,
  };
}
