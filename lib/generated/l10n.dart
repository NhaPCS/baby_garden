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

  String get search_hint {
    return Intl.message(
      'Bạn muốn tìm gì hôm nay?',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  String get myProfile {
    return Intl.message(
      'Trang cá nhân',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  String get accManage {
    return Intl.message(
      'Quản lý tài khoản',
      name: 'accManage',
      desc: '',
      args: [],
    );
  }

  String get pointManage {
    return Intl.message(
      'Quản lý điểm',
      name: 'pointManage',
      desc: '',
      args: [],
    );
  }

  String get remindManage {
    return Intl.message(
      'Quản lý lịch nhắc',
      name: 'remindManage',
      desc: '',
      args: [],
    );
  }

  String get voucherManage {
    return Intl.message(
      'Quản lý voucher',
      name: 'voucherManage',
      desc: '',
      args: [],
    );
  }

  String get favoriteProduct {
    return Intl.message(
      'Sản phẩm yêu thích',
      name: 'favoriteProduct',
      desc: '',
      args: [],
    );
  }

  String get favoritePatner {
    return Intl.message(
      'Đối tác yêu thích',
      name: 'favoritePatner',
      desc: '',
      args: [],
    );
  }

  String get seenProduct {
    return Intl.message(
      'Sản phẩm đã xem',
      name: 'seenProduct',
      desc: '',
      args: [],
    );
  }

  String get customerHelper {
    return Intl.message(
      'Hỗ trợ khách hàng',
      name: 'customerHelper',
      desc: '',
      args: [],
    );
  }

  String get setting {
    return Intl.message(
      'Cài đặt',
      name: 'setting',
      desc: '',
      args: [],
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