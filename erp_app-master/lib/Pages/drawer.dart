import 'dart:convert';

import 'package:erp_app/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:erp_app/utils/shared_pref_utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:provider/provider.dart';

import '../controllers/DashboardController.dart';
import '../model/authenticateuserResponce.dart';
import 'dashboard_page.dart';
import 'login_page_screen.dart';

class DashboardDrawer extends StatefulWidget {
  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  // Call the syncClock() function on tap
  final DashboardController _dashboardController =
      Get.put(DashboardController());
  String? _selectedMenu;
  String _selectedValue = 'Option 1';
  final userdata = GetStorage();
  late AuthenticateuserResponce user;

  void navigateTo(String? menuName) {
    setState(() {
      // Update the selected menu
      _selectedMenu = menuName;
    });
    if (menuName == 'Contact Master') {
      Get.toNamed(MyRoutes.ContactMasterroute);
    }

    if (menuName == 'Change Password') {
      Get.toNamed(MyRoutes.ChangePasswordroute);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Imageurl =
        "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg";

    return Drawer(
        child: ListView.builder(
            itemCount:
                _dashboardController.dashboardRes.value.DashboardList!.length +
                    1,
            // number of items in the list
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              final reversedIndex = _dashboardController
                      .dashboardRes.value.DashboardList!.length -
                  7 +
                  index;
              switch (index) {
                case 0:
                  return DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xFF00897B),),
                    child: Container(
                      color: Colors.black,
                      child: Stack(
                        children: [
                          UserAccountsDrawerHeader(
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(color: Color(0xFF00897B),),
                            currentAccountPicture: CircleAvatar(
                              backgroundImage: NetworkImage(Imageurl),
                            ),
                            accountName: Text(""),
                            accountEmail: Text(
                              "${userdata.read('username')}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                case 1:
                  //  ${DateFormat.yMd().add_Hms().format(DateTime.parse(userdata.read('lastSyncTime')))}
                  return ListTile(
                    title: Text(
                        'Sync  ${userdata.read('lastSyncTime').toString()}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    // title: Text('Sync ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    leading: Icon(Icons.sync),
                    onTap: () {
                      syncClock(); // Call the syncClock() function on tap
                    },
                  );
                case 2:
                  return InkWell(
                    onTap: () {
                      navigateTo(_dashboardController.dashboardRes.value
                          .DashboardList?[reversedIndex].menuName);
                    },
                    child: ListTile(
                      title: Text(
                        "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].menuName}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      leading: CircleAvatar(
                        child: Center(
                            child: Image.network(
                                "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].iconUrl}")),
                      ),
                    ),
                  );
                case 3:
                  return InkWell(
                    onTap: () {
                      navigateTo(_dashboardController.dashboardRes.value
                          .DashboardList?[reversedIndex].menuName);
                    },
                    child: ListTile(
                      title: Text(
                        "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].menuName}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      leading: CircleAvatar(
                        child: Center(
                            child: Image.network(
                                "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].iconUrl}")),
                      ),
                    ),
                  );
                case 4:
                  return InkWell(
                    onTap: () {
                      navigateTo(_dashboardController.dashboardRes.value
                          .DashboardList?[reversedIndex].menuName);
                    },
                    child: ListTile(
                      title: Text(
                        "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].menuName}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      leading: CircleAvatar(
                        child: Center(
                            child: Image.network(
                                "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].iconUrl}")),
                      ),
                    ),
                  );
                case 5:
                  return InkWell(
                    onTap: () {
                      navigateTo(_dashboardController.dashboardRes.value
                          .DashboardList?[reversedIndex].menuName);
                    },
                    child: ListTile(
                      title: Text(
                        "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].menuName}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      leading: CircleAvatar(
                        child: Center(
                            child: Image.network(
                                "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].iconUrl}")),
                      ),
                    ),
                  );
                case 6:
                  return InkWell(
                    onTap: () {
                      navigateTo(_dashboardController.dashboardRes.value
                          .DashboardList?[reversedIndex].menuName);
                    },
                    child: ListTile(
                      title: Text(
                        "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].menuName}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      leading: CircleAvatar(
                        child: Center(
                            child: Image.network(
                                "${_dashboardController.dashboardRes.value.DashboardList?[reversedIndex].iconUrl}")),
                      ),
                    ),
                  );
                case 7:
                  return ListTile(
                    title: Text(
                      'Reports & Insights ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    leading: Icon(Icons.insights),
                    onTap: () {
                      // do something when the item is tapped
                    },
                  );
                case 8:
                  return ExpansionTile(
                      iconColor: Colors.green,
                      leading: Icon(
                        Icons.note_sharp,
                        color: Colors.green,
                      ),
                      title: Text(
                        "Sales & Delivery",
                        style: TextStyle(color: Colors.green),
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            'sales order',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(Icons.note_sharp),
                          onTap: () {
                            // do something when the item is tapped
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Delivery Chain',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(Icons.currency_rupee),
                          onTap: () {
                            // do something when the item is tapped
                          },
                        ),
                        ListTile(
                          title: Text(
                            ' Tax Invoice',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(Icons.sticky_note_2),
                          onTap: () {
                            // do something when the item is tapped
                          },
                        ),
                        ListTile(
                          title: Text(
                            ' Sales Return ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(Icons.event_note),
                          onTap: () {
                            // do something when the item is tapped
                          },
                        ),
                      ]);
                case 9:
                  return ExpansionTile(
                      iconColor: Colors.green,
                      leading: Icon(
                        Icons.shopping_cart,
                        color: Colors.green,
                      ),
                      title: Text(
                        "Purchase & Inwards",
                        style: TextStyle(color: Colors.green),
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            'Purchase Order',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(Icons.note_sharp),
                          onTap: () {
                            // do something when the item is tapped
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Purchase Inwards',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(Icons.currency_rupee),
                          onTap: () {
                            // do something when the item is tapped
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Purchase Returns',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(Icons.sticky_note_2),
                          onTap: () {
                            // do something when the item is tapped
                          },
                        ),
                        ListTile(
                          title: Text(
                            ' Sales Return ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(Icons.event_note),
                          onTap: () {
                            // do something when the item is tapped
                          },
                        ),
                      ]);
                case 10:
                  return ListTile(
                    title: Text(
                      'Job Slips',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    leading: Icon(Icons.sticky_note_2),
                    onTap: () {
                      // do something when the item is tapped
                    },
                  );
                case 7:
                  return ListTile(
                    title: Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    leading: Icon(Icons.logout_outlined),
                    onTap: () {
                      userdata.write('isRememberMe', false);
                      userdata.remove('user');
                      userdata.remove('token');
                     SharedPrefUtils.clearData();

                      Get.offAllNamed(MyRoutes.Loginroute);
                    },

                  );
              }
            })
     /* ListView.builder(
          itemCount: _dashboardController.dashboardRes.value.DashboardList!.length,
          itemBuilder: (context, index) {
            return
              Column(
                children: [

                  InkWell(
                    onTap: () {
                      navigateTo(_dashboardController.dashboardRes.value
                          .DashboardList?[index].menuName);
                    },
                    child: ListTile(
                      title: Text(
                        "${_dashboardController.dashboardRes.value.DashboardList?[index].menuName}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      leading: CircleAvatar(
                        child: Center(
                            child: Image.network(
                                "${_dashboardController.dashboardRes.value.DashboardList?[index].iconUrl}")),
                      ),
                    ),
                  ),
                ],
              );
          },)*/
    );
  }

  Future<void> syncClock() async {
    // Get the current time from an NTP server
    DateTime currentTime = await NTP.now();

    // Set the device's clock to the current time
    String timezone = await FlutterNativeTimezone.getLocalTimezone();
    try {
      await SystemChannels.platform.invokeMethod('SystemClock', {
        'setTime': currentTime.millisecondsSinceEpoch,
        'timeZone': timezone
      });
    } catch (e) {
      print('Error setting clock: $e');
    }
  }
}
