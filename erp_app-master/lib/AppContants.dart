import 'package:get_storage/get_storage.dart';

class AppConstants {
  static String GET_STARTED = "Get started";
  static String ALREADY_LOGINED = "Already have an account? ";
  static String LOGIN = " Log in";
  static String BY_CONTINUE = "By Continuing you accept the ";
  static String TERMS_OF_USE = "Term of Use";
  static var CONTINUE_AS_GUEST = "Continue as a Guest";
  static var DONT_HAVE_AN_AACCOUNT = "Dont't Have an Account?";
  static var CREAT_NEW_ACCOUTN = "Create new account";
  static var OTP_VERIFICATION = "OTP Verification";
  static var OTP_MSG =
      "A one time password (OTP) has been sent your mobile number";
  static var NUMBER = "+919876****20";
  static var FORGOT_PASSWORD = "Forgot Password";
  static var CHANGE_PASSWORD = "Change Password";
  static var FORGOT_MSG =
      "Your new password must be different from previous used password";
  static var FORGOT_MSG_TEXT = "must be atlist 8 characters";
  static var MSG_NAME = "both passwords must match";
  static var baseUrl = "http://ttms.turboinfotech.com/api/";

  //shared pref constants

  static var SP_USERNAME_KEY = "usernameKey";
  static var SP_CLIENTCODE_KEY = "clientCodeKey";
  static var SP_PASSWORD_KEY = "passwordKey";
}
