// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get app_name_title {
    return Intl.message(
      'VƯỜN CỦA BÉ',
      name: 'app_name_title',
      desc: '',
      args: [],
    );
  }

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
      'Ứng dụng mua sắm trực tuyến\nDành cho mẹ và bé',
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

  String get point_checkout {
    return Intl.message(
      'Thanh toán điểm',
      name: 'point_checkout',
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

  String count_down_time(Object time) {
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

  String get collapse {
    return Intl.message(
      'Thu gọn',
      name: 'collapse',
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

  String get pending {
    return Intl.message(
      'Sắp diễn ra',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  String sold_count(Object sold, Object total) {
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

  String get fullname {
    return Intl.message(
      'Họ và tên',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  String get birthday {
    return Intl.message(
      'Ngày sinh',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  String get gender {
    return Intl.message(
      'Giới tính',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  String get address {
    return Intl.message(
      'Địa chỉ',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  String get address_form {
    return Intl.message(
      'Địa chỉ: ',
      name: 'address_form',
      desc: '',
      args: [],
    );
  }

  String get mobilePhone {
    return Intl.message(
      'Số điện thoại',
      name: 'mobilePhone',
      desc: '',
      args: [],
    );
  }

  String get mobilePhone_form {
    return Intl.message(
      'Điện thoại: ',
      name: 'mobilePhone_form',
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

  String get service_type {
    return Intl.message(
      'Loại dịch vụ: ',
      name: 'service_type',
      desc: '',
      args: [],
    );
  }

  String get introduce {
    return Intl.message(
      'Giới thiệu: ',
      name: 'introduce',
      desc: '',
      args: [],
    );
  }

  String get partnerRegister {
    return Intl.message(
      'Đăng ký đối tác',
      name: 'partnerRegister',
      desc: '',
      args: [],
    );
  }

  String get partnerRegisHeadTitle {
    return Intl.message(
      'Nhập thông tin sau để trở thành đối tác của VCB nhé!',
      name: 'partnerRegisHeadTitle',
      desc: '',
      args: [],
    );
  }

  String get shopName {
    return Intl.message(
      'Tên Shop',
      name: 'shopName',
      desc: '',
      args: [],
    );
  }

  String get shopPlaceholder {
    return Intl.message(
      'Nhập tên shop của bạn',
      name: 'shopPlaceholder',
      desc: '',
      args: [],
    );
  }

  String get mobilePlaceholder {
    return Intl.message(
      'Nhập SĐT của bạn',
      name: 'mobilePlaceholder',
      desc: '',
      args: [],
    );
  }

  String get addressPlaceholder {
    return Intl.message(
      'Nhập địa chỉ của bạn',
      name: 'addressPlaceholder',
      desc: '',
      args: [],
    );
  }

  String get career {
    return Intl.message(
      'Ngành nghề',
      name: 'career',
      desc: '',
      args: [],
    );
  }

  String get careerPlaceholder {
    return Intl.message(
      'Nhập ngành nghề của bạn',
      name: 'careerPlaceholder',
      desc: '',
      args: [],
    );
  }

  String get changePassword {
    return Intl.message(
      'Đổi mật khẩu',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  String get childInfor {
    return Intl.message(
      'Thông tin con',
      name: 'childInfor',
      desc: '',
      args: [],
    );
  }

  String get addChild {
    return Intl.message(
      'Thêm con',
      name: 'addChild',
      desc: '',
      args: [],
    );
  }

  String get childName {
    return Intl.message(
      'Tên bé',
      name: 'childName',
      desc: '',
      args: [],
    );
  }

  String get healthIndex {
    return Intl.message(
      'Chỉ số sức khỏe',
      name: 'healthIndex',
      desc: '',
      args: [],
    );
  }

  String get lastDayCheck {
    return Intl.message(
      'Ngày đo gần nhất',
      name: 'lastDayCheck',
      desc: '',
      args: [],
    );
  }

  String get selectRemindProduct {
    return Intl.message(
      'Chọn sản phẩm nhắc',
      name: 'selectRemindProduct',
      desc: '',
      args: [],
    );
  }

  String get selectRemindBuyTime {
    return Intl.message(
      'Chọn thời gian nhắc lịch mua sản phẩm',
      name: 'selectRemindBuyTime',
      desc: '',
      args: [],
    );
  }

  String get moreDetail {
    return Intl.message(
      'Xem chi tiết',
      name: 'moreDetail',
      desc: '',
      args: [],
    );
  }

  String get setting_1 {
    return Intl.message(
      'Nhận thông báo các sản phẩm giờ vàng',
      name: 'setting_1',
      desc: '',
      args: [],
    );
  }

  String get setting_2 {
    return Intl.message(
      'Nhận thông báo thay đổi giá của sản phẩm yêu thích',
      name: 'setting_2',
      desc: '',
      args: [],
    );
  }

  String get setting_3 {
    return Intl.message(
      'Nhận thông báo lịch mua và lịch sử dung sản phẩm',
      name: 'setting_3',
      desc: '',
      args: [],
    );
  }

  String get setting_4 {
    return Intl.message(
      'Nhận thông báo từ VCB Express',
      name: 'setting_4',
      desc: '',
      args: [],
    );
  }

  String get customer_support {
    return Intl.message(
      'Hỗ trợ khách hàng',
      name: 'customer_support',
      desc: '',
      args: [],
    );
  }

  String get vcb_present {
    return Intl.message(
      'Giới thiệu về VCB',
      name: 'vcb_present',
      desc: '',
      args: [],
    );
  }

  String get vcb_contact {
    return Intl.message(
      'Thông tin liên hệ với VCB',
      name: 'vcb_contact',
      desc: '',
      args: [],
    );
  }

  String get buy_guide {
    return Intl.message(
      'Hướng dẫn mua hàng',
      name: 'buy_guide',
      desc: '',
      args: [],
    );
  }

  String get update_info_guide {
    return Intl.message(
      'Hướng dẫn cập nhật thông tin',
      name: 'update_info_guide',
      desc: '',
      args: [],
    );
  }

  String get policy {
    return Intl.message(
      'Chính sách hệ thống',
      name: 'policy',
      desc: '',
      args: [],
    );
  }

  String get vcb_register_partner {
    return Intl.message(
      'Đăng ký làm đối tác với VCB',
      name: 'vcb_register_partner',
      desc: '',
      args: [],
    );
  }

  String get notify {
    return Intl.message(
      'Thông báo',
      name: 'notify',
      desc: '',
      args: [],
    );
  }

  String get sale {
    return Intl.message(
      'Khuyến mãi',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  String get personal {
    return Intl.message(
      'Cá nhân',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  String get notify_hint_search {
    return Intl.message(
      'Nhập từ khóa tìm kiếm thông báo',
      name: 'notify_hint_search',
      desc: '',
      args: [],
    );
  }

  String get hide_readed_notify {
    return Intl.message(
      'Ẩn tin đã đọc',
      name: 'hide_readed_notify',
      desc: '',
      args: [],
    );
  }

  String send_by(Object author) {
    return Intl.message(
      'Gửi bởi: $author',
      name: 'send_by',
      desc: '',
      args: [author],
    );
  }

  String notice_time(Object time) {
    return Intl.message(
      'Thời gian: $time',
      name: 'notice_time',
      desc: '',
      args: [time],
    );
  }

  String get notify_title {
    return Intl.message(
      'Trả lời đánh giá đơn ',
      name: 'notify_title',
      desc: '',
      args: [],
    );
  }

  String get notify_booking_success {
    return Intl.message(
      'Chúc mừng quý khách đã đặt hàng thành công ',
      name: 'notify_booking_success',
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

  String get favorited {
    return Intl.message(
      'Đã thích',
      name: 'favorited',
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

  String get product_out_stock {
    return Intl.message(
      'Hết hàng',
      name: 'product_out_stock',
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

  String sku_code(Object code) {
    return Intl.message(
      'Mã SKU: $code',
      name: 'sku_code',
      desc: '',
      args: [code],
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

  String get expect_to_buy {
    return Intl.message(
      'Dự kiến mua',
      name: 'expect_to_buy',
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

  String get get_notify_when_stocking {
    return Intl.message(
      'Nhận thông báo khi có hàng',
      name: 'get_notify_when_stocking',
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

  String get rating_service {
    return Intl.message(
      'Đánh giá dịch vụ',
      name: 'rating_service',
      desc: '',
      args: [],
    );
  }

  String get rating_order {
    return Intl.message(
      'Đánh giá đơn hàng',
      name: 'rating_order',
      desc: '',
      args: [],
    );
  }

  String get waitting_rate {
    return Intl.message(
      'Chờ đánh giá',
      name: 'waitting_rate',
      desc: '',
      args: [],
    );
  }

  String get rated {
    return Intl.message(
      'Đã đánh giá',
      name: 'rated',
      desc: '',
      args: [],
    );
  }

  String order_code(Object code) {
    return Intl.message(
      'Mã đơn $code',
      name: 'order_code',
      desc: '',
      args: [code],
    );
  }

  String booking_code(Object code) {
    return Intl.message(
      'Mã đặt lịch $code',
      name: 'booking_code',
      desc: '',
      args: [code],
    );
  }

  String order_with_code(Object code) {
    return Intl.message(
      'Đơn hàng $code',
      name: 'order_with_code',
      desc: '',
      args: [code],
    );
  }

  String get supply_by {
    return Intl.message(
      'Cung cấp bởi: ',
      name: 'supply_by',
      desc: '',
      args: [],
    );
  }

  String supply_by_supplier(Object supplier) {
    return Intl.message(
      'Cung cấp bởi: $supplier',
      name: 'supply_by_supplier',
      desc: '',
      args: [supplier],
    );
  }

  String booking_date(Object time) {
    return Intl.message(
      'Ngày đặt lịch: $time',
      name: 'booking_date',
      desc: '',
      args: [time],
    );
  }

  String service_header(Object code, Object date_booking) {
    return Intl.message(
      'Mã đặt lịch: $code\nNgày đặt lịch: $date_booking',
      name: 'service_header',
      desc: '',
      args: [code, date_booking],
    );
  }

  String order_date(Object date) {
    return Intl.message(
      'Ngày đặt hàng: $date',
      name: 'order_date',
      desc: '',
      args: [date],
    );
  }

  String date_of_expiration_holding(Object date) {
    return Intl.message(
      'Ngày hết hạn giữ hàng: $date',
      name: 'date_of_expiration_holding',
      desc: '',
      args: [date],
    );
  }

  String overall_time(Object minute) {
    return Intl.message(
      'Thời gian thực hiện: $minute ',
      name: 'overall_time',
      desc: '',
      args: [minute],
    );
  }

  String order_detail(Object price, Object count) {
    return Intl.message(
      '$price x $count',
      name: 'order_detail',
      desc: '',
      args: [price, count],
    );
  }

  String order_count_summary(Object count) {
    return Intl.message(
      'Tổng $count sản phẩm',
      name: 'order_count_summary',
      desc: '',
      args: [count],
    );
  }

  String expiry_date(Object date) {
    return Intl.message(
      'Ngày sử dung: $date',
      name: 'expiry_date',
      desc: '',
      args: [date],
    );
  }

  String get invoice {
    return Intl.message(
      'Tổng đơn hàng: ',
      name: 'invoice',
      desc: '',
      args: [],
    );
  }

  String get see_more {
    return Intl.message(
      ' Xem thêm',
      name: 'see_more',
      desc: '',
      args: [],
    );
  }

  String order_rating(Object code) {
    return Intl.message(
      'Đánh giá đơn $code',
      name: 'order_rating',
      desc: '',
      args: [code],
    );
  }

  String receiving_date(Object date) {
    return Intl.message(
      'Ngày nhận hàng: $date',
      name: 'receiving_date',
      desc: '',
      args: [date],
    );
  }

  String get rating_hint {
    return Intl.message(
      'Viết chia sẻ của bạn về sản phẩm này',
      name: 'rating_hint',
      desc: '',
      args: [],
    );
  }

  String get add_image {
    return Intl.message(
      'Thêm hình ảnh',
      name: 'add_image',
      desc: '',
      args: [],
    );
  }

  String using_date(Object date, Object time) {
    return Intl.message(
      'Ngày sử dung: $date $time',
      name: 'using_date',
      desc: '',
      args: [date, time],
    );
  }

  String get send_rating {
    return Intl.message(
      'GỬI ĐÁNH GIÁ',
      name: 'send_rating',
      desc: '',
      args: [],
    );
  }

  String get canceled_service {
    return Intl.message(
      'Dịch vụ đã hủy',
      name: 'canceled_service',
      desc: '',
      args: [],
    );
  }

  String get skip {
    return Intl.message(
      'Bỏ qua >>',
      name: 'skip',
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

  String get my_order {
    return Intl.message(
      'Đơn hàng của tôi ',
      name: 'my_order',
      desc: '',
      args: [],
    );
  }

  String get waiting_payment {
    return Intl.message(
      'Chờ\nthanh toán',
      name: 'waiting_payment',
      desc: '',
      args: [],
    );
  }

  String get waiting_confirm {
    return Intl.message(
      'Chờ\nxác nhận',
      name: 'waiting_confirm',
      desc: '',
      args: [],
    );
  }

  String get get_at_shop {
    return Intl.message(
      'Nhận hàng\ntại Shop',
      name: 'get_at_shop',
      desc: '',
      args: [],
    );
  }

  String get packing {
    return Intl.message(
      'Đang\nđóng gói',
      name: 'packing',
      desc: '',
      args: [],
    );
  }

  String get transporting {
    return Intl.message(
      'Đang\nvận chuyển',
      name: 'transporting',
      desc: '',
      args: [],
    );
  }

  String get success_order {
    return Intl.message(
      'Đơn hàng\nthành công',
      name: 'success_order',
      desc: '',
      args: [],
    );
  }

  String get cancelled_order {
    return Intl.message(
      'Đơn hàng\nđã hủy',
      name: 'cancelled_order',
      desc: '',
      args: [],
    );
  }

  String get rate_order {
    return Intl.message(
      'Đánh giá\nđơn hàng',
      name: 'rate_order',
      desc: '',
      args: [],
    );
  }

  String get my_service {
    return Intl.message(
      'Dịch vụ của tôi',
      name: 'my_service',
      desc: '',
      args: [],
    );
  }

  String get booked {
    return Intl.message(
      'Đã\nđặt lịch',
      name: 'booked',
      desc: '',
      args: [],
    );
  }

  String get used {
    return Intl.message(
      'Đã\nsử dụng',
      name: 'used',
      desc: '',
      args: [],
    );
  }

  String get cancelled_book {
    return Intl.message(
      'Đã hủy\nđặt lịch',
      name: 'cancelled_book',
      desc: '',
      args: [],
    );
  }

  String get book {
    return Intl.message(
      'Đặt lịch',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  String get product {
    return Intl.message(
      'Sản phẩm',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  String get rate_service {
    return Intl.message(
      'Đánh giá\ndịch vụ',
      name: 'rate_service',
      desc: '',
      args: [],
    );
  }

  String get faq {
    return Intl.message(
      'Các câu hỏi thường gặp',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  String get how_to_order {
    return Intl.message(
      'Làm thế nào để đặt đơn hàng?',
      name: 'how_to_order',
      desc: '',
      args: [],
    );
  }

  String get how_to_know_where_my_order {
    return Intl.message(
      'Tôi phải làm sao để biết được đơn hàng đang ở đâu?',
      name: 'how_to_know_where_my_order',
      desc: '',
      args: [],
    );
  }

  String get how_to_cancel_order {
    return Intl.message(
      'Tôi muốn hủy đơn để đặt đơn khác thì làm thế nào?',
      name: 'how_to_cancel_order',
      desc: '',
      args: [],
    );
  }

  String get when_order_wrong {
    return Intl.message(
      'Khi nhận hàng không đúng với hàng tôi đặt?',
      name: 'when_order_wrong',
      desc: '',
      args: [],
    );
  }

  String get how_to_contact_with_shop {
    return Intl.message(
      'Làm thế nào để tôi có thể liên hệ với chủ Shop?',
      name: 'how_to_contact_with_shop',
      desc: '',
      args: [],
    );
  }

  String get provided_by {
    return Intl.message(
      'Cung cấp bởi: ',
      name: 'provided_by',
      desc: '',
      args: [],
    );
  }

  String get total_order_price {
    return Intl.message(
      'Tổng đơn: ',
      name: 'total_order_price',
      desc: '',
      args: [],
    );
  }

  String get express_title {
    return Intl.message(
      'Vườn của bé: Thời trang dành cho bé MFGM PRO\ntinh chất dinh dưỡng quý trong sữa năm 2019',
      name: 'express_title',
      desc: '',
      args: [],
    );
  }

  String get express_descrip {
    return Intl.message(
      'Thời trang cho bé',
      name: 'express_descrip',
      desc: '',
      args: [],
    );
  }

  String get express_short_content {
    return Intl.message(
      'MFGM là một màng cầu dinh dưỡng bao quanh giọt chất béo trong sữa tự nhiên, đóng vai trò quan trọng trong việc cải thiện chức năng nhận thức, khả năng miễn dịch và sức khỏe đường ruột của trẻ, là tinh chất rất A +.',
      name: 'express_short_content',
      desc: '',
      args: [],
    );
  }

  String get express_time {
    return Intl.message(
      '12/09/2019 - 14:00',
      name: 'express_time',
      desc: '',
      args: [],
    );
  }

  String get vcb_express {
    return Intl.message(
      'VCB Express',
      name: 'vcb_express',
      desc: '',
      args: [],
    );
  }

  String get vcb_ex_detail_short_title {
    return Intl.message(
      'Vườn của bé: Thời trang dành cho bé\n năm 2019',
      name: 'vcb_ex_detail_short_title',
      desc: '',
      args: [],
    );
  }

  String get vcb_ex_detail_full_title {
    return Intl.message(
      'Thời trang dành cho bé năm 2019 phong cách xuân hè.',
      name: 'vcb_ex_detail_full_title',
      desc: '',
      args: [],
    );
  }

  String get vcb_ex_detail_ctm_hint {
    return Intl.message(
      'Viết bình luận của bạn',
      name: 'vcb_ex_detail_ctm_hint',
      desc: '',
      args: [],
    );
  }

  String get vcb_can_not_comment {
    return Intl.message(
      'Bạn không thể bình luận cho bài viết này',
      name: 'vcb_can_not_comment',
      desc: '',
      args: [],
    );
  }

  String get vcb_ex_detail_first_content {
    return Intl.message(
      'Thời trang dành cho bé năm 2019 phong cách xuân hè.\nTôi luôn thích cái kết happy ending, những nhân vật chính và những người yêu nhau sẽ có cơ hội đến với nhau. \nNhưng tôi lại thấy đây là cái kết hoàn hảo cho phim vì một chút day dứt, lưu luyến sẽ để lại trong lòng người xem ấn tượng khó phai hơn.',
      name: 'vcb_ex_detail_first_content',
      desc: '',
      args: [],
    );
  }

  String get vcb_ex_detail_second_content {
    return Intl.message(
      'Thời trang dành cho bé năm 2019 phong cách xuân hè.\nTôi luôn thích cái kết happy ending, những nhân vật chính và những người yêu nhau sẽ có cơ hội đến với nhau. \nNhưng tôi lại thấy đây là cái kết hoàn hảo cho phim vì một chút day dứt, lưu luyến sẽ để lại trong lòng người xem ấn tượng khó phai hơn.',
      name: 'vcb_ex_detail_second_content',
      desc: '',
      args: [],
    );
  }

  String get saling_detail {
    return Intl.message(
      'Chi tiết khuyến mãi',
      name: 'saling_detail',
      desc: '',
      args: [],
    );
  }

  String saling_detail_title(Object title) {
    return Intl.message(
      '[BIG SAle] $title',
      name: 'saling_detail_title',
      desc: '',
      args: [title],
    );
  }

  String saling_detail_time(Object time) {
    return Intl.message(
      'Thời gian áp dung: $time',
      name: 'saling_detail_time',
      desc: '',
      args: [time],
    );
  }

  String get product_for_sale {
    return Intl.message(
      'Sản phẩm khuyến mãi',
      name: 'product_for_sale',
      desc: '',
      args: [],
    );
  }

  String get familier_partner {
    return Intl.message(
      'Đối tác yêu thích',
      name: 'familier_partner',
      desc: '',
      args: [],
    );
  }

  String get choose_client {
    return Intl.message(
      'Chọn cơ sở',
      name: 'choose_client',
      desc: '',
      args: [],
    );
  }

  String choose_service(Object number) {
    return Intl.message(
      'Chọn dịch vụ ($number dịch vụ)',
      name: 'choose_service',
      desc: '',
      args: [number],
    );
  }

  String service_time_range(Object minute) {
    return Intl.message(
      '$minute\nPhút',
      name: 'service_time_range',
      desc: '',
      args: [minute],
    );
  }

  String get press_back_again_to_exit {
    return Intl.message(
      'Nhấn 1 lần nữa để thoát ứng dụng!',
      name: 'press_back_again_to_exit',
      desc: '',
      args: [],
    );
  }

  String get partner {
    return Intl.message(
      'Đối tác',
      name: 'partner',
      desc: '',
      args: [],
    );
  }

  String get voucher {
    return Intl.message(
      'Voucher',
      name: 'voucher',
      desc: '',
      args: [],
    );
  }

  String get heath_number {
    return Intl.message(
      'Chỉ số\nsức khỏe',
      name: 'heath_number',
      desc: '',
      args: [],
    );
  }

  String get codeTakenVoucher {
    return Intl.message(
      'Đã lấy mã',
      name: 'codeTakenVoucher',
      desc: '',
      args: [],
    );
  }

  String get expireVoucher {
    return Intl.message(
      'Sắp hết hạn',
      name: 'expireVoucher',
      desc: '',
      args: [],
    );
  }

  String get usedVoucher {
    return Intl.message(
      'Đã sử dụng',
      name: 'usedVoucher',
      desc: '',
      args: [],
    );
  }

  String get expiredVoucher {
    return Intl.message(
      'Đã hết hạn',
      name: 'expiredVoucher',
      desc: '',
      args: [],
    );
  }

  String get pointHistoryHeadText {
    return Intl.message(
      'Lịch sử tích điểm và sử dụng điểm',
      name: 'pointHistoryHeadText',
      desc: '',
      args: [],
    );
  }

  String get addressAccount {
    return Intl.message(
      'Địa chỉ tài khoản',
      name: 'addressAccount',
      desc: '',
      args: [],
    );
  }

  String get addressSetting {
    return Intl.message(
      'Thiết lập địa chỉ',
      name: 'addressSetting',
      desc: '',
      args: [],
    );
  }

  String get defaultAddress {
    return Intl.message(
      'Địa chỉ giao hàng mặc định',
      name: 'defaultAddress',
      desc: '',
      args: [],
    );
  }

  String get myAddress {
    return Intl.message(
      'Địa chỉ của tôi',
      name: 'myAddress',
      desc: '',
      args: [],
    );
  }

  String get addAddress {
    return Intl.message(
      'Thêm địa chỉ của tôi',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  String get edit {
    return Intl.message(
      'Sửa',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  String get isDefault {
    return Intl.message(
      'Mặc định',
      name: 'isDefault',
      desc: '',
      args: [],
    );
  }

  String get addressDetail {
    return Intl.message(
      'Địa chỉ cụ thể',
      name: 'addressDetail',
      desc: '',
      args: [],
    );
  }

  String get addressDetailHint {
    return Intl.message(
      'Nhập số nhà, tên đường...',
      name: 'addressDetailHint',
      desc: '',
      args: [],
    );
  }

  String get list_user_rated {
    return Intl.message(
      'Danh sách người đánh giá',
      name: 'list_user_rated',
      desc: '',
      args: [],
    );
  }

  String get addNew {
    return Intl.message(
      'Thêm mới',
      name: 'addNew',
      desc: '',
      args: [],
    );
  }

  String get nameOfChild {
    return Intl.message(
      'Tên của bé',
      name: 'nameOfChild',
      desc: '',
      args: [],
    );
  }

  String get dateOfBirth {
    return Intl.message(
      'Ngày tháng năm sinh',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  String get comeBack {
    return Intl.message(
      'trở lại',
      name: 'comeBack',
      desc: '',
      args: [],
    );
  }

  String get uploadChildAvatar {
    return Intl.message(
      'Upload ảnh của bé',
      name: 'uploadChildAvatar',
      desc: '',
      args: [],
    );
  }

  String get booking_schedule_verify {
    return Intl.message(
      'Xác Nhận Đặt Lịch',
      name: 'booking_schedule_verify',
      desc: '',
      args: [],
    );
  }

  String get back {
    return Intl.message(
      'Quay lại',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  String get booking_schedule_success {
    return Intl.message(
      'Bạn Đã Đặt lịch thành công',
      name: 'booking_schedule_success',
      desc: '',
      args: [],
    );
  }

  String get choose_time {
    return Intl.message(
      'Chọn thời gian',
      name: 'choose_time',
      desc: '',
      args: [],
    );
  }

  String get booking {
    return Intl.message(
      'Đặt hàng',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  String get place_of_delivery {
    return Intl.message(
      'Địa chỉ nhận hàng',
      name: 'place_of_delivery',
      desc: '',
      args: [],
    );
  }

  String get type_of_delivery {
    return Intl.message(
      'Hình thức nhận hàng',
      name: 'type_of_delivery',
      desc: '',
      args: [],
    );
  }

  String get type_of_checkout {
    return Intl.message(
      'Hình thức thanh toán',
      name: 'type_of_checkout',
      desc: '',
      args: [],
    );
  }

  String get delivery_service {
    return Intl.message(
      'Đơn vị vận chuyển',
      name: 'delivery_service',
      desc: '',
      args: [],
    );
  }

  String delivery_service_header(Object delivery_unit) {
    return Intl.message(
      'Đơn vị vận chuyển: $delivery_unit',
      name: 'delivery_service_header',
      desc: '',
      args: [delivery_unit],
    );
  }

  String get enter_delivery_code {
    return Intl.message(
      'Nhập mã giảm giá vận chuyển',
      name: 'enter_delivery_code',
      desc: '',
      args: [],
    );
  }

  String get delivery_code {
    return Intl.message(
      'Mã giảm giá vận chuyển',
      name: 'delivery_code',
      desc: '',
      args: [],
    );
  }

  String get booking_note {
    return Intl.message(
      'Chi chú đặt hàng',
      name: 'booking_note',
      desc: '',
      args: [],
    );
  }

  String get enter_your_note {
    return Intl.message(
      'Viết ghi chú của bạn',
      name: 'enter_your_note',
      desc: '',
      args: [],
    );
  }

  String get cost {
    return Intl.message(
      'Tiền hàng (sau giảm giá)',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  String get delivery_fee {
    return Intl.message(
      'Phí vận chuyển (sau giảm giá)',
      name: 'delivery_fee',
      desc: '',
      args: [],
    );
  }

  String get total {
    return Intl.message(
      'Thành tiền',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  String get booking_submit {
    return Intl.message(
      'Hoàn tất đặt hàng',
      name: 'booking_submit',
      desc: '',
      args: [],
    );
  }

  String get change {
    return Intl.message(
      'Thay đổi',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  String get detail {
    return Intl.message(
      'Chi tiết',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  String get delivery_in_shop {
    return Intl.message(
      'Nhận hàng tại Shop',
      name: 'delivery_in_shop',
      desc: '',
      args: [],
    );
  }

  String get delivery_to_address {
    return Intl.message(
      'Giao hàng tận nơi',
      name: 'delivery_to_address',
      desc: '',
      args: [],
    );
  }

  String get cash_payment {
    return Intl.message(
      'Thanh toán tiền mặt khi nhận hàng',
      name: 'cash_payment',
      desc: '',
      args: [],
    );
  }

  String get credit_transfer_payment {
    return Intl.message(
      'Thanh toán chuyển khoản qua tài khoản',
      name: 'credit_transfer_payment',
      desc: '',
      args: [],
    );
  }

  String point_payment(Object point) {
    return Intl.message(
      'Thanh toán điểm hiện có [$point]',
      name: 'point_payment',
      desc: '',
      args: [point],
    );
  }

  String delivery_plan(Object day) {
    return Intl.message(
      'Dự kiến giao khoảng $day',
      name: 'delivery_plan',
      desc: '',
      args: [day],
    );
  }

  String get point_payment_title {
    return Intl.message(
      'Thanh toán điểm',
      name: 'point_payment_title',
      desc: '',
      args: [],
    );
  }

  String get current_point {
    return Intl.message(
      'Số điểm hiện tại: ',
      name: 'current_point',
      desc: '',
      args: [],
    );
  }

  String get point_for_booking {
    return Intl.message(
      'Số điểm thanh toán: ',
      name: 'point_for_booking',
      desc: '',
      args: [],
    );
  }

  String get point_payment_policy {
    return Intl.message(
      '* Tỷ lệ quy đổi tích điểm: 100.000 vnđ = 1 điểm\n* Mỗi 1 điểm đổi tương ứng với 1.000 vnđ\n* Số điểm có thể đổi phải chia hết cho 20.\nLưu ý: hóa đơn thanh toán bằng điểm sẽ không được\ntích điểm.',
      name: 'point_payment_policy',
      desc: '',
      args: [],
    );
  }

  String get point_payment_update {
    return Intl.message(
      'Cập Nhật Thanh toán điểm',
      name: 'point_payment_update',
      desc: '',
      args: [],
    );
  }

  String get updated {
    return Intl.message(
      'Đã cập nhật',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  String get update {
    return Intl.message(
      'Cập nhật',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  String get policy_privacy {
    return Intl.message(
      'Chính sách và điều khoản dịch vụ',
      name: 'policy_privacy',
      desc: '',
      args: [],
    );
  }

  String get overral_policy {
    return Intl.message(
      'Chính sách chung:',
      name: 'overral_policy',
      desc: '',
      args: [],
    );
  }

  String get policy_1 {
    return Intl.message(
      '- Chính sách bảo mật này nhằm mục đích giúp bạn\nhiểu rõ những thông tin chúng tôi thu thập, lý do\nchúng tôi thu thập và cách bạn có thể cập nhật, quản\nlý, xuất và xóa thông tin của mình.',
      name: 'policy_1',
      desc: '',
      args: [],
    );
  }

  String get privacy {
    return Intl.message(
      'Điều khoản dịch vụ của Shop:',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  String get privacy_1 {
    return Intl.message(
      '- Khi sử dụng dịch vụ của chúng tôi, bạn tin tưởng\ncung cấp thông tin của bạn cho chúng tôi. Chúng tôi\nhiểu rằng đây là một trách nhiệm lớn và chúng tôi nỗ\nlực bảo vệ thông tin của bạn cũng như để bạn nắm\nquyền kiểm soát.',
      name: 'privacy_1',
      desc: '',
      args: [],
    );
  }

  String get add_delivery_address {
    return Intl.message(
      'Thêm Địa chỉ nhận hàng',
      name: 'add_delivery_address',
      desc: '',
      args: [],
    );
  }

  String get add_receiver {
    return Intl.message(
      'Tên người nhận',
      name: 'add_receiver',
      desc: '',
      args: [],
    );
  }

  String get enter_receiver_name {
    return Intl.message(
      'Nhập họ và tên người nhận hàng',
      name: 'enter_receiver_name',
      desc: '',
      args: [],
    );
  }

  String get phone {
    return Intl.message(
      'Số điện thoại',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  String get enter_receive_phone {
    return Intl.message(
      'Nhập số điện thoại nhận hàng',
      name: 'enter_receive_phone',
      desc: '',
      args: [],
    );
  }

  String get delivery_address {
    return Intl.message(
      'Địa chỉ nhận hàng',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  String get enter_address {
    return Intl.message(
      'Nhập số nhà, tên đường...',
      name: 'enter_address',
      desc: '',
      args: [],
    );
  }

  String get receive_time {
    return Intl.message(
      'Thời gian nhận hàng',
      name: 'receive_time',
      desc: '',
      args: [],
    );
  }

  String get receive_in {
    return Intl.message(
      'Nhận hàng vào lúc: ',
      name: 'receive_in',
      desc: '',
      args: [],
    );
  }

  String get province {
    return Intl.message(
      'Tỉnh/ Thành Phố',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  String get choose_province {
    return Intl.message(
      'Chọn Tỉnh/ Thành phố',
      name: 'choose_province',
      desc: '',
      args: [],
    );
  }

  String get district {
    return Intl.message(
      'Quận/ Huyện',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  String get choose_district {
    return Intl.message(
      'Chọn Quận/ Huyện',
      name: 'choose_district',
      desc: '',
      args: [],
    );
  }

  String get sub_district {
    return Intl.message(
      'Phường/ Xã',
      name: 'sub_district',
      desc: '',
      args: [],
    );
  }

  String get choose_sub_district {
    return Intl.message(
      'Chọn Phường/ Xã',
      name: 'choose_sub_district',
      desc: '',
      args: [],
    );
  }

  String get set_delivery_address {
    return Intl.message(
      'Đặt làm địa chỉ nhận hàng mặc định',
      name: 'set_delivery_address',
      desc: '',
      args: [],
    );
  }

  String get add_new {
    return Intl.message(
      'Thêm mới',
      name: 'add_new',
      desc: '',
      args: [],
    );
  }

  String get credit_transfer {
    return Intl.message(
      'Thanh Toán Chuyển Khoản',
      name: 'credit_transfer',
      desc: '',
      args: [],
    );
  }

  String get delivery_in_place {
    return Intl.message(
      'Giao hàng tận nơi:',
      name: 'delivery_in_place',
      desc: '',
      args: [],
    );
  }

  String get checkout_notice {
    return Intl.message(
      'Bạn có thực sự muốn dừng thanh toán?',
      name: 'checkout_notice',
      desc: '',
      args: [],
    );
  }

  String get delivery_policy {
    return Intl.message(
      '- Khi nhận hàng bạn không cần thanh toán tiền mặt\nnữa\n- Nếu khách hàng ở tỉnh lẻ, thanh toán chuyển khoản\ntrước sẽ giảm được chi phí vận chuyển COD.',
      name: 'delivery_policy',
      desc: '',
      args: [],
    );
  }

  String get get_in_shop {
    return Intl.message(
      'Lấy hàng tại Shop:',
      name: 'get_in_shop',
      desc: '',
      args: [],
    );
  }

  String get checkout_policy {
    return Intl.message(
      '- Khi thanh toán chuyển khoản trước, khách hàng sẽ\nđược giữ hàng lâu hơn 3 ngày.\n',
      name: 'checkout_policy',
      desc: '',
      args: [],
    );
  }

  String get checkout_policy_overal {
    return Intl.message(
      'Khi bạn chọn hình thức thanh toán chuyển khoản, để\nhoàn tất đơn hàng bạn cần thanh toán chuyển khoản\nđể xác nhận đơn hàng',
      name: 'checkout_policy_overal',
      desc: '',
      args: [],
    );
  }

  String get change_delivery_address {
    return Intl.message(
      'Thay đổi địa chỉ nhận hàng',
      name: 'change_delivery_address',
      desc: '',
      args: [],
    );
  }

  String get delivery_time_1 {
    return Intl.message(
      '09:00 - 11:00',
      name: 'delivery_time_1',
      desc: '',
      args: [],
    );
  }

  String get delivery_time_2 {
    return Intl.message(
      '14:00 - 16:00',
      name: 'delivery_time_2',
      desc: '',
      args: [],
    );
  }

  String get delivery_time_3 {
    return Intl.message(
      '19:00 - 21:00',
      name: 'delivery_time_3',
      desc: '',
      args: [],
    );
  }

  String get no_delivery_time_1 {
    return Intl.message(
      'Không có giờ giao hàng',
      name: 'no_delivery_time_1',
      desc: '',
      args: [],
    );
  }

  String get no_delivery_time_2 {
    return Intl.message(
      'Vui lòng chọn ngày khác',
      name: 'no_delivery_time_2',
      desc: '',
      args: [],
    );
  }

  String get checkout {
    return Intl.message(
      'Thanh toán',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  String shop(Object shop) {
    return Intl.message(
      'Shop $shop',
      name: 'shop',
      desc: '',
      args: [shop],
    );
  }

  String get bank {
    return Intl.message(
      'Ngân hàng:',
      name: 'bank',
      desc: '',
      args: [],
    );
  }

  String get bank_number {
    return Intl.message(
      'Số tài khoản:',
      name: 'bank_number',
      desc: '',
      args: [],
    );
  }

  String get owner_name {
    return Intl.message(
      'Chủ tài khoản:',
      name: 'owner_name',
      desc: '',
      args: [],
    );
  }

  String get transfer_info {
    return Intl.message(
      'Thông Tin Chuyển Khoản',
      name: 'transfer_info',
      desc: '',
      args: [],
    );
  }

  String get contract_code {
    return Intl.message(
      'Mã HĐ:',
      name: 'contract_code',
      desc: '',
      args: [],
    );
  }

  String get transfer_content {
    return Intl.message(
      'Nội dung CK:',
      name: 'transfer_content',
      desc: '',
      args: [],
    );
  }

  String get amount {
    return Intl.message(
      'Số tiền:',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  String get press_to_upload {
    return Intl.message(
      'Bấm để upload',
      name: 'press_to_upload',
      desc: '',
      args: [],
    );
  }

  String get upload_notice {
    return Intl.message(
      '(Upload hình ảnh thanh toán chuyển khoản thành công)',
      name: 'upload_notice',
      desc: '',
      args: [],
    );
  }

  String get enter_checkout_note {
    return Intl.message(
      'Nhập ghi chú thanh toán',
      name: 'enter_checkout_note',
      desc: '',
      args: [],
    );
  }

  String get checkout_note {
    return Intl.message(
      'Ghi chú thanh toán Quý khách muốn gửi tới Shop',
      name: 'checkout_note',
      desc: '',
      args: [],
    );
  }

  String get finish_checkout {
    return Intl.message(
      'hoàn tất thanh toán',
      name: 'finish_checkout',
      desc: '',
      args: [],
    );
  }

  String get booking_success {
    return Intl.message(
      'Đặt Hàng Thành Công',
      name: 'booking_success',
      desc: '',
      args: [],
    );
  }

  String congratulation_booking(Object username) {
    return Intl.message(
      'Chúc mừng Anh/chị $username đã đặt hàng\nthành công ',
      name: 'congratulation_booking',
      desc: '',
      args: [username],
    );
  }

  String get order_code_title {
    return Intl.message(
      'Mã đơn hàng:',
      name: 'order_code_title',
      desc: '',
      args: [],
    );
  }

  String order_header(Object orderCode, Object orderDate) {
    return Intl.message(
      'Mã đơn hàng: $orderCode\nNgày đặt hàng: $orderDate',
      name: 'order_header',
      desc: '',
      args: [orderCode, orderDate],
    );
  }

  String get continue_buying {
    return Intl.message(
      'Tiếp tục mua sắm',
      name: 'continue_buying',
      desc: '',
      args: [],
    );
  }

  String get view_order {
    return Intl.message(
      'Xem đơn hàng',
      name: 'view_order',
      desc: '',
      args: [],
    );
  }

  String get cancel {
    return Intl.message(
      'Hủy bỏ',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  String get receive_in_shop {
    return Intl.message(
      'Nhận hàng tại shop ',
      name: 'receive_in_shop',
      desc: '',
      args: [],
    );
  }

  String get receive {
    return Intl.message(
      'Nhận hàng',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  String get delivering {
    return Intl.message(
      'Đang vận chuyển',
      name: 'delivering',
      desc: '',
      args: [],
    );
  }

  String get delivery_info {
    return Intl.message(
      'Thông tin vận chuyển',
      name: 'delivery_info',
      desc: '',
      args: [],
    );
  }

  String get period {
    return Intl.message(
      'Thời hạn',
      name: 'period',
      desc: '',
      args: [],
    );
  }

  String get numberOfVoucher {
    return Intl.message(
      'Số Voucher',
      name: 'numberOfVoucher',
      desc: '',
      args: [],
    );
  }

  String get remindBuy {
    return Intl.message(
      'nhắc mua',
      name: 'remindBuy',
      desc: '',
      args: [],
    );
  }

  String get remindUse {
    return Intl.message(
      'nhắc sử dụng',
      name: 'remindUse',
      desc: '',
      args: [],
    );
  }

  String get order_info {
    return Intl.message(
      'Thông tin đơn hàng',
      name: 'order_info',
      desc: '',
      args: [],
    );
  }

  String get barcode_note {
    return Intl.message(
      'Quý khách vui lòng đưa mã barcode cho\nnhân viên tại cửa hàng để được nhận hàng',
      name: 'barcode_note',
      desc: '',
      args: [],
    );
  }

  String get ordered {
    return Intl.message(
      'Đơn hàng đã đặt',
      name: 'ordered',
      desc: '',
      args: [],
    );
  }

  String get canceled_order {
    return Intl.message(
      'Đơn hàng đã huỷ',
      name: 'canceled_order',
      desc: '',
      args: [],
    );
  }

  String get service_booked {
    return Intl.message(
      'Dịch vụ đã đặt lịch',
      name: 'service_booked',
      desc: '',
      args: [],
    );
  }

  String get used_service {
    return Intl.message(
      'Dịch vụ đã sử dụng',
      name: 'used_service',
      desc: '',
      args: [],
    );
  }

  String get service_using_address {
    return Intl.message(
      'Địa chỉ sử dung dịch vụ',
      name: 'service_using_address',
      desc: '',
      args: [],
    );
  }

  String get time_using {
    return Intl.message(
      'Thời gian sử dụng',
      name: 'time_using',
      desc: '',
      args: [],
    );
  }

  String get date_using {
    return Intl.message(
      'Ngày sử dụng',
      name: 'date_using',
      desc: '',
      args: [],
    );
  }

  String get service_info {
    return Intl.message(
      'Thông tin dịch vụ',
      name: 'service_info',
      desc: '',
      args: [],
    );
  }

  String get cancel_schedule {
    return Intl.message(
      'Hủy Lịch',
      name: 'cancel_schedule',
      desc: '',
      args: [],
    );
  }

  String get remindBuyProduct {
    return Intl.message(
      'Nhắc lịch mua sản phẩm',
      name: 'remindBuyProduct',
      desc: '',
      args: [],
    );
  }

  String get remindTime {
    return Intl.message(
      'Thời gian nhắc:',
      name: 'remindTime',
      desc: '',
      args: [],
    );
  }

  String get remindUseProduct {
    return Intl.message(
      'Nhắc lịch sử dụng sản phẩm',
      name: 'remindUseProduct',
      desc: '',
      args: [],
    );
  }

  String get endDateOfReminder {
    return Intl.message(
      'Ngày kết thúc nhắc:',
      name: 'endDateOfReminder',
      desc: '',
      args: [],
    );
  }

  String get reminderCycle {
    return Intl.message(
      'Chu kỳ nhắc (ngày):',
      name: 'reminderCycle',
      desc: '',
      args: [],
    );
  }

  String get reminderCycleHint {
    return Intl.message(
      ' Chọn 1 là nhắc lịch hàng ngày, 2 là 2 ngày sẽ nhắc 1 lần...',
      name: 'reminderCycleHint',
      desc: '',
      args: [],
    );
  }

  String get select {
    return Intl.message(
      'Chọn',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  String reminderTimeAt(Object order) {
    return Intl.message(
      'Thời gian nhắc lần $order',
      name: 'reminderTimeAt',
      desc: '',
      args: [order],
    );
  }

  String get addReminder {
    return Intl.message(
      'Thêm lịch nhắc',
      name: 'addReminder',
      desc: '',
      args: [],
    );
  }

  String get saveChange {
    return Intl.message(
      'Lưu thay đổi',
      name: 'saveChange',
      desc: '',
      args: [],
    );
  }

  String get date {
    return Intl.message(
      'Ngày',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  String get editReminder {
    return Intl.message(
      'Sửa lịch nhắc',
      name: 'editReminder',
      desc: '',
      args: [],
    );
  }

  String get register_success {
    return Intl.message(
      'Đăng ký thành công',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  String get change_pass_success {
    return Intl.message(
      'Đổi mật khẩu thành công',
      name: 'change_pass_success',
      desc: '',
      args: [],
    );
  }

  String get pass_repass_must_same {
    return Intl.message(
      'Nhập lại mật khẩu chưa trùng khớp',
      name: 'pass_repass_must_same',
      desc: '',
      args: [],
    );
  }

  String get fill_all_blank {
    return Intl.message(
      'Hãy nhập đầy đủ các ô',
      name: 'fill_all_blank',
      desc: '',
      args: [],
    );
  }

  String get change_fail {
    return Intl.message(
      'Cập nhật thất bại',
      name: 'change_fail',
      desc: '',
      args: [],
    );
  }

  String get success {
    return Intl.message(
      'Thành công',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  String get provider_info {
    return Intl.message(
      'Thông tin nhà cung cấp',
      name: 'provider_info',
      desc: '',
      args: [],
    );
  }

  String get voucherDetail {
    return Intl.message(
      'Chi tiết Voucher',
      name: 'voucherDetail',
      desc: '',
      args: [],
    );
  }

  String get information {
    return Intl.message(
      'Thông tin',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  String get guide {
    return Intl.message(
      'Hướng dẫn',
      name: 'guide',
      desc: '',
      args: [],
    );
  }

  String get images {
    return Intl.message(
      'Hình ảnh',
      name: 'images',
      desc: '',
      args: [],
    );
  }

  String get contact {
    return Intl.message(
      'Liên hệ',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  String get getCode {
    return Intl.message(
      'lấy mã',
      name: 'getCode',
      desc: '',
      args: [],
    );
  }

  String get cancelDialog {
    return Intl.message(
      'Huỷ',
      name: 'cancelDialog',
      desc: '',
      args: [],
    );
  }

  String get agree {
    return Intl.message(
      'Đồng ý',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  String get providerInfo {
    return Intl.message(
      'Thông tin đơn vị cung cấp',
      name: 'providerInfo',
      desc: '',
      args: [],
    );
  }

  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  String get telePhone {
    return Intl.message(
      'Điện thoại',
      name: 'telePhone',
      desc: '',
      args: [],
    );
  }

  String get useCode {
    return Intl.message(
      'Sử dụng mã',
      name: 'useCode',
      desc: '',
      args: [],
    );
  }

  String get voucherCode {
    return Intl.message(
      'Mã khuyến mãi',
      name: 'voucherCode',
      desc: '',
      args: [],
    );
  }

  String get codeTimeRemain {
    return Intl.message(
      'Thời gian còn lại sử dung mã khuyễn mãi là: 24 giờ',
      name: 'codeTimeRemain',
      desc: '',
      args: [],
    );
  }

  String get promotionCode {
    return Intl.message(
      'Mã ưu đãi',
      name: 'promotionCode',
      desc: '',
      args: [],
    );
  }

  String get authenPromoCode {
    return Intl.message(
      'Xác thực mã ưu đãi',
      name: 'authenPromoCode',
      desc: '',
      args: [],
    );
  }

  String get fillAuthenCode {
    return Intl.message(
      'Nhập mã xác thực',
      name: 'fillAuthenCode',
      desc: '',
      args: [],
    );
  }

  String get sendCode {
    return Intl.message(
      'Gửi mã',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  String get or {
    return Intl.message(
      'Hoặc',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  String get scanQRCode {
    return Intl.message(
      'Quét mã QR Code',
      name: 'scanQRCode',
      desc: '',
      args: [],
    );
  }

  String get logout {
    return Intl.message(
      'Đăng xuất',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  String get attached_product {
    return Intl.message(
      'Sản phẩm mua kèm',
      name: 'attached_product',
      desc: '',
      args: [],
    );
  }

  String get selectRemindTime {
    return Intl.message(
      'Chọn thời gian nhắc',
      name: 'selectRemindTime',
      desc: '',
      args: [],
    );
  }

  String get weight_height {
    return Intl.message(
      'Chiều cao - Cân nặng',
      name: 'weight_height',
      desc: '',
      args: [],
    );
  }

  String get girl {
    return Intl.message(
      'Bé gái',
      name: 'girl',
      desc: '',
      args: [],
    );
  }

  String get boy {
    return Intl.message(
      'Bé trai',
      name: 'boy',
      desc: '',
      args: [],
    );
  }

  String get height {
    return Intl.message(
      'Chiều Cao',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  String get weight {
    return Intl.message(
      'Cân nặng',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  String chart_for_girl(Object type, Object gender) {
    return Intl.message(
      'Biểu đồ $type theo tuổi cho $gender',
      name: 'chart_for_girl',
      desc: '',
      args: [type, gender],
    );
  }

  String get normal_height {
    return Intl.message(
      'Chiều cao bình thường',
      name: 'normal_height',
      desc: '',
      args: [],
    );
  }

  String get normal_weight {
    return Intl.message(
      'Cân nặng bình thường',
      name: 'normal_weight',
      desc: '',
      args: [],
    );
  }

  String get greater_than_age {
    return Intl.message(
      'Chiều cao cao hơn so với tuổi',
      name: 'greater_than_age',
      desc: '',
      args: [],
    );
  }

  String get weight_greater_than_age {
    return Intl.message(
      'Cân nặng cao hơn so với tuổi',
      name: 'weight_greater_than_age',
      desc: '',
      args: [],
    );
  }

  String get suy_dinh_duong_normal {
    return Intl.message(
      'Trẻ suy dinh dưỡng thể thấp còi, mức độ vừa',
      name: 'suy_dinh_duong_normal',
      desc: '',
      args: [],
    );
  }

  String get sdd_nang {
    return Intl.message(
      'Trẻ suy dinh dưỡng thể thấp còi, mức độ nặng',
      name: 'sdd_nang',
      desc: '',
      args: [],
    );
  }

  String get enter_weight_height {
    return Intl.message(
      'Nhập chiều cao/cân nặng',
      name: 'enter_weight_height',
      desc: '',
      args: [],
    );
  }

  String get enter_all_value_child {
    return Intl.message(
      'Nhập các chỉ số chiều cao, cân nặng của bé',
      name: 'enter_all_value_child',
      desc: '',
      args: [],
    );
  }

  String get service_detail {
    return Intl.message(
      'Chi tiết dịch vụ',
      name: 'service_detail',
      desc: '',
      args: [],
    );
  }

  String get selectRemindDate {
    return Intl.message(
      'Chọn ngày nhắc',
      name: 'selectRemindDate',
      desc: '',
      args: [],
    );
  }

  String get month {
    return Intl.message(
      'Tháng',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  String get remove_select {
    return Intl.message(
      'Bỏ chọn',
      name: 'remove_select',
      desc: '',
      args: [],
    );
  }

  String get use_service {
    return Intl.message(
      'Sử dụng dịch vụ',
      name: 'use_service',
      desc: '',
      args: [],
    );
  }

  String get selectRemindCycle {
    return Intl.message(
      'Chọn chu kỳ nhắc',
      name: 'selectRemindCycle',
      desc: '',
      args: [],
    );
  }

  String get getCodeNotifyText {
    return Intl.message(
      'Mã khuyến mãi của bạn có hiệu lực trong 24 giờ. Bạn có muốn lấy mã không?',
      name: 'getCodeNotifyText',
      desc: '',
      args: [],
    );
  }

  String get view_all {
    return Intl.message(
      'Xem tất cả',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  String get height_cm {
    return Intl.message(
      'Chiều cao (cm)',
      name: 'height_cm',
      desc: '',
      args: [],
    );
  }

  String get weight_kg {
    return Intl.message(
      'Cân nặng (kg)',
      name: 'weight_kg',
      desc: '',
      args: [],
    );
  }

  String get age_month {
    return Intl.message(
      'Tháng tuối',
      name: 'age_month',
      desc: '',
      args: [],
    );
  }

  String get home_new_products {
    return Intl.message(
      'HÀNG MỚI VỀ',
      name: 'home_new_products',
      desc: '',
      args: [],
    );
  }

  String get home_hot_products {
    return Intl.message(
      'HÀNG bán chạy',
      name: 'home_hot_products',
      desc: '',
      args: [],
    );
  }

  String get home_discount_products {
    return Intl.message(
      'HÀNG khuyến mãi',
      name: 'home_discount_products',
      desc: '',
      args: [],
    );
  }

  String get view_shop {
    return Intl.message(
      'Xem Shop',
      name: 'view_shop',
      desc: '',
      args: [],
    );
  }

  String get profileWelcomeText {
    return Intl.message(
      'Vườn Của Bé ,Xin chào!',
      name: 'profileWelcomeText',
      desc: '',
      args: [],
    );
  }

  String get no_image {
    return Intl.message(
      'No image',
      name: 'no_image',
      desc: '',
      args: [],
    );
  }

  String get time_pending {
    return Intl.message(
      'Chưa bắt đầu',
      name: 'time_pending',
      desc: '',
      args: [],
    );
  }

  String get time_ended {
    return Intl.message(
      'Đã kết thúc',
      name: 'time_ended',
      desc: '',
      args: [],
    );
  }

  String get title_require_login {
    return Intl.message(
      'Yêu cầu đăng nhập',
      name: 'title_require_login',
      desc: '',
      args: [],
    );
  }

  String get message_require_login {
    return Intl.message(
      'Bạn vui lòng đăng nhập để sử dụng chức năng này!',
      name: 'message_require_login',
      desc: '',
      args: [],
    );
  }

  String get no_product_in_cart {
    return Intl.message(
      'Bạn chưa có sản phẩm nào trong giỏ.\nShopping ngay nào!',
      name: 'no_product_in_cart',
      desc: '',
      args: [],
    );
  }

  String get go_shopping {
    return Intl.message(
      'Shopping',
      name: 'go_shopping',
      desc: '',
      args: [],
    );
  }

  String get title_confirm_delete_cart {
    return Intl.message(
      'Xác nhận',
      name: 'title_confirm_delete_cart',
      desc: '',
      args: [],
    );
  }

  String get message_confirm_delete_cart {
    return Intl.message(
      'Bạn có muốn xoá sản phẩm này khỏi giỏ hàng không?',
      name: 'message_confirm_delete_cart',
      desc: '',
      args: [],
    );
  }

  String get yes {
    return Intl.message(
      'Có',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  String get no {
    return Intl.message(
      'Không',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  String get no_data {
    return Intl.message(
      'Chưa có dữ liệu',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  String get reload {
    return Intl.message(
      'Tải lại',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  String message_empty(Object key) {
    return Intl.message(
      'Vui lòng nhập $key để tiếp tục',
      name: 'message_empty',
      desc: '',
      args: [key],
    );
  }

  String get title_select_pick_image {
    return Intl.message(
      'Chọn ảnh',
      name: 'title_select_pick_image',
      desc: '',
      args: [],
    );
  }

  String get message_select_pick_image {
    return Intl.message(
      'Bạn muốn chụp ảnh từ camera hay lấy ảnh từ thư viên?',
      name: 'message_select_pick_image',
      desc: '',
      args: [],
    );
  }

  String get from_camera {
    return Intl.message(
      'Chụp ảnh',
      name: 'from_camera',
      desc: '',
      args: [],
    );
  }

  String get from_gallery {
    return Intl.message(
      'Lấy ảnh từ thư viện',
      name: 'from_gallery',
      desc: '',
      args: [],
    );
  }

  String get register_partner {
    return Intl.message(
      'Đăng ký trở thành đối tác',
      name: 'register_partner',
      desc: '',
      args: [],
    );
  }

  String get register_partner_success {
    return Intl.message(
      'Đăng ký trở thành đối tác thành công!',
      name: 'register_partner_success',
      desc: '',
      args: [],
    );
  }

  String get voucher_get_code {
    return Intl.message(
      'Lấy mã',
      name: 'voucher_get_code',
      desc: '',
      args: [],
    );
  }

  String get voucher_use_code {
    return Intl.message(
      'Sử dụng mã',
      name: 'voucher_use_code',
      desc: '',
      args: [],
    );
  }

  String get voucher_used {
    return Intl.message(
      'Đã sử dụng',
      name: 'voucher_used',
      desc: '',
      args: [],
    );
  }

  String get voucher_not_get {
    return Intl.message(
      'Chưa lấy',
      name: 'voucher_not_get',
      desc: '',
      args: [],
    );
  }

  String get voucher_got {
    return Intl.message(
      'Đã lấy mã',
      name: 'voucher_got',
      desc: '',
      args: [],
    );
  }

  String use_to_time(Object date, Object time) {
    return Intl.message(
      'Dùng đến: $date - $time',
      name: 'use_to_time',
      desc: '',
      args: [date, time],
    );
  }

  String get voucher_info {
    return Intl.message(
      'Thông tin Voucher',
      name: 'voucher_info',
      desc: '',
      args: [],
    );
  }

  String get mess_get_code_voucher_success {
    return Intl.message(
      'Lấy mã code thành công!',
      name: 'mess_get_code_voucher_success',
      desc: '',
      args: [],
    );
  }

  String get done {
    return Intl.message(
      'Xong',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  String get alert_missing_enter_name {
    return Intl.message(
      'Vui lòng nhập tên',
      name: 'alert_missing_enter_name',
      desc: '',
      args: [],
    );
  }

  String get alert_missing_enter_new_password {
    return Intl.message(
      'Vui lòng nhập mật khẩu',
      name: 'alert_missing_enter_new_password',
      desc: '',
      args: [],
    );
  }

  String get alert_missing_enter_new_repassword {
    return Intl.message(
      'Vui lòng nhập lại mật khẩu',
      name: 'alert_missing_enter_new_repassword',
      desc: '',
      args: [],
    );
  }

  String get alert_compare_pass_repass {
    return Intl.message(
      'mật khẩu và nhập lại mật khẩu chưa trùng khớp',
      name: 'alert_compare_pass_repass',
      desc: '',
      args: [],
    );
  }

  String get alert_resert_pass_success {
    return Intl.message(
      'Đổi mật khẩu thành công, mời bạn tiếp tục mua hàng',
      name: 'alert_resert_pass_success',
      desc: '',
      args: [],
    );
  }

  String get alert_code_expire_time {
    return Intl.message(
      'Code đã hết hạn, bạn vui lòng thử lại sau',
      name: 'alert_code_expire_time',
      desc: '',
      args: [],
    );
  }

  String get new_password {
    return Intl.message(
      'Mật khẩu mới',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  String get renew_password {
    return Intl.message(
      'Xác nhận mật khẩu mới',
      name: 'renew_password',
      desc: '',
      args: [],
    );
  }

  String get old_password {
    return Intl.message(
      'Mật khẩu cũ',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  String get cancel_reason {
    return Intl.message(
      'Lý do hủy',
      name: 'cancel_reason',
      desc: '',
      args: [],
    );
  }

  String get cancel_time {
    return Intl.message(
      'Hủy vào lúc',
      name: 'cancel_time',
      desc: '',
      args: [],
    );
  }

  String cancel_time_inset(Object time) {
    return Intl.message(
      'Hủy vào lúc: $time',
      name: 'cancel_time_inset',
      desc: '',
      args: [time],
    );
  }

  String get cancel_by {
    return Intl.message(
      'Hủy bởi',
      name: 'cancel_by',
      desc: '',
      args: [],
    );
  }

  String get change_service_type {
    return Intl.message(
      'Muốn thay đổi loại dịch vụ',
      name: 'change_service_type',
      desc: '',
      args: [],
    );
  }

  String get cancel_question {
    return Intl.message(
      'Bạn có muốn thực sự muốn huỷ ?',
      name: 'cancel_question',
      desc: '',
      args: [],
    );
  }

  String get attention {
    return Intl.message(
      'Chú ý',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  String get message_add_baby_test_success {
    return Intl.message(
      'Nhập thông tin thành công!',
      name: 'message_add_baby_test_success',
      desc: '',
      args: [],
    );
  }

  String get enter_baby_height {
    return Intl.message(
      'Nhập chiều cao của bé',
      name: 'enter_baby_height',
      desc: '',
      args: [],
    );
  }

  String get enter_baby_weight {
    return Intl.message(
      'Nhập cân nặng của bé',
      name: 'enter_baby_weight',
      desc: '',
      args: [],
    );
  }

  String get enter_baby_note {
    return Intl.message(
      'Bố/mẹ viết lại những lưu bút tại thời điểm kiểm tra của bé tại đây nhé!',
      name: 'enter_baby_note',
      desc: '',
      args: [],
    );
  }

  String get cm_unit {
    return Intl.message(
      '(cm)',
      name: 'cm_unit',
      desc: '',
      args: [],
    );
  }

  String get kg_unit {
    return Intl.message(
      '(kg)',
      name: 'kg_unit',
      desc: '',
      args: [],
    );
  }

  String get click_on_here {
    return Intl.message(
      'Bấm vào đây',
      name: 'click_on_here',
      desc: '',
      args: [],
    );
  }

  String get change_image {
    return Intl.message(
      'Đổi hình khác',
      name: 'change_image',
      desc: '',
      args: [],
    );
  }

  String get child_take_photo_desc {
    return Intl.message(
      'Lưu trữ kỷ niệm bạn upload ảnh mới nhất của bé nhé',
      name: 'child_take_photo_desc',
      desc: '',
      args: [],
    );
  }

  String get confirm_info {
    return Intl.message(
      'Xác nhận thông tin',
      name: 'confirm_info',
      desc: '',
      args: [],
    );
  }

  String get confirm_child_info_message {
    return Intl.message(
      'Bố/mẹ kiểm tra lại thông tin chiều cao, can năng của bé vừa nhập đã nhập đã đúng chưa nhé:',
      name: 'confirm_child_info_message',
      desc: '',
      args: [],
    );
  }

  String get height_is {
    return Intl.message(
      'Chiều cao: ',
      name: 'height_is',
      desc: '',
      args: [],
    );
  }

  String get weight_is {
    return Intl.message(
      'Cân nặng: ',
      name: 'weight_is',
      desc: '',
      args: [],
    );
  }

  String get checking_button {
    return Intl.message(
      'Tiến hành kiểm tra',
      name: 'checking_button',
      desc: '',
      args: [],
    );
  }

  String get rank_is {
    return Intl.message(
      '       Xếp hạng: ',
      name: 'rank_is',
      desc: '',
      args: [],
    );
  }

  String get note_is {
    return Intl.message(
      'Lưu bút: ',
      name: 'note_is',
      desc: '',
      args: [],
    );
  }

  String get image_is {
    return Intl.message(
      'Ảnh của bé:',
      name: 'image_is',
      desc: '',
      args: [],
    );
  }

  String get enter_again {
    return Intl.message(
      'Nhập lại',
      name: 'enter_again',
      desc: '',
      args: [],
    );
  }

  String get sku_product {
    return Intl.message(
      'Mã SKU',
      name: 'sku_product',
      desc: '',
      args: [],
    );
  }

  String numPoint(Object point) {
    return Intl.message(
      '$point điểm',
      name: 'numPoint',
      desc: '',
      args: [point],
    );
  }

  String get messageLogout {
    return Intl.message(
      'Bạn có muốn đăng xuất không?',
      name: 'messageLogout',
      desc: '',
      args: [],
    );
  }

  String get mess_receive_notify_for_product {
    return Intl.message(
      'Bạn đã đăng ký nhận thông báo cho sản phẩm này thành công!',
      name: 'mess_receive_notify_for_product',
      desc: '',
      args: [],
    );
  }

  String get child_test_results_evaluate {
    return Intl.message(
      'Đánh giá kết quả: ',
      name: 'child_test_results_evaluate',
      desc: '',
      args: [],
    );
  }

  String newest_test_time(Object time) {
    return Intl.message(
      '(Lần kiểm tra mới nhất: $time tháng)',
      name: 'newest_test_time',
      desc: '',
      args: [time],
    );
  }

  String get nutrition_consulting {
    return Intl.message(
      'Tư vấn dinh dưỡng:',
      name: 'nutrition_consulting',
      desc: '',
      args: [],
    );
  }

  String get suggestion_products {
    return Intl.message(
      'Sản phẩm gợi ý:',
      name: 'suggestion_products',
      desc: '',
      args: [],
    );
  }

  String get enter_name {
    return Intl.message(
      'Mời nhập tên',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  String get enter_code {
    return Intl.message(
      'Mời nhập mã OTP',
      name: 'enter_code',
      desc: '',
      args: [],
    );
  }

  String get name {
    return Intl.message(
      'tên',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  String get phone_format {
    return Intl.message(
      'Số điện thoại không tồn tại, mời nhập lại',
      name: 'phone_format',
      desc: '',
      args: [],
    );
  }

  String get in_delivery {
    return Intl.message(
      'Đang vận chuyển',
      name: 'in_delivery',
      desc: '',
      args: [],
    );
  }

  String get waiting_checkout {
    return Intl.message(
      'Chờ thanh toán',
      name: 'waiting_checkout',
      desc: '',
      args: [],
    );
  }

  String get choose_shop_address {
    return Intl.message(
      'Vui lòng chọn shop nhận hàng',
      name: 'choose_shop_address',
      desc: '',
      args: [],
    );
  }

  String get choose_delivery_address {
    return Intl.message(
      'Vui lòng nhập địa chỉ nhận hàng ',
      name: 'choose_delivery_address',
      desc: '',
      args: [],
    );
  }

  String get choose_time_Schedule {
    return Intl.message(
      'Vui lòng chọn thời gian nhận hàng ',
      name: 'choose_time_Schedule',
      desc: '',
      args: [],
    );
  }

  String get choose_booking_time {
    return Intl.message(
      'Vui lòng chọn thời gian đặt lịch',
      name: 'choose_booking_time',
      desc: '',
      args: [],
    );
  }

  String get missing_information {
    return Intl.message(
      'Thiếu thông tin',
      name: 'missing_information',
      desc: '',
      args: [],
    );
  }

  String get view_delivery {
    return Intl.message(
      'Xem lộ trình',
      name: 'view_delivery',
      desc: '',
      args: [],
    );
  }

  String get point_checkout_alert {
    return Intl.message(
      'Số điểm bạn nhập vượt quá số điểm hiện có',
      name: 'point_checkout_alert',
      desc: '',
      args: [],
    );
  }

  String get point_checkout_alert_1 {
    return Intl.message(
      'Số điểm bạn nhập phải chia hết cho 20',
      name: 'point_checkout_alert_1',
      desc: '',
      args: [],
    );
  }

  String get point_checkout_alert_2 {
    return Intl.message(
      'Số điểm bạn nhập vượt quá số tiền cần thanh toán',
      name: 'point_checkout_alert_2',
      desc: '',
      args: [],
    );
  }

  String get remindCycle1 {
    return Intl.message(
      '01 (1 ngày nhắc / 1 lần)',
      name: 'remindCycle1',
      desc: '',
      args: [],
    );
  }

  String get remindCycle2 {
    return Intl.message(
      '02 (2 ngày nhắc / 1 lần)',
      name: 'remindCycle2',
      desc: '',
      args: [],
    );
  }

  String get remindCycle3 {
    return Intl.message(
      '03 (3 ngày nhắc / 1 lần)',
      name: 'remindCycle3',
      desc: '',
      args: [],
    );
  }

  String get remindOtherOption {
    return Intl.message(
      'Tùy chọn khác',
      name: 'remindOtherOption',
      desc: '',
      args: [],
    );
  }

  String get remindOtherOptionHint {
    return Intl.message(
      'Nhập số ngày nhắc mong muốn/ 1 lần =/1 kỳ',
      name: 'remindOtherOptionHint',
      desc: '',
      args: [],
    );
  }

  String get male {
    return Intl.message(
      'Nam',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  String get female {
    return Intl.message(
      'Nữ',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  String get set_schedule_alarm_product {
    return Intl.message(
      'Set lịch nhắc sản phẩm',
      name: 'set_schedule_alarm_product',
      desc: '',
      args: [],
    );
  }

  String get check_result {
    return Intl.message(
      'Kết quả kiểm tra',
      name: 'check_result',
      desc: '',
      args: [],
    );
  }

  String get baby {
    return Intl.message(
      'Bé:',
      name: 'baby',
      desc: '',
      args: [],
    );
  }

  String get birthday_is {
    return Intl.message(
      'Ngày sinh:',
      name: 'birthday_is',
      desc: '',
      args: [],
    );
  }

  String get check_date_is {
    return Intl.message(
      'Ngày kiểm tra:',
      name: 'check_date_is',
      desc: '',
      args: [],
    );
  }

  String get no_receive_time {
    return Intl.message(
      'Không có thời gian nhận hàng\nVui lòng chọn ngày khác',
      name: 'no_receive_time',
      desc: '',
      args: [],
    );
  }

  String get test_result_is {
    return Intl.message(
      'Đánh giá kết quả:',
      name: 'test_result_is',
      desc: '',
      args: [],
    );
  }

  String get mess_delete_search_history {
    return Intl.message(
      'Bạn có muốn xoá lịch sử tìm kiếm không?',
      name: 'mess_delete_search_history',
      desc: '',
      args: [],
    );
  }

  String get no_search_history {
    return Intl.message(
      'Bạn chưa có lịch sử tìm kiếm',
      name: 'no_search_history',
      desc: '',
      args: [],
    );
  }

  String get correct_code {
    return Intl.message(
      'Nhập mã thành công',
      name: 'correct_code',
      desc: '',
      args: [],
    );
  }

  String get incorrect_code {
    return Intl.message(
      'Mã không đúng',
      name: 'incorrect_code',
      desc: '',
      args: [],
    );
  }

  String get cancel_by_owner {
    return Intl.message(
      'Người đặt',
      name: 'cancel_by_owner',
      desc: '',
      args: [],
    );
  }

  String get cancel_by_shop {
    return Intl.message(
      'Chủ Shop',
      name: 'cancel_by_shop',
      desc: '',
      args: [],
    );
  }

  String get choose_product {
    return Intl.message(
      'Hãy chọn một sản phẩm',
      name: 'choose_product',
      desc: '',
      args: [],
    );
  }

  String get share_content {
    return Intl.message(
      'Tải app vườn của bé \n Mua hàng ko giới hạn',
      name: 'share_content',
      desc: '',
      args: [],
    );
  }

  String get verify_voucher_success {
    return Intl.message(
      'Xác thực thành công',
      name: 'verify_voucher_success',
      desc: '',
      args: [],
    );
  }

  String share_format(Object link) {
    return Intl.message(
      'Tải app Vườn của bé $link.\n Mua hàng không giới hạn.',
      name: 'share_format',
      desc: '',
      args: [link],
    );
  }

  String get enter_province {
    return Intl.message(
      'chọn tỉnh/thành phố',
      name: 'enter_province',
      desc: '',
      args: [],
    );
  }

  String get enter_district {
    return Intl.message(
      'chọn quận/huyện',
      name: 'enter_district',
      desc: '',
      args: [],
    );
  }

  String get enter_sub_district {
    return Intl.message(
      'chọn phường/xã',
      name: 'enter_sub_district',
      desc: '',
      args: [],
    );
  }

  String get will_sell_later {
    return Intl.message(
      'Sắp mở bán',
      name: 'will_sell_later',
      desc: '',
      args: [],
    );
  }

  String get message_choose_service {
    return Intl.message(
      'Bạn vui lòng chọn Dịch vụ',
      name: 'message_choose_service',
      desc: '',
      args: [],
    );
  }

  String get direct_address {
    return Intl.message(
      'Chỉ đường',
      name: 'direct_address',
      desc: '',
      args: [],
    );
  }

  String get mess_verify_report_dialog {
    return Intl.message(
      'Vui lòng nhập tiêu đề hoặc nội dung để gửi báo cáo',
      name: 'mess_verify_report_dialog',
      desc: '',
      args: [],
    );
  }

  String get mess_report_success {
    return Intl.message(
      'Cảm ơn bạn đã gửi báo cáo. Chúng tôi sẽ xem xét báo cáo của bạn trong thời gian sớm nhất.',
      name: 'mess_report_success',
      desc: '',
      args: [],
    );
  }

  String get mess_confirm_delete_calendar {
    return Intl.message(
      'Bạn có muốn xoá lịch nhắc này không?',
      name: 'mess_confirm_delete_calendar',
      desc: '',
      args: [],
    );
  }

  String get promotion_code_error {
    return Intl.message(
      'Mã giảm giá không đúng hoặc đã được sử dụng',
      name: 'promotion_code_error',
      desc: '',
      args: [],
    );
  }

  String get total_price {
    return Intl.message(
      'Thành tiền',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  String get mess_error_user_name {
    return Intl.message(
      'Bạn vui lòng nhập đầy đủ họ tên',
      name: 'mess_error_user_name',
      desc: '',
      args: [],
    );
  }

  String get choose_other_day {
    return Intl.message(
      'Vui lòng chọn ngày khác',
      name: 'choose_other_day',
      desc: '',
      args: [],
    );
  }

  String total_search(Object total) {
    return Intl.message(
      '$total kết quả tìm kiếm',
      name: 'total_search',
      desc: '',
      args: [total],
    );
  }

  String get alert_shop_has_no_address {
    return Intl.message(
      'Shop hiện tại không có địa chỉ nhận hàng nào.\n Vui lòng chọn hình thức nhận hàng khác.',
      name: 'alert_shop_has_no_address',
      desc: '',
      args: [],
    );
  }

  String get mess_confirm_delete {
    return Intl.message(
      'Bạn có muốn xoá không?',
      name: 'mess_confirm_delete',
      desc: '',
      args: [],
    );
  }

  String get hint_pick_a_product {
    return Intl.message(
      'Hãy chon một sản phẩm để nhắc lịch...',
      name: 'hint_pick_a_product',
      desc: '',
      args: [],
    );
  }

  String get no_child {
    return Intl.message(
      'Bố mẹ đã có con chưa? Hãy thêm bé vào để sử dụng chức năng này nhé!',
      name: 'no_child',
      desc: '',
      args: [],
    );
  }

  String product_share_content(Object name, Object price) {
    return Intl.message(
      '$name đang có giá chỉ $price tại Vườn Của Bé, chi tiết tham khảo:',
      name: 'product_share_content',
      desc: '',
      args: [name, price],
    );
  }

  String get choose_service_title {
    return Intl.message(
      'Bạn vui lòng chọn Dịch vụ',
      name: 'choose_service_title',
      desc: '',
      args: [],
    );
  }

  String get direction {
    return Intl.message(
      'Chỉ đường',
      name: 'direction',
      desc: '',
      args: [],
    );
  }

  String get ship_promote {
    return Intl.message(
      'Mã giảm giá',
      name: 'ship_promote',
      desc: '',
      args: [],
    );
  }

  String get all_booking {
    return Intl.message(
      'Tất cả',
      name: 'all_booking',
      desc: '',
      args: [],
    );
  }

  String get not_rating {
    return Intl.message(
      'Chưa đánh giá',
      name: 'not_rating',
      desc: '',
      args: [],
    );
  }

  String get mess_fill_all_info_of_checking {
    return Intl.message(
      'Vui lòng nhập thông tin chiều cao, cân nặng của trẻ để tiếp tục!',
      name: 'mess_fill_all_info_of_checking',
      desc: '',
      args: [],
    );
  }

  String get notify_me {
    return Intl.message(
      'Nhắc nhở tôi',
      name: 'notify_me',
      desc: '',
      args: [],
    );
  }

  String get delete_notify_me {
    return Intl.message(
      'Huỷ nhắc nhở',
      name: 'delete_notify_me',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}