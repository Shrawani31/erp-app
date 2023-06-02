
import 'package:erp_app/controllers/ReportFilterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';




class ReportFilter extends StatefulWidget {
  const ReportFilter({Key? key}) : super(key: key);

  @override
  State<ReportFilter> createState() => _ReportFilterState();
}

class _ReportFilterState extends State<ReportFilter> {
  final ReportFilterController _reportFilterController =
  Get.isRegistered() ? Get.find() : Get.put(ReportFilterController());
  final ScrollController _scrollController = ScrollController();
  var page = 1;
  List<bool> selectedList = [];
  String searchQuery = '';



  //List<bool> selectedList = List<bool>.generate(20, (index) => false); // Example list of boolean values to track selection

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reportFilterController.getreportfilter();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        page++;
        _reportFilterController.pageNo.value = page.toString();
        _reportFilterController.getreportfilter();
        setState(() {});
      }
    });
    ever(_reportFilterController.reportFilterList, (_) {
      selectedList = List<bool>.generate(
        _reportFilterController.reportFilterList.length,
            (index) => false,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              // Add your functionality here
            },
            child: Text(
              'DONE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF00897B),
        title: Text("Customer",style: TextStyle(color: Colors.white,),),
      ),
      body:
      Column(
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey ,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search"
                  ),
                ),
              ),
            ),
          ),
          Obx(() => _reportFilterController.isLoading.isTrue
            ? const Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
              color: Colors.black,
               ),
            ),
             ) : const Text("")
    ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1  ,
                  child: Obx(
                    () =>  ListView.builder(
                    controller: _scrollController,
                  //  itemCount: _reportFilterController.reportFilterList.length ?? 0,
                      itemCount: _reportFilterController.reportFilterList
                          .where((item) => item.name!.contains(searchQuery))
                          .length,
                      itemBuilder: (context, index) {
                        final filteredList = _reportFilterController.reportFilterList
                            .where((item) => item.name!.contains(searchQuery))
                            .toList();

                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 1),
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Checkbox(
                                activeColor: Color(0xFF00897B),
                                value: selectedList[index],

                                onChanged: (value) {
                                  setState(() {
                                    selectedList[index] = value ?? false;
                                  });
                                },
                              ),
                              title: Text("${filteredList[index].name}"),
                              subtitle: Text("${filteredList[index].line1}"),
                            ),
                          ),
                        );
                      },
                        /*Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey ,
                                    offset: Offset(0, 1),
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Checkbox(
                                  value: selectedList[index],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedList[index] = value ?? false;
                                    });
                                  },
                                ),
                                title: Text("${_reportFilterController.reportFilterList[index].name}"),
                                subtitle:  Text("${_reportFilterController.reportFilterList[index].line1}"),
                              ),
                            ),
                          );*/
                        ),
                  ),
                ),
              ),
            ),

        ],
      )
    );
  }
}
