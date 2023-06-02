import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../AppContants.dart';
import '../MyFonts.dart';
import '../Routes.dart';
import '../components/button_loading_view.dart';
import '../utils/MyThemes.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {

  set _onEditing(bool _onEditing) {}

  set _code(bool _code) {}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Center(
                  child: SvgPicture.asset("assets/images/otp.svg")),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(AppConstants.OTP_VERIFICATION,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child:
                SvgPicture.asset("assets/images/green_divider.svg"),
              ),
              Padding(
              padding: const EdgeInsets.all(25.0),
                    child: RichText(
                      text: TextSpan(
                      text: AppConstants.OTP_MSG,
                      style: MyFonts.customTheme(
                      Colors.black, FontWeight.w400, 15),),
                    ),
              ),
              RichText(
                text: TextSpan(
                  text: AppConstants.NUMBER,
                  style: MyFonts.customTheme(
                      Colors.black, FontWeight.w400, 15),),
              ),
              SizedBox(
                height: 5,
              ),

              VerificationCode(
                fullBorder: true,
                textStyle: TextStyle(
                    fontSize: 20.0,  color: Colors.black),
                keyboardType: TextInputType.number,
                underlineColor: Colors.black,
                length: 4,
                cursorColor: Colors.black,


                clearAll: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '00:46',
                    style: TextStyle(fontSize: 16,  color: Colors.green),
                  ),
                ),
                onCompleted: (String value) {
                  setState(() {
                    _code = value as bool;
                  });
                }, onEditing: (bool value) {
                setState(() {
                  _onEditing = value;
                  });

                },
              ),


              SizedBox(
                height: 90,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: CustomLoadingButton(
                    isLoading: false, title: "Verify", onPress: () {
                  Get..toNamed(MyRoutes.Dashboardroute);
                }
                ),
              ),





            ],
        ),
      ),
    );

  }
}


