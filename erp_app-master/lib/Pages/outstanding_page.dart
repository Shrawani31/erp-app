import 'package:erp_app/Routes.dart';
import 'package:erp_app/controllers/OutstandingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../model/OutstandingResponse.dart' as OutResp;

class Outstanding extends StatefulWidget {
  const Outstanding({Key? key}) : super(key: key);

  @override
  State<Outstanding> createState() => _OutstandingState();
}

class _OutstandingState extends State<Outstanding> {
  late int selectedItemIndex; // To keep track of the selected item index
  late List<bool> isImageVisible; // To keep track of image visibility
  OutResp.Outstanding? selectedReportObj;

  final OutstandingController _outstandingController =
  Get.isRegistered() ? Get.find() : Get.put(OutstandingController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _outstandingController.getreportbymenu();

    selectedReportObj = OutResp.Outstanding();
    selectedItemIndex = 0;
  }

  setSelectedReport(OutResp.Outstanding? reportObj) {
    setState(() {
      selectedReportObj = reportObj!;
    });
  }

  Widget build(BuildContext context) {
    String? gender;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00897B),
          titleSpacing: BorderSide.strokeAlignInside,
          title: Text(
            "Outstanding",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Obx(() => _outstandingController.isLoading.isTrue
                    ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : const Text("")),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5 + 20,
                  child: Obx(
                        () => ListView.builder(
                      controller: _scrollController,
                      itemCount: _outstandingController.outstandingList.length,
                      itemBuilder: (context, index) {
                        return RadioListTile<OutResp.Outstanding>(
                          value: _outstandingController.outstandingList[index],
                          groupValue: selectedReportObj,
                          title: Text(
                              "${_outstandingController.outstandingList[index].repName}"),
                          onChanged: (val) {
                            print("Radio Tile pressed $val");
                            setSelectedReport(val);
                          },
                          activeColor: Colors.black,
                          selected: false,
                        );
                      },
                    ),
                  ),
                ),
                if (selectedReportObj != null)
                  Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 55,
                                width: MediaQuery.of(context).size.width / 2 - 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 1.0),
                                ),
                                child: Center(
                                  child: TextField(
                                    controller: _outstandingController.fromDate,

                                    readOnly:
                                    true, // Prevents manual editing of the date
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Select From Date',
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    onTap: () {
                                      // Show a date picker and update the selected date
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2030),
                                      ).then((selectedDate) {
                                        if (selectedDate != null) {
                                          setState(() {
                                            selectedReportObj!.fromDate =
                                                DateFormat('dd-MMM-yyyy').format(
                                                    DateTime.parse(
                                                        selectedDate.toString()));
                                            _outstandingController.fromDate.text =
                                            selectedReportObj!.fromDate!;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 55,
                                width: MediaQuery.of(context).size.width / 2 - 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 1.0),
                                ),
                                child: Center(
                                  child: TextField(
                                    controller: _outstandingController.toDate,
                                    readOnly:
                                    true, // Prevents manual editing of the date
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Select To Date',
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    onTap: () {
                                      // Show a date picker and update the selected date
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2030),
                                      ).then((selectedDate) {
                                        if (selectedDate != null) {
                                          setState(() {
                                            selectedReportObj!.toDate =
                                                DateFormat('dd-MMM-yyyy').format(
                                                    DateTime.parse(
                                                        selectedDate.toString()));
                                            _outstandingController.toDate.text =
                                            selectedReportObj!.toDate!;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(MyRoutes.ReportFilterroute);
                                },
                                child: Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // shadow color
                                        spreadRadius: 0, // no spread
                                        blurRadius: 7, // how blurry the shadow is
                                        offset: Offset(0, 3), // vertical offset
                                      ),
                                    ], // border: Border.all(width: 2.0)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "CUSTOMER",
                                      style: TextStyle(
                                        color: Color(0xFF5D4037),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // shadow color
                                        spreadRadius: 0, // no spread
                                        blurRadius: 7, // how blurry the shadow is
                                        offset: Offset(0, 3), // vertical offset
                                      ),
                                    ], // border: Border.all(width: 2.0)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "SUPPLIER",
                                      style: TextStyle(
                                        color: Color(0xFF5D4037),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // shadow color
                                        spreadRadius: 0, // no spread
                                        blurRadius: 7, // how blurry the shadow is
                                        offset: Offset(0, 3), // vertical offset
                                      ),
                                    ], // border: Border.all(width: 2.0)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "COMPANY",
                                      style: TextStyle(
                                        color: Color(0xFF5D4037),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () async {
                                  if (selectedReportObj != null) {
                                    _outstandingController
                                        .getReportByID(selectedReportObj?.reportId!);
                                  }
                                },
                                child: Container(
                                  color: Color(0xFF00897B),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                      child: Text(
                                        "View Report",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
              ],
            )));
  }
}