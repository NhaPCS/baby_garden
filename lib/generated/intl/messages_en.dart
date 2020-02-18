// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(sold, total) => "Đã bán ${sold}/${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "accManage" : MessageLookupByLibrary.simpleMessage("Quản lý tài khoản"),
    "account" : MessageLookupByLibrary.simpleMessage("Tài khoản"),
    "all" : MessageLookupByLibrary.simpleMessage("Tất cả"),
    "cart" : MessageLookupByLibrary.simpleMessage("Giỏ hàng"),
    "category" : MessageLookupByLibrary.simpleMessage("Danh mục"),
    "category_product" : MessageLookupByLibrary.simpleMessage("Danh mục sản phẩm"),
    "customerHelper" : MessageLookupByLibrary.simpleMessage("Hỗ trợ khách hàng"),
    "favoritePatner" : MessageLookupByLibrary.simpleMessage("Đối tác yêu thích"),
    "favoriteProduct" : MessageLookupByLibrary.simpleMessage("Sản phẩm yêu thích"),
    "happened" : MessageLookupByLibrary.simpleMessage("Sắp diễn ra"),
    "happening" : MessageLookupByLibrary.simpleMessage("Đang diễn ra"),
    "home" : MessageLookupByLibrary.simpleMessage("Trang chủ"),
    "joinDate" : MessageLookupByLibrary.simpleMessage("Tham gia từ"),
    "myProfile" : MessageLookupByLibrary.simpleMessage("Trang cá nhân"),
    "order" : MessageLookupByLibrary.simpleMessage("Đơn hàng"),
    "pointManage" : MessageLookupByLibrary.simpleMessage("Quản lý điểm"),
    "remindManage" : MessageLookupByLibrary.simpleMessage("Quản lý lịch nhắc"),
    "search_hint" : MessageLookupByLibrary.simpleMessage("Bạn muốn tìm gì hôm nay?"),
    "seenProduct" : MessageLookupByLibrary.simpleMessage("Sản phẩm đã xem"),
    "setting" : MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "shopping" : MessageLookupByLibrary.simpleMessage("Shopping"),
    "sold_count" : m0,
    "view_more" : MessageLookupByLibrary.simpleMessage("Xem thêm"),
    "voucherManage" : MessageLookupByLibrary.simpleMessage("Quản lý voucher"),
    "welcome" : MessageLookupByLibrary.simpleMessage("Welcome")
  };
}
