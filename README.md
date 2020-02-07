# baby_garden_flutter

Baby Garden

## Tips
- Vào plugin xem có cái nào của Flutter thì cài hết vào (nhiều người tải hẵng cài theo nha)


## Rules
### Cấu trúc app
1. UI
- Mỗi màn hình sẽ nằm trong folder lib/screen. ví dụ màn home sẽ nằm ở screen/home/home_screen.dart
- Mỗi screen sẽ là 1 StatefullWidget có State extend từ BaseState (xem mẫu của welcome_screen.dart): gồm có widget và danh sách các Provider - quản lý state trong màn hình (https://pub.dev/packages/provider)
- Mỗi screen có thể không có hoặc nhiều provider
- UI custom được đặt ở folder lib/widget
- tạo custom dialog đc đặt ở folder lib/widget/dialog/
- UI của item trong list được đặt ở folder lib/item;
- liên quan đến màu, size, text chung, show message dialog hay dialog chung gì đó... đặt ỏ util/resource.dart
- Các thuộc tính chung của widget sẽ setup chung ở resource hoặc ở main.dart, không set up từng widget

2. Data
- Share preference value: saved global value được quản lý ở lib/data/shared_value.dart
- kêt nối với api sẽ quản lý ở lib/data/service.dart
- các provider sẽ đặt ở folder lib/
- mỗi provider thuờng chỉ làm 1 nhiệm vụ

3. Assets (ảnh, font...)
- ảnh đặt ở foldr photo/
- cố gắng dùng icon của Icons, CupertinoIcons, hoặc FontAwesomeIcons hoặc ảnh SVG, không được thì dùng ảnh PNG

4. Localize (multiple languages)
- Cài plugin Flutter Intl (https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl#flutter-intl-add-locale)
- Thêm text vào file intl_en.arb -> plugin sẽ tự cập nhật text mới vào folder generated

### Sử dụng git
- Mỗi người khi làm sẽ tạo 1 branch riêng vd: hungml
- khi xong 1 chức năng thì tạo pull request đến master, em sẽ merge vào master
- commit cần ghi rõ làm màn hình nào , chức năng gì
