import 'package:erp_app/components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/AccountMasterController.dart';
import '../utils/color_utils.dart';

class AccountMaster extends StatefulWidget {
  const AccountMaster({Key? key}) : super(key: key);

  @override
  State<AccountMaster> createState() => _AccountMasterState();
}

class _AccountMasterState extends State<AccountMaster> {
  final AccountMasterController _accountMasterController =
      Get.isRegistered() ? Get.find() : Get.put(AccountMasterController());
  final ScrollController _scrollController = ScrollController();
  List<dynamic> item = [];
  var page = 1;
  // bool isLoadMore = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accountMasterController.accountListing();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        page++;
        _accountMasterController.pageNo.value = page.toString();
        _accountMasterController.accountListing();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          titleSpacing: BorderSide.strokeAlignInside,
          //pending
          title: const Text(
            'Back',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Container(
                child: const Center(
                    child: Text('Account Master',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold))),
              ),
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(80, 100),
                    backgroundColor: Colors.white,
                    // specify width, height
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      5,
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/images/person_green.svg"),
                    SvgPicture.asset("assets/images/Line_green.svg"),
                    SvgPicture.asset("assets/images/icon_add.svg"),
                  ],
                ),
              ),
            )),
          ],
        ),
        body: Obx(
          () => _accountMasterController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      _accountMasterController.accountMasterList.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Card(
                          child: Container(
                            color: ColorUtils.bgGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sr.No ${_accountMasterController.accountMasterList?[index].id}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.green),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/icon_edit.svg"),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/Line_green.svg"),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/edit.svg"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${_accountMasterController.accountMasterList?[index].name}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${_accountMasterController.accountMasterList?[index].city}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "525-25,Adarsh Market-1Ring Rode",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "${_accountMasterController.accountMasterList?[index].agentName}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SvgPicture.asset(
                                      "assets/images/full_line.svg"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /*SvgPicture.asset("assets/images/phone_icone.svg"),
                              Text("+91 9901494330"),*/

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () => launch(
                                                "tel:${_accountMasterController.accountMasterList?[index].mobileSms}"),
                                            child: SvgPicture.asset(
                                                "assets/images/phone_icone.svg"),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () => launch(
                                                "tel:${_accountMasterController.accountMasterList?[index].mobileSms}"),
                                            child: Text(
                                                "${_accountMasterController.accountMasterList?[index].mobileSms}"),
                                          ),
                                        ],
                                      ),
                                      /*ElevatedButton(
                                  onPressed: () => launchPhoneCall("_accountMasterController.accountMasterList?[index].mobileSms"),
                                  child: SvgPicture.asset("assets/images/phone_icon.svg"),
                                ),

                              Text("${_accountMasterController.accountMasterList?[index].mobileSms}"),
*/
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/dot_icon.svg"),
                                          SvgPicture.asset(
                                              "assets/images/active.svg"),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
        ));
  }
}

void launchPhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
