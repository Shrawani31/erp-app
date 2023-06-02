import 'package:erp_app/components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/ContactMasterController.dart';
import '../utils/color_utils.dart';

class ContactMaster extends StatefulWidget {
  const ContactMaster({Key? key}) : super(key: key);

  @override
  State<ContactMaster> createState() => _ContactMasterState();
}

class _ContactMasterState extends State<ContactMaster> {
  final ContactMasterController _contactMasterController =
      Get.isRegistered() ? Get.find() : Get.put(ContactMasterController());
  final ScrollController _scrollController = ScrollController();

  var page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contactMasterController.getcontact();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        page++;
        _contactMasterController.pageNo.value = page.toString();
        _contactMasterController.getcontact();
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
                    child: Text('Contact Master',
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
        body: Obx(() => _contactMasterController.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                controller: _scrollController,
                itemCount:
                    _contactMasterController.contactMasterList.length ?? 0,
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
                                      "   Sr.No",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.green),
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
                                  "   ${_contactMasterController.contactMasterList?[index].name}",
                                  style: TextStyle(fontSize: 13),
                                ),

                                SizedBox(
                                  height: 8,
                                ),

                                //  Text("${_contactMasterController.contactMasterRes.value.value?[index].contactDetail}",style: TextStyle(fontSize: 15),),
                                Html(
                                  data:
                                      "${_contactMasterController.contactMasterList?[index].contactDetail}",
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize(13.0),
                                    ),
                                  },
                                ),
                                SizedBox(
                                  height: 8,
                                ),

                                Text(
                                  "   ${_contactMasterController.contactMasterList?[index].email}",
                                  style: TextStyle(fontSize: 15),
                                ),

                                SizedBox(
                                  height: 8,
                                ),

                                Text(
                                  "   ${_contactMasterController.contactMasterList?[index].phone}",
                                  style: TextStyle(fontSize: 15),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                SvgPicture.asset("assets/images/full_line.svg"),
                                SizedBox(
                                  height: 8,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () => launch(
                                              "tel:${_contactMasterController.contactMasterList?[index].mobile}"),
                                          child: SvgPicture.asset(
                                              "assets/images/phone_icone.svg"),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                            onTap: () => launch(
                                                "tel:${_contactMasterController.contactMasterList?[index].mobile}"),
                                            child: Text(
                                                "${_contactMasterController.contactMasterList?[index].mobile}")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/dot_icon.svg"),
                                        SvgPicture.asset(
                                            "assets/images/active.svg"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )));
  }

  void launchPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
