//import 'package:erp_app/Pages/contact_master_page.dart';
import 'dart:convert';
import 'dart:io';

import 'package:erp_app/model/OutstandingResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../Pages/pdfreportviewerpage.dart';
import '../api/ApiEndPoint.dart';
import '../api/api_provider.dart';
import '../model/contactMasterResponce.dart';
import 'package:http/http.dart' as http;

import '../model/reportresponse.dart';

class OutstandingController extends GetxController {
  ApiProvider apiManager = ApiProvider();
  var local_store = GetStorage();
  var menuName = "Outstanding".obs;
  var repMode = "Normal".obs;
  var reportResponse = ReportResponse().obs;
  Rx<OutstandingResponse> outstandingRes = OutstandingResponse().obs;
  RxList<Outstanding> outstandingList = RxList();

  final fromDate = TextEditingController();
  final toDate = TextEditingController();

  String getToken() {
    return local_store.read('token');
  }

  RxBool isLoading = false.obs;
  //try

  getreportbymenu() async {
    isLoading(true);
    String token = local_store.read('token');
    var response =
        await apiManager.getreportbymenu(menuName.value, repMode.value, token);
    print(response.body);
    var res = jsonDecode(response.body);
    print(res);
    if (res['success'] == true) {
      outstandingRes(OutstandingResponse.fromJson(res));
    }
    outstandingList.addAll(outstandingRes.value.OutstandingList!.toList());
    isLoading(false);
  }

  getReportByID(reportID) async {
    isLoading(true);
    String token = local_store.read('token');
    Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('POST',
        Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.REPORT_BY_REPORTID));
    request.fields.addAll({
      'ReportId': reportID.toString(),
      'data':
          '{"FrVno":"","ToVno":"","AccountId":[],"AgentGrp":[],"AgentId":[],"Conum":["1"],"CustGrp":[],"CustId":[],"FromDate":"01-May-2023","HasteId":[],"PartyGrp":[],"QualId":[],"RefId":[],"SuppGrp":[],"SuppId":[],"UptoDate":"31-May-2023"}'
    });

    request.headers.addAll(requestHeaders);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var streamToStr = await response.stream.bytesToString();

      var res = jsonDecode(streamToStr);
      if (res['success'] == true) {
        isLoading(false);
        reportResponse(ReportResponse.fromJson(res));
        Get.to(() => PdfReportViewerPage(pdfUrl: res['value'].toString()));
      } else {
        Get.snackbar('Error', 'No Report Found',
            backgroundColor: Colors.black,
            duration: Duration(seconds: 2),
            colorText: Colors.white,
            snackPosition: SnackPosition.values.last);
      }
    }
    isLoading(false);
  }
}
