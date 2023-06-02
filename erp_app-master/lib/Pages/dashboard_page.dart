
// import 'package:erp_app/Pages/login_page_screen.dart';
import 'package:erp_app/controllers/DashboardController.dart';
import 'package:erp_app/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Routes.dart';
import '../components/button_loading_view.dart';
import 'drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController _dashboardController =
  Get.put(DashboardController());

  String? _selectedMenu;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashboardController.getallappmenubyroleid();
  }

  void navigateTo(String? menuName) {
    setState(() {
      // Update the selected menu
      _selectedMenu = menuName;
    });

    if (menuName == 'Account Master') {
      Get..toNamed(MyRoutes.AccountMasterroute);
    }
    if (menuName == 'Contact Master') {
      Get..toNamed(MyRoutes.ContactMasterroute);
    }

    if (menuName == 'Change Password') {
      Get..toNamed(MyRoutes.ChangePasswordroute);
    }

    if (menuName == 'Outstanding') {
      Get..toNamed(MyRoutes.Outstandingroute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Dashboard"),
        ),
        drawer: DashboardDrawer(),
        body: Obx(() => _dashboardController.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          itemCount: _dashboardController
              .dashboardRes.value.DashboardList!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of columns in the grid
            mainAxisSpacing: 5, // spacing between each row
            crossAxisSpacing: 5, // spacing between each column
            childAspectRatio:
            1.5, // ratio of width to height for each item
          ),
          itemBuilder: (context, index) {
            // builder function that creates each item in the grid
            return InkWell(
              onTap: () {
                navigateTo(_dashboardController
                    .dashboardRes.value.DashboardList?[index].menuName);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      child: Center(
                          child: Image.network(
                              "${_dashboardController.dashboardRes.value.DashboardList?[index].iconUrl}")),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "${_dashboardController.dashboardRes.value.DashboardList?[index].menuName}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}