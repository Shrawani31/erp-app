import 'package:erp_app/Pages/login_page_screen.dart';
import 'package:erp_app/controllers/UserController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AppContants.dart';
import 'MyFonts.dart';
import 'Pages/rounded_corner_button.dart';
import 'Routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: -10,
              right: -10,
              left: -10,
              child: Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/erp.png"),
                      fit: BoxFit.cover),
                ),

              ),
            ),
            Positioned.fill(
              left: -5,
              right: -5,
              bottom: 0,
              top: MediaQuery.of(context).size.height/3.6,
              child: const Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 40),
                  child: LoginPageScreen(),
                ),
                ),

            ),
          ],
        ),








    );

  }
}
