import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/dialog/booking_dialogue.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/dialog/booking_schedule_success_dialogue.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/booking_service_detail_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/partner_tabbar_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/provider/see_more_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/view_model/booking_service_view_model.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/shop_booking_content.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/shop_info_header.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/shop_product_content.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/delegate/sliver_category_delegate.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PartnerBookScheduleScreen extends StatefulWidget {
  final String shopID;

  const PartnerBookScheduleScreen({this.shopID}) : super();

  @override
  State<StatefulWidget> createState() {
    return _PartnerBookScheduleScreenState();
  }
}

class _PartnerBookScheduleScreenState
    extends BaseStateModel<PartnerBookScheduleScreen, BookingServiceViewModel>
    with TickerProviderStateMixin {
  final SeeMoreProvider _seeMoreProvider = SeeMoreProvider();
  final PartnerTabbarProvider _partnerTabbarProvider = PartnerTabbarProvider();
  final BookingServiceDetailProvider _bookingServiceDetailProvider =
      BookingServiceDetailProvider();

  final ValueNotifier<String> _dateValueController = new ValueNotifier('');
  final ValueNotifier<String> _timeValueController = new ValueNotifier('');
  final ValueNotifier<dynamic> _selectedAddressController =
      new ValueNotifier(null);
  final ValueNotifier<dynamic> _selectedServiceController =
      new ValueNotifier(null);

  TabController _tabController;

  final GlobalKey _rowKey = GlobalKey();
  final GlobalKey _rowKeyFull = GlobalKey();
  final ValueNotifier<double> _rowHeight = ValueNotifier<double>(-1);
  double _rowHeightFull = 0;
  double imageHeight = 200;
  int _tabCount = 0;

  @override
  void initState() {
    _addCallBackFrame();
    super.initState();
    _bookingServiceDetailProvider.getdata(widget.shopID);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onFavoritePressed() {
    _bookingServiceDetailProvider.toggleFavorite(widget.shopID);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Consumer<BookingServiceDetailProvider>(builder:
        (BuildContext context, BookingServiceDetailProvider shopValue,
            Widget child) {
      _addCallBackFrame();
      _tabCount = 0;
      if (shopValue.data == null)
        return Scaffold(
          appBar: getAppBar(),
        );
      _selectedAddressController.value = shopValue.getFirstAddress();
      if (shopValue.data['service'] != null &&
          shopValue.data['service'].isNotEmpty) {
        _tabCount++;
      }
      if (shopValue.products != null && shopValue.products.isNotEmpty) {
        _tabCount++;
      }
      if (_tabCount == 0) {
        return _renderEmptyServiceAndProducts();
      }
      _tabController = TabController(vsync: this, length: _tabCount);
      _partnerTabbarProvider.setIsProduct((shopValue.data['service'] == null ||
              shopValue.data['service'].isEmpty) &&
          _tabCount == 1);
      _tabController.addListener(() {
        _partnerTabbarProvider.onChange();
      });
      return Scaffold(
          body: ValueListenableBuilder<double>(
              valueListenable: _rowHeight,
              builder: (BuildContext context, double height, Widget child) {
                return _rowHeight.value > 0
                    ? NestedScrollView(
                        body: _renderBody(),
                        headerSliverBuilder: (context, isScrollInner) {
                          return [
                            new SliverAppBar(
                              title: new MyText(
                                shopValue.data['name'],
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: BaseState.getLeading(context),
                              centerTitle: true,
                              pinned: true,
                              forceElevated: isScrollInner,
                            ),
                            Consumer<SeeMoreProvider>(
                              builder: (BuildContext context,
                                  SeeMoreProvider value, Widget child) {
                                double hei = (value.isShow
                                    ? _rowHeightFull
                                    : _rowHeight.value);
                                return SliverPersistentHeader(
                                  pinned: false,
                                  floating: false,
                                  delegate: SliverCategoryDelegate(
                                      ShopInfoHeader(
                                        shop:
                                            _bookingServiceDetailProvider.data,
                                        seeMoreProvider: _seeMoreProvider,
                                        onFavoritePressed: onFavoritePressed,
                                        isShow: value.isShow,
                                      ),
                                      hei,
                                      hei),
                                );
                              },
                            ),
                            _renderTab()
                          ];
                        },
                      )
                    : Opacity(
                        opacity: 0.0,
                        child: Column(
                          children: <Widget>[
                            ShopInfoHeader(
                              shop: _bookingServiceDetailProvider.data,
                              seeMoreProvider: _seeMoreProvider,
                              onFavoritePressed: onFavoritePressed,
                              key: _rowKey,
                              isShow: false,
                            ),
                            ShopInfoHeader(
                              shop: _bookingServiceDetailProvider.data,
                              seeMoreProvider: _seeMoreProvider,
                              onFavoritePressed: onFavoritePressed,
                              key: _rowKeyFull,
                              isShow: true,
                            )
                          ],
                        ),
                      );
              }),
          bottomNavigationBar: Consumer<PartnerTabbarProvider>(builder:
              (BuildContext context, PartnerTabbarProvider value,
                  Widget child) {
            return value.isProduct
                ? SizedBox()
                : Padding(
                    padding: SizeUtil.smallPadding,
                    child: MyRaisedButton(
                      onPressed: () {
                        onBookingService();
                      },
                      text: S.of(context).book,
                      textStyle: TextStyle(color: Colors.white),
                      color: ColorUtil.primaryColor,
                      padding: SizeUtil.normalPadding,
                    ),
                  );
          }));
    });
  }

  Future<void> onBookingService() async {
    if (_selectedServiceController.value == null ||
        _selectedServiceController.value.isEmpty) {
      WidgetUtil.showMessageDialog(context,
          message: S.of(context).choose_service_title, title: "");
      return;
    }
    String userId = await ShareValueProvider.shareValueProvider.getUserId();
    if (userId == null || userId.isEmpty) {
      if (context != null) {
        WidgetUtil.showRequireLoginDialog(context);
      }
    } else {
      List<dynamic> confirmForm = [
        {
          'title': 'Dịch vụ đã đặt: ',
          'content': _selectedServiceController.value['name']
        },
        {
          'title': 'Giá niêm yết:  ',
          'content':
              '\nKhách hàng đã có thẻ hoặc mã voucher vui lòng mang tới cửa hàng để được hưởng đầy đủ ưu đãi.',
          'value': _selectedServiceController.value['price']
        },
        {'title': 'Ngày sử dụng: ', 'content': _dateValueController.value},
        {'title': 'Thời gian: ', 'content': _timeValueController.value},
        {
          'title': 'Thời gian thực hiện: ',
          'content': _selectedServiceController.value['ex_time'] ?? ''
        },
      ];
      var resultData = await showDialog(
          context: context,
          builder: (BuildContext context) => BookingDialogue(
                context: context,
                serviceData: confirmForm,
                shopID: widget.shopID,
                address: _selectedAddressController.value['address'],
                serviceID: _selectedServiceController.value['id'],
                dateBooking: _dateValueController.value,
                timeBooking: _timeValueController.value,
              ));
      if (resultData != null && resultData) {
        var result = await showDialog(
            context: context,
            builder: (BuildContext context) =>
                BookingScheduleSuccessDialogue(context));
        if (result == null || result) {
          pushAndReplaceAll(MainScreen(), "/main_screen");
        }
      }
    }
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _seeMoreProvider),
      ChangeNotifierProvider.value(value: _partnerTabbarProvider),
      ChangeNotifierProvider.value(value: _bookingServiceDetailProvider),
    ];
  }

  @override
  BookingServiceViewModel initViewModel() {
    return BookingServiceViewModel(context);
  }

  _addCallBackFrame() {
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          if (_bookingServiceDetailProvider.data != null &&
              _rowHeight.value == -1)
            {
              if (_rowKey.currentContext != null)
                _rowHeight.value = _rowKey.currentContext.size.height + 10,
              if (_rowKeyFull.currentContext != null)
                _rowHeightFull = _rowKeyFull.currentContext.size.height,
            }
        });
  }

  Widget _renderTab() {
    final productTabbarHei = _partnerTabbarProvider.isProduct
        ? SizeUtil.tab_bar_fix_height + 76
        : SizeUtil.tab_bar_fix_height;
    List<Widget> tabs = List();
    if (_bookingServiceDetailProvider.data['service'] != null &&
        _bookingServiceDetailProvider.data['service'].isNotEmpty) {
      tabs.add(Tab(
        text: S.of(context).book,
      ));
    }
    if (_bookingServiceDetailProvider.products != null &&
        _bookingServiceDetailProvider.products.isNotEmpty) {
      tabs.add(Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).product,
            ),
            Text(
              "(${_bookingServiceDetailProvider.products.length})",
              style: TextStyle(fontSize: SizeUtil.textSizeTiny),
            )
          ],
        ),
      ));
    }
    if (tabs.isEmpty)
      return SizedBox();
    else
      return Consumer<PartnerTabbarProvider>(
        builder:
            (BuildContext context, PartnerTabbarProvider value, Widget child) {
          return SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: SliverCategoryDelegate(
                Column(
                  children: <Widget>[
                    Container(
                      height: SizeUtil.tab_bar_fix_height,
                      child: TabBar(
                        onTap: (val) {
                          _partnerTabbarProvider.onChange();
                        },
                        indicatorWeight: 0,
                        controller: _tabController,
                        labelColor: Colors.white,
                        indicatorColor: ColorUtil.white,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: ColorUtil.primaryColor),
                        unselectedLabelColor: ColorUtil.textColor,
                        tabs: tabs,
                      ),
                      decoration:
                          BoxDecoration(color: ColorUtil.lineColor, boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ]),
                    ),
                    _partnerTabbarProvider.isProduct
                        ? ListCategory()
                        : SizedBox()
                  ],
                ),
                productTabbarHei,
                productTabbarHei),
          );
        },
      );
  }

  Widget _renderBody() {
    List<Widget> tabs = List();
    if (_bookingServiceDetailProvider.data['service'] != null &&
        _bookingServiceDetailProvider.data['service'].isNotEmpty) {
      tabs.add(ShopBookingContent(
        shop: _bookingServiceDetailProvider.data,
        selectedShopAddressController: _selectedAddressController,
        selectedShopServiceController: _selectedServiceController,
        selectedDateController: _dateValueController,
        selectedTimeController: _timeValueController,
        onBookingService: onBookingService,
      ));
    }
    if (_bookingServiceDetailProvider.products != null &&
        _bookingServiceDetailProvider.products.isNotEmpty) {
      tabs.add(ShopProductContent(
        products: _bookingServiceDetailProvider.products,
      ));
    }
    if (tabs.isEmpty)
      return SizedBox();
    else
      return TabBarView(children: tabs, controller: _tabController);
  }

  Widget _renderEmptyServiceAndProducts() {
    return Scaffold(
      appBar: getAppBar(),
      body: Consumer<SeeMoreProvider>(
        builder: (context, value, child) {
          return ShopInfoHeader(
            shop: _bookingServiceDetailProvider.data,
            seeMoreProvider: _seeMoreProvider,
            onFavoritePressed: onFavoritePressed,
            isShow: _seeMoreProvider.isShow,
          );
        },
      ),
    );
  }

  Widget productTab(String data) {
    return Tab(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).product,
            ),
            Text(
              "(${data})",
              style: TextStyle(fontSize: SizeUtil.textSizeTiny),
            )
          ],
        ),
      ),
    );
  }
}
