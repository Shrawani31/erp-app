//import 'package:erp_app/Pages/contact_master_page.dart';
import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api_provider.dart';
import '../model/contactMasterResponce.dart';

class ContactMasterController extends GetxController {
  ApiProvider apiManager = ApiProvider();
  var local_store = GetStorage();
  var pageNo = "0".obs;
  var pagePerRow = "10";
  var pageSearch = "".obs;
  Rx<ContactMasterResponce> contactMasterRes = ContactMasterResponce().obs;
  RxList<ContactMaster> contactMasterList = RxList();

  String getToken() {
    return local_store.read('token');
  }

  RxBool isLoading = false.obs;
  //try

  getcontact() async {
    // contactMasterRes.value = await apiManager.getcontact(pageNo.value,pagePerRow,pageSearch.value);
    // contactMasterList.addAll(contactMasterRes.value.ContactMasterList!.toList());

    isLoading(true);
    String token = local_store.read('token');
    var response = await apiManager.getcontact(
        pageNo.value, pagePerRow, pageSearch.value, token);
    print(response.body);
    var res = jsonDecode(response.body);
    print(res);
    if (res['success'] == true) {
      contactMasterRes(ContactMasterResponce.fromJson(res));
    }
    contactMasterList
        .addAll(contactMasterRes.value.ContactMasterList!.toList());
    isLoading(false);
  }
}
