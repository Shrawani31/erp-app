  import 'package:erp_app/api/ApiEndPoint.dart';
  import 'package:get/get.dart';
  import 'package:get/get_connect/connect.dart';
  import 'package:get_storage/get_storage.dart';
  import 'package:http/http.dart' as http;

  import '../model/UserVerificationRequest.dart';
  import '../model/authenticateuserRequest.dart';

  class ApiProvider {
    final store = GetStorage();

    Future<dynamic> getUserVerificationBy(
        UserVerificationRequest userVerificationRequest) async {
      return await http.post(
          Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.GET_VERIFICATION_BY_USER),
          body: {
            "username": userVerificationRequest.username,
            "clientcode": userVerificationRequest.clientcode,
            "AFCM": userVerificationRequest.afcm
          });
    }

    Future<dynamic> authenticateuser(
        AuthenticateuserRequest authenticateuserRequest) async {
      return await http.post(
          Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.AUTHENTICATE_USER),
          body: {
            "username": authenticateuserRequest.username,
            "password": authenticateuserRequest.password,
            "ClientCode": authenticateuserRequest.clientCode,
            "AFCM": authenticateuserRequest.afcm,
            "ADeviceType": authenticateuserRequest.aDeviceType,
          });
    }

    Future<dynamic> accountListing(
        String pageNo, String rowPerPage, String pSearch, String token) async {
      Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
      return await http.post(
          Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.ACCOUNT_LISTING),
          body: {
            "p_PageNumber": pageNo,
            "p_RowsPerPage": rowPerPage,
            "p_Search": pSearch,
          },
          headers: requestHeaders);
    }

    Future<dynamic> getcontact(
        String pageNo, String rowPerPage, String pSearch, String token) async {
      Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
      return await http.post(
          Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.GET_CONTACT_MASTER),
          body: {
            "p_PageNumber": pageNo,
            "p_RowsPerPage": rowPerPage,
            "p_Search": pSearch,
          },
          headers: requestHeaders);
    }

    Future<dynamic> getallappmenubyroleid(String token) async {
      Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
      return await http.post(
          Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.GET_ALLMENU_BY_ROLE),
          headers: requestHeaders);
    }
    Future<dynamic> getreportbymenu(
        String menuName, String repMode,String token) async {
      Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
      return await http.post(
          Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.REPORT_BY_MENU),
          body: {
            "MenuName": menuName,
            "RepMode": repMode,
          },
          headers: requestHeaders);
    }
    Future<dynamic> getreportfilter(
        String pageNo, String rowPerPage, String pSearch, String pspname, String token) async {
      Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
      return await http.post(
        Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.REPORT_BY_FILTER),
        body: {
          "p_PageNumber": pageNo,
          "p_RowsPerPage": rowPerPage,
          "p_Search": pSearch,
          "p_SpName": pspname,
        },
        headers: requestHeaders);
    }


  // Future<dynamic> getWishlist(token) async {
    //   Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
    //   return await http.get(
    //       Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.GET_WISHLIST),
    //       headers: requestHeaders);
    // }

    // Future<dynamic> getCouponDetail(code, token) async {
    //   Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
    //   return await http.post(
    //       Uri.parse(ApiEndPoint.BASE_URL + ApiEndPoint.GET_COUPON),
    //       body: {"code": code},
    //       headers: requestHeaders);
    // }
  }



