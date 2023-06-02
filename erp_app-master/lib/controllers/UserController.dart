import 'dart:convert';

import 'package:erp_app/model/accountMasterRequest.dart';
import 'package:erp_app/model/authenticateuserRequest.dart';
import 'package:erp_app/model/authenticateuserResponce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Routes.dart';
import '../api/api_provider.dart';
import '../model/UserVerificationRequest.dart';
import '../model/UserVerificationResponce.dart';
import '../model/accountMasterResponce.dart';

class UserController extends GetxController {
  ApiProvider apiManager = ApiProvider();
  var local_store = GetStorage();

  final MobileController = TextEditingController();
  final passwordController = TextEditingController();
  final clientController = TextEditingController();
  var isRememberMe = false.obs;
  Rx<UserVerificationResponce> userVerificationRes =
      UserVerificationResponce().obs;

  Rx<AuthenticateuserResponce> authResponse = AuthenticateuserResponce().obs;
  RxBool isLoading = false.obs;

  getUserVerificationBy() async {
    var response =
        await apiManager.getUserVerificationBy(UserVerificationRequest(
      username: MobileController.text,
      clientcode: clientController.text,
      password: passwordController.text,
      afcm:
          "fa9qEdxCgrfWo7lTyPG:APA91bEjYRyelSjjW4i1diy-XjVOdLCohEKyNe7BPIIHLKnbIMCoO9A0-JtL0VeDbt-y7l8gr2KS9VUw1UkiyhyJqem4OM_R4qSXsiIYB8T6EYptyxRvjzPGdSk-d6o9D4NAnaAKuXaj",
      ifcm: "123",
    ));
    var res = jsonDecode(response.body);
    if (res['success'] == false) {
      Get.snackbar('Error', 'Invalid Username or Client code',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          colorText: Colors.white,
          snackPosition: SnackPosition.values.last);
    } else {
      userVerificationRes(
          UserVerificationResponce.fromJson(jsonDecode(response.body)));
    }
  }

  authenticateuser() async {
    var response = await apiManager.authenticateuser(AuthenticateuserRequest(
      username: MobileController.text,
      clientCode: clientController.text,
      password: passwordController.text,
      ifcm: "",
      iDeviceType: "",
      aDeviceType: "Android",
      afcm: "abc",
    ));
    var res = jsonDecode(response.body);
    if (res['success'] == false) {
      Get.snackbar('Error', 'Invalid Password!',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      MobileController.clear();
      clientController.clear();
      passwordController.clear();

      authResponse(
          AuthenticateuserResponce.fromJson(jsonDecode(response.body)));

      local_store.write("token", authResponse.value.value!.token);
      local_store.write("user", authResponse.value.toJson().toString());
      local_store.write(
          "username", authResponse.value.value!.firstName.toString());
      local_store.write(
          "lastSyncTime", authResponse.value.value!.lastUpload.toString());

      local_store.write("isRememberMe", true);
      Get.offAllNamed(MyRoutes.Dashboardroute);
    }
  }
}

































/*

if (isRememberMe.isTrue) {
local_store.write("isRememberMe", true);
} else {
local_store.write("isRememberMe", false);
}

Get.offAllNamed(MyRoutes.Dashboardroute);*/
