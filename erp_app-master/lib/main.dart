import 'package:erp_app/Pages/dashboard_page.dart';
import 'package:erp_app/Pages/forgot_password.dart';
import 'package:erp_app/Pages/verification_page.dart';
import 'package:erp_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/AppStartScreen.dart';
import 'Pages/Splash_Screen.dart';
import 'Pages/account_master_page.dart';
import 'Pages/contact_master_page.dart';
import 'Pages/change_password.dart';
import 'Pages/outstanding_page.dart' as outpage;
import 'Pages/report_filter_page.dart';
import 'Routes.dart';

// import 'model/contactMasterResponce.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: GoogleFonts.lato().fontFamily,
        //primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      //initialRoute: MyRoutes.AppStartScreenroute,
      initialRoute: MyRoutes.SplashScreenroute,
      routes: {
        //  "/": (context) => AppStartScreen(),
        "/": (context) => SplashScreen(),
        MyRoutes.AppStartScreenroute: (context) => AppStartScreen(),
        MyRoutes.Loginroute: (context) => LoginPage(),
        MyRoutes.VerificationPageroute: (context) => VerificationPage(),
        MyRoutes.ForgotPasswordroute: (context) => ForgotPassword(),
        MyRoutes.ChangePasswordroute: (context) => ChangePassword(),
        MyRoutes.Dashboardroute: (context) => Dashboard(),
        MyRoutes.AccountMasterroute: (context) => AccountMaster(),
        MyRoutes.ContactMasterroute: (context) => ContactMaster(),
        MyRoutes.SplashScreenroute: (context) => SplashScreen(),
        MyRoutes.Outstandingroute: (context) => outpage.Outstanding(),
        MyRoutes.ReportFilterroute: (context) => ReportFilter(),



      },
    );
  }
}
