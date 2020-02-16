// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  String get home {
    return Intl.message(
      'Trang chủ',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  String get cart {
    return Intl.message(
      'Giỏ hàng',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  String get order {
    return Intl.message(
      'Đơn hàng',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  String get account {
    return Intl.message(
      'Tài khoản',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  String get welcome_title {
    return Intl.message(
      'Ứng dung mua sắm trực tuyến\nDành cho mẹ và bé',
      name: 'welcome_title',
      desc: '',
      args: [],
    );
  }

  String get app_name {
    return Intl.message(
      'Vöôøn Cuûa Beù',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  String get search_hint {
    return Intl.message(
      'Bạn muốn tìm gì hôm nay?',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  String get guide_title {
    return Intl.message(
      'Hướng dẫn sử dụng App',
      name: 'guide_title',
      desc: '',
      args: [],
    );
  }

  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  String get enter_phone_number {
    return Intl.message(
      'Nhập số điện thoại',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

  String get enter_password {
    return Intl.message(
      'Nhập mật khẩu',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  String get remember_password {
    return Intl.message(
      'Ghi nhớ mật khẩu',
      name: 'remember_password',
      desc: '',
      args: [],
    );
  }

  String get foget_pasword {
    return Intl.message(
      'Quên mật khẩu',
      name: 'foget_pasword',
      desc: '',
      args: [],
    );
  }

  String get dont_have_account {
    return Intl.message(
      'Bạn chưa có tài khoản?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  String get your_full_name {
    return Intl.message(
      'Họ tên của bạn',
      name: 'your_full_name',
      desc: '',
      args: [],
    );
  }

  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  String get reenter_password {
    return Intl.message(
      'Nhập lại mật khẩu',
      name: 'reenter_password',
      desc: '',
      args: [],
    );
  }

  String get enter_invite_phone_number {
    return Intl.message(
      'Nhập số điện thoại giới thiệu ',
      name: 'enter_invite_phone_number',
      desc: '',
      args: [],
    );
  }

  String get register {
    return Intl.message(
      ' Đăng ký ',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  String get return_login_if_had_account {
    return Intl.message(
      'Quay lại đăng nhập nếu đã có tài khoản',
      name: 'return_login_if_had_account',
      desc: '',
      args: [],
    );
  }

  String get return_login {
    return Intl.message(
      'Quay lại đăng nhập',
      name: 'return_login',
      desc: '',
      args: [],
    );
  }

  String get enter_otp {
    return Intl.message(
      'Nhập mã OTP',
      name: 'enter_otp',
      desc: '',
      args: [],
    );
  }

  String get resend_otp {
    return Intl.message(
      'Gửi lại mã xác thực',
      name: 'resend_otp',
      desc: '',
      args: [],
    );
  }

  String get otp_timer_out {
    return Intl.message(
      'Nếu bạn không đăng ký được, vui lòng gọi\nđiện tới số  0912 277 022 để được hỗ trợ',
      name: 'otp_timer_out',
      desc: '',
      args: [],
    );
  }

  String get finish {
    return Intl.message(
      'Hoàn thành',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  String get enter_new_password {
    return Intl.message(
      'Nhập mật khẩu mới',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  String get reenter_new_password {
    return Intl.message(
      'Nhập lại mật khẩu mới',
      name: 'reenter_new_password',
      desc: '',
      args: [],
    );
  }

  String get confirm {
    return Intl.message(
      'Xác nhận',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  String get change_password {
    return Intl.message(
      'Đổi mật khẩu',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  String get enter_old_password {
    return Intl.message(
      'Nhập mật khẩu cũ',
      name: 'enter_old_password',
      desc: '',
      args: [],
    );
  }

  String count_down_time(dynamic time) {
    return Intl.message(
      '(0:$time)',
      name: 'count_down_time',
      desc: '',
      args: [time],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}