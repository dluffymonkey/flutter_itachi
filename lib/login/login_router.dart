import 'package:fluro/fluro.dart';
import 'package:flutter_itachi/login/page/login_page.dart';
import 'package:flutter_itachi/login/page/sms_login_page.dart';
import 'package:flutter_itachi/routers/i_router.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';
  static String registerPage = '/login/register';
  static String smsLoginPage = '/login/smsLogin';
  static String resetPasswordPage = '/login/resetPassword';
  static String updatePasswordPage = '/login/updatePassword';

  void initRouter(FluroRouter router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, __) => const LoginPage()));
    router.define(smsLoginPage, handler: Handler(handlerFunc: (_, __) => const SMSLoginPage()));
  }
}