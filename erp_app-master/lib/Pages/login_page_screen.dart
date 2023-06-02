import 'dart:convert';

import 'package:erp_app/AppContants.dart';
import 'package:erp_app/Pages/verification_page.dart';
import 'package:erp_app/utils/shared_pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../MyFonts.dart';
import '../Routes.dart';
import '../components/CustomPasswordTextField.dart';
import '../components/CustomTextField.dart';
import '../components/button_loading_view.dart';
import '../components/custom_button_with_icon.dart';
import '../controllers/UserController.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPagerState();
}

class _LoginPagerState extends State<LoginPageScreen> {
  UserController userController =
      Get.isRegistered() ? Get.find() : Get.put(UserController());

  final regExp = RegExp(
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$");

  //check valid username
  String? _validateUsername(String? value) {
    if ( value!.isEmpty ) {
      // If the text field is empty, return an error message
      return 'Enter valid username';
    }

    else {
      // If the text field is not empty, return null
      return null;
    }
  }

  String? _validateClientCode(String? value) {
    if ( value!.isEmpty ) {
      // If the text field is empty, return an error message
      return 'Enter valid client code';
    }
    else {
      // If the text field is not empty, return null
      return null;
    }
  }
  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      // If the text field is empty, return an error message
      return 'Enter valid password';
    }

    else {
      // If the text field is not empty, return null
      return null;
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool isRememberMe = false;

  TextEditingController user = TextEditingController();
  TextEditingController client = TextEditingController();
  TextEditingController password = TextEditingController();

  final userdata = GetStorage();
  @override
  void initState() {
    userController.clientController.text = SharedPrefUtils.getData(AppConstants.SP_CLIENTCODE_KEY)??"";
    userController.MobileController.text = SharedPrefUtils.getData(AppConstants.SP_USERNAME_KEY)??"";
    userController.passwordController.text = SharedPrefUtils.getData(AppConstants.SP_PASSWORD_KEY)??"";
    super.initState();
    // isRememberMe = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,

        body:
        SingleChildScrollView(
              reverse: true,
              child: Column(
                  children: [
                    Center(
                        child: SvgPicture.asset("assets/images/login_icon.svg")),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(AppConstants.LOGIN,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 20),
                          child: Text("To Continue TechoDesk App"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 20),
                          child:
                              SvgPicture.asset("assets/images/green_divider.svg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                    hint: "Username",
                                    controller: user,
                                    validator: _validateUsername,
                                    svgIcon: "assets/images/ic_mobile.svg",
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    textEditingController: userController.MobileController),

                                const SizedBox(height: 15),

                                CustomTextField(
                                  hint: "Client Code",
                                  controller: client,
                                  //prefixIcon: Icons.person,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  validator: _validateClientCode,
                                  textEditingController:
                                      userController.clientController,
                                  svgIcon: 'assets/images/person.svg',
                                ),

                                const SizedBox(height: 15),
                                Obx(
                                  () => userController.userVerificationRes.value
                                              ?.success ==
                                          true
                                      ? CustomPasswordTextField(
                                          hint: "Password",
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: true,
                                    validator: _validatePassword,
                                    textEditingController:
                                              userController.passwordController,
                                        )
                                      : SizedBox.shrink(),
                                ),


                                SizedBox(
                                    child: Row(children:[
                                      Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor: Colors.green),
                                        child: Checkbox(
                                          value: isRememberMe,
                                          checkColor: Colors.white,
                                          activeColor: Colors.black,
                                          onChanged: (value) {

                                            setState(() {
                                              isRememberMe = !isRememberMe;
                                              //isRememberMe = value ?? false;
                                            });
                                          //  userdata.write('isRememberMe', isRememberMe);
                                          },
                                        ),
                                      ),
                                      const Text(
                                        "Remember me",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      )
                                    ])),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () =>
                                      Get..toNamed(MyRoutes.ForgotPasswordroute),
                                  child: const Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "     Forgot Password ?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 15),
                                CustomLoadingButton(
                                    isLoading: userController.isLoading.value,
                                    title: AppConstants.LOGIN,

                                    onPress: () {


                                      if (_formKey.currentState!.validate()) {
                                        if (userController.userVerificationRes.value?.success == true) {
                                          SharedPrefUtils.setData(AppConstants.SP_USERNAME_KEY, userController.MobileController.text);
                                          SharedPrefUtils.setData(AppConstants.SP_CLIENTCODE_KEY, userController.clientController.text);
                                          SharedPrefUtils.setData(AppConstants.SP_PASSWORD_KEY, userController.passwordController.text);
                                          userController.authenticateuser();
                                          userdata.write('isRememberMe', true);
                                          userdata.write('user',  userController.MobileController.text);
                                          userdata.write('client',  userController.clientController.text);
                                          userdata.write('password', userController.passwordController.text );
                                        } else {
                                          userController.getUserVerificationBy();

                                        }
                                      }
                                    }),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ),


    );
  }


}
