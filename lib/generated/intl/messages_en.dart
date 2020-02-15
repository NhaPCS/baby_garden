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
    "account" : MessageLookupByLibrary.simpleMessage("Tài khoản"),
    "all" : MessageLookupByLibrary.simpleMessage("Tất cả"),
    "cart" : MessageLookupByLibrary.simpleMessage("Giỏ hàng"),
    "category" : MessageLookupByLibrary.simpleMessage("Danh mục"),
    "category_product" : MessageLookupByLibrary.simpleMessage("Danh mục sản phẩm"),
    "happened" : MessageLookupByLibrary.simpleMessage("Sắp diễn ra"),
    "happening" : MessageLookupByLibrary.simpleMessage("Đang diễn ra"),
    "home" : MessageLookupByLibrary.simpleMessage("Trang chủ"),
    "order" : MessageLookupByLibrary.simpleMessage("Đơn hàng"),
    "search_hint" : MessageLookupByLibrary.simpleMessage("Bạn muốn tìm gì hôm nay?"),
    "shopping" : MessageLookupByLibrary.simpleMessage("Shopping"),
    "sold_count" : m0,
    "view_more" : MessageLookupByLibrary.simpleMessage("Xem thêm"),
    "welcome" : MessageLookupByLibrary.simpleMessage("Welcome")
  };
}
