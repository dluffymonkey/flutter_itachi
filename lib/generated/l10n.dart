// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Deer`
  String get title {
    return Intl.message(
      'Flutter Deer',
      name: 'title',
      desc: 'Title for the application',
      args: [],
    );
  }

  /// `Verification Code Login`
  String get verificationCodeLogin {
    return Intl.message(
      'Verification Code Login',
      name: 'verificationCodeLogin',
      desc: 'Title for the Login page',
      args: [],
    );
  }

  /// `Password Login`
  String get passwordLogin {
    return Intl.message(
      'Password Login',
      name: 'passwordLogin',
      desc: 'Password Login',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'Login',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordLink {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordLink',
      desc: 'Forgot Password',
      args: [],
    );
  }

  /// `Please enter the password`
  String get inputPasswordHint {
    return Intl.message(
      'Please enter the password',
      name: 'inputPasswordHint',
      desc: 'Please enter the password',
      args: [],
    );
  }

  /// `Please input username`
  String get inputUsernameHint {
    return Intl.message(
      'Please input username',
      name: 'inputUsernameHint',
      desc: 'Please input username',
      args: [],
    );
  }

  /// `No account yet? Register now`
  String get noAccountRegisterLink {
    return Intl.message(
      'No account yet? Register now',
      name: 'noAccountRegisterLink',
      desc: 'No account yet? Register now',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: 'Register',
      args: [],
    );
  }

  /// `Open your account`
  String get openYourAccount {
    return Intl.message(
      'Open your account',
      name: 'openYourAccount',
      desc: 'Open your account',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get inputPhoneHint {
    return Intl.message(
      'Please enter phone number',
      name: 'inputPhoneHint',
      desc: 'Please enter phone number',
      args: [],
    );
  }

  /// `Please enter verification code`
  String get inputVerificationCodeHint {
    return Intl.message(
      'Please enter verification code',
      name: 'inputVerificationCodeHint',
      desc: 'Please enter verification code',
      args: [],
    );
  }

  /// `Please input valid mobile phone number`
  String get inputPhoneInvalid {
    return Intl.message(
      'Please input valid mobile phone number',
      name: 'inputPhoneInvalid',
      desc: 'Please input valid mobile phone number',
      args: [],
    );
  }

  /// `Not really sent, just log in!`
  String get verificationButton {
    return Intl.message(
      'Not really sent, just log in!',
      name: 'verificationButton',
      desc: 'Not really sent, just log in!',
      args: [],
    );
  }

  /// `Get verification code`
  String get getVerificationCode {
    return Intl.message(
      'Get verification code',
      name: 'getVerificationCode',
      desc: 'Get verification code',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Reset Login Password`
  String get resetLoginPassword {
    return Intl.message(
      'Reset Login Password',
      name: 'resetLoginPassword',
      desc: 'Reset login password',
      args: [],
    );
  }

  /// `Unregistered mobile phone number, please `
  String get registeredTips {
    return Intl.message(
      'Unregistered mobile phone number, please ',
      name: 'registeredTips',
      desc: 'Registered Tips',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
