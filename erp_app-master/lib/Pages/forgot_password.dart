import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../AppContants.dart';
import '../MyFonts.dart';
import '../Routes.dart';
import '../components/CustomPasswordTextField.dart';
import '../components/button_loading_view.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var passController;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SvgPicture.asset("assets/images/forget_ic.svg",height: 150,),
            ),

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(AppConstants.FORGOT_PASSWORD,
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
              child: Text(
               AppConstants.FORGOT_MSG,
                  style: MyFonts.customTheme(
                      Colors.black, FontWeight.w400, 15),),

            ),
            SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPasswordTextField(
                    hint: "New Password",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    textEditingController: passController,
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Text(AppConstants.FORGOT_MSG_TEXT),
                  SizedBox(
                    height: 10,
                  ),
                  CustomPasswordTextField(
                    hint: "Confirm Password",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    textEditingController: passController,
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Text(AppConstants.MSG_NAME),
                  SizedBox(
                    height: 20,
                  ),


                  Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: CustomLoadingButton(
                        isLoading: false, title: "Reset Password", onPress: () {
                      Get..toNamed(MyRoutes.ChangePasswordroute);
                    }
                    ),
                  ),


                ],
              ),
            )




          ],
        ),
      ),
    );
  }
}
