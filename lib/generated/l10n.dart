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

  String get view_more {
    return Intl.message(
      'Xem thêm',
      name: 'view_more',
      desc: '',
      args: [],
    );
  }

  String get all {
    return Intl.message(
      'Tất cả',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  String get category {
    return Intl.message(
      'Danh mục',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  String get happening {
    return Intl.message(
      'Đang diễn ra',
      name: 'happening',
      desc: '',
      args: [],
    );
  }

  String get happened {
    return Intl.message(
      'Sắp diễn ra',
      name: 'happened',
      desc: '',
      args: [],
    );
  }

  String sold_count(dynamic sold, dynamic total) {
    return Intl.message(
      'Đã bán $sold/$total',
      name: 'sold_count',
      desc: '',
      args: [sold, total],
    );
  }

  String get joinDate {
    return Intl.message(
      'Tham gia từ',
      name: 'joinDate',
      desc: '',
      args: [],
    );
  }

  String get category_product {
    return Intl.message(
      'Danh mục sản phẩm',
      name: 'category_product',
      desc: '',
      args: [],
    );
  }

  String get product_detail {
    return Intl.message(
      'Chi tiết sản phẩm',
      name: 'product_detail',
      desc: '',
      args: [],
    );
  }

  String get favorite {
    return Intl.message(
      'Yêu thích',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  String get product_existing {
    return Intl.message(
      'Còn hàng',
      name: 'product_existing',
      desc: '',
      args: [],
    );
  }

  String get detail_info {
    return Intl.message(
      'Thông tin chi tiết',
      name: 'detail_info',
      desc: '',
      args: [],
    );
  }

  String get sku_code {
    return Intl.message(
      'Mã SKU',
      name: 'sku_code',
      desc: '',
      args: [],
    );
  }

  String get brand {
    return Intl.message(
      'Thương hiệu',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  String get origin {
    return Intl.message(
      'Xuất xứ',
      name: 'origin',
      desc: '',
      args: [],
    );
  }

  String get size {
    return Intl.message(
      'Kích thước',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  String get customer_target {
    return Intl.message(
      'Đối tượng sử dụng',
      name: 'customer_target',
      desc: '',
      args: [],
    );
  }

  String get product_description {
    return Intl.message(
      'Mô tả sản phẩm',
      name: 'product_description',
      desc: '',
      args: [],
    );
  }

  String get same_product {
    return Intl.message(
      'Sản phẩm tương tự',
      name: 'same_product',
      desc: '',
      args: [],
    );
  }

  String get buy_now {
    return Intl.message(
      'Mua ngay',
      name: 'buy_now',
      desc: '',
      args: [],
    );
  }

  String get add_to_cart {
    return Intl.message(
      'Thêm vào giỏ hàng',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  String get send_report {
    return Intl.message(
      'Gửi thông báo',
      name: 'send_report',
      desc: '',
      args: [],
    );
  }

  String get report_desc {
    return Intl.message(
      'Báo cáo hay góp ý với chúng rôi về hình ảnh hay thông tin về sản phẩm nhé!',
      name: 'report_desc',
      desc: '',
      args: [],
    );
  }

  String get report_title {
    return Intl.message(
      'Tiêu đề báo cáo',
      name: 'report_title',
      desc: '',
      args: [],
    );
  }

  String get choose_other {
    return Intl.message(
      'Chọn khác',
      name: 'choose_other',
      desc: '',
      args: [],
    );
  }

  String get report_title_hint {
    return Intl.message(
      'Nhập tiêu đề tự chọn',
      name: 'report_title_hint',
      desc: '',
      args: [],
    );
  }

  String get report_content_hint {
    return Intl.message(
      'Viết nội dung báo cáo/ góp ý của bạn',
      name: 'report_content_hint',
      desc: '',
      args: [],
    );
  }

  String get send {
    return Intl.message(
      'Gửi',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  String get product_count {
    return Intl.message(
      'Số lượng:',
      name: 'product_count',
      desc: '',
      args: [],
    );
  }

  String get color {
    return Intl.message(
      'Màu sắc',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  String get hot_key {
    return Intl.message(
      'Từ khóa HOT',
      name: 'hot_key',
      desc: '',
      args: [],
    );
  }

  String get search_key_history {
    return Intl.message(
      'Lịch sử tìm kiếm',
      name: 'search_key_history',
      desc: '',
      args: [],
    );
  }

  String get delete {
    return Intl.message(
      'Xóa',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  String get search_by_name {
    return Intl.message(
      'Tìm kiếm theo tên sản phẩm',
      name: 'search_by_name',
      desc: '',
      args: [],
    );
  }

  String get search_by_content {
    return Intl.message(
      'Tìm kiếm theo nội dung sản phẩm',
      name: 'search_by_content',
      desc: '',
      args: [],
    );
  }

  String get distributor_name {
    return Intl.message(
      'nhà cung cấp ',
      name: 'distributor_name',
      desc: '',
      args: [],
    );
  }

  String get note_for_product_promo {
    return Intl.message(
      'Ghi chú khuyến mại của sản phẩm',
      name: 'note_for_product_promo',
      desc: '',
      args: [],
    );
  }

  String get type_promo_code {
    return Intl.message(
      'Nhập mã giảm giá',
      name: 'type_promo_code',
      desc: '',
      args: [],
    );
  }

  String get apply {
    return Intl.message(
      'Áp dụng',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  String get promo_code {
    return Intl.message(
      'Mã giảm giá',
      name: 'promo_code',
      desc: '',
      args: [],
    );
  }

  String get pre_count {
    return Intl.message(
      'Tạm tính',
      name: 'pre_count',
      desc: '',
      args: [],
    );
  }

  String get take_order {
    return Intl.message(
      'Tiến hành đặt hàng',
      name: 'take_order',
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