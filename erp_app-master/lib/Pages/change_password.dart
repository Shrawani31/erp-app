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

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset("assets/images/change_password.svg",height: 150,),
            ),

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(AppConstants.CHANGE_PASSWORD,
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
                 hint: "Old Password",
                 keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textEditingController: passController,
              ),

               SizedBox(
                height: 20,
    ),
               CustomPasswordTextField(
               hint: "New Password",
               keyboardType: TextInputType.visiblePassword,
               obscureText: true,
               textEditingController: passController,
    ),

                SizedBox(
                  height: 20,
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
                        isLoading: false, title: "Submit", onPress: () {
                      Get..toNamed(MyRoutes.ChangePasswordroute);
                    }
                    ),
                  ),







    ],
        ),
    ),],
    ),
      ),    );
  }
}
