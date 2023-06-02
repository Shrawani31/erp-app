import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api_provider.dart';
import '../model/accountMasterRequest.dart';
import '../model/accountMasterResponce.dart';

class AccountMasterController extends GetxController {
  ApiProvider apiManager = ApiProvider();
  var local_store = GetStorage();
  var pageNo = "0".obs;
  var pagePerRow = "20";
  var pageSearch = "".obs;
  Rx<AcountMasterResponce> acountMasterRes = AcountMasterResponce().obs;
  RxList<AccountMaster> accountMasterList = RxList();

  String getToken() {
    return local_store.read('token');
  }

  RxBool isLoading = false.obs;
  //try

  accountListing() async {
    /*var res = await apiManager.accountListing(pageNo.value,pagePerRow,pageSearch.value);
    acountMasterRes.value.AccountMasterList?.addAll(res);*/
    isLoading(true);
    String token = local_store.read('token');
    var response = await apiManager.accountListing(
        pageNo.value, pagePerRow, pageSearch.value, token);
    print(response.body);
    var res = jsonDecode(response.body);
    print(res);
    if (res['success'] == true) {
      acountMasterRes(AcountMasterResponce.fromJson(res));
    }
    accountMasterList.addAll(acountMasterRes.value.AccountMasterList!.toList());
    isLoading(false);
  }
}
