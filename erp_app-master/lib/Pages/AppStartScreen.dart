import 'package:erp_app/AppContants.dart';
import 'package:erp_app/MyFonts.dart';
import 'package:erp_app/Pages/rounded_corner_button.dart';
import 'package:erp_app/model/UserVerificationResponce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Routes.dart';
import '../controllers/UserController.dart';
import '../login_page.dart';
import '../utils/shared_pref_utils.dart';
import 'corner_button.dart';

class AppStartScreen extends StatefulWidget {
  const AppStartScreen({Key? key}) : super(key: key);

  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {
  UserController userController =
  Get.isRegistered() ? Get.find() : Get.put(UserController());
  final box = GetStorage();

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: -5,
              left: -5,
              right: -5,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(30)),
                ),
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 25),
                    child: RoundedCornerButton(
                      name: AppConstants.GET_STARTED,
                      onPressed: () {
                        Get.toNamed(MyRoutes.Loginroute);
                      },
                    ),

                  ),
                ),
              ),
            ),
          ],
        ));
  }
}