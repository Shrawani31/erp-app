import 'package:erp_app/Routes.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import '../api/api_provider.dart';
import '../model/DashboardResponce.dart';

class DashboardController extends GetxController {
  ApiProvider apiManager = ApiProvider();
  var local_store = GetStorage();
  var isLoading = false.obs;
  Rx<DashboardResponse> dashboardRes = DashboardResponse().obs;
  //RxList<Dashboard> dashboardList =RxList<Dashboard>().obs;
  DashboardController() {
    getallappmenubyroleid();
  }

  String getToken() {
    return local_store.read('token');
  }

  //try

  getallappmenubyroleid() async {
    isLoading(true);
    String token = local_store.read('token');
    if (token == null) {
      Get.offAllNamed(MyRoutes.Loginroute);
    }
    var response = await apiManager.getallappmenubyroleid(token);
    print(response.body);
    var res = jsonDecode(response.body);

    //  if (res['success'] == true) {

    dashboardRes(DashboardResponse.fromJson(res));
    isLoading(false);
    // }

    // dashboardList.addAll(dashboardRes.value.DashboardList!.toList());
  }
}
