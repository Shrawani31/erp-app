//import 'package:erp_app/Pages/contact_master_page.dart';
import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api_provider.dart';
import '../model/ReportFilterResponse.dart';

class ReportFilterController extends GetxController {
  ApiProvider apiManager = ApiProvider();
  var local_store = GetStorage();
  var pageNo = "0".obs;
  var pagePerRow = "10";
  var pageSearch = "".obs;
  var pageSpName = "PrcCustomerBtn".obs;
  Rx<ReportFilterResponse> reportFilterRes =ReportFilterResponse().obs;
  // RxList<ReportFilter> reportFilterList = RxList();
  RxList<ReportFilter> reportFilterList = RxList();

  String getToken() {
    return local_store.read('token');
  }

  RxBool isLoading = false.obs;
  //try

  getreportfilter() async {

    isLoading(true);
    String token = local_store.read('token');
    var response = await apiManager.getreportfilter(
        pageNo.value, pagePerRow, pageSearch.value,pageSpName.value, token);
    print(response.body);
    var res = jsonDecode(response.body);
    print(res);
    if (res['success'] == true) {
      reportFilterRes(ReportFilterResponse.fromJson(res));
    }
    reportFilterList
        .addAll(reportFilterRes.value.ReportFilterList!.toList());
    isLoading(false);
  }
}

