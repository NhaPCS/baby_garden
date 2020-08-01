import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/provider/filter_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/provider/get_ratings_provider.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/widget/star_item.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/widget/tag_item.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/widget/user_rate_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ListUserRatedScreen extends StatefulWidget {
  final String shopId;

  const ListUserRatedScreen({Key key, this.shopId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListUserRatedScreenState();
  }
}

class _ListUserRatedScreenState extends BaseState<ListUserRatedScreen> {
  final FilterProvider _filterProvider = new FilterProvider();
  final GetRatingsProvider _ratingsProvider = new GetRatingsProvider();

  @override
  void initState() {
    super.initState();
    _ratingsProvider.getData(shopId: widget.shopId, type: 1);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).list_user_rated,
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: Consumer<GetRatingsProvider>(
        builder:
            (BuildContext context, GetRatingsProvider value, Widget child) {
          return Consumer<FilterProvider>(
            builder:
                (BuildContext context, FilterProvider value, Widget child) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: SizeUtil.midSmallSpace,
                        left: SizeUtil.midSpace,
                        right: SizeUtil.midSpace),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: TagItem(
                            isSelected: value.index == 0,
                            title: "Tất cả",
                            subTitle: "( 1235 )",
                            ontab: () {
                              reloadSelectedType(0);
                            },
                          ),
                        ),
                        Expanded(
                          child: TagItem(
                            isSelected: value.index == 1,
                            title: "Có bình luận",
                            subTitle: "( 1035 )",
                            ontab: () {
                              reloadSelectedType(1);
                            },
                          ),
                        ),
                        Expanded(
                          child: TagItem(
                            isSelected: value.index == 2,
                            title: "Có hình ảnh",
                            subTitle: "( 105 )",
                            ontab: () {
                              reloadSelectedType(2);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0,
                        left: SizeUtil.midSpace,
                        right: SizeUtil.midSpace),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        5,
                        (index) => Expanded(
                          child: StarItem(
                            isSelected: value.index == index + 3,
                            star: index + 1,
                            subTitle: "( 1235 )",
                            ontab: () {
                              reloadSelectedType(index + 3);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  WidgetUtil.getLine(
                      width: 3,
                      color: Color(0xffE4E4E4),
                      margin: EdgeInsets.all(0)),
                  _ratingsProvider.ratings == null ||
                          _ratingsProvider.ratings.isEmpty
                      ? Container(
                          child: LoadingView(
                            isNoData: _ratingsProvider.ratings != null,
                          ),
                          margin: EdgeInsets.only(top: 50),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: _ratingsProvider.ratings.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                return new GestureDetector(
                                  child: new UserRatedItem(
                                    comment: _ratingsProvider.ratings[index],
                                  ),
                                  onTap: () {
//                      push(VCBExpressDetailScreen());
                                  },
                                );
                              }),
                        ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void reloadSelectedType(int type) {
    _filterProvider.onChangeFilter(type);
    _ratingsProvider.getData(
        shopId: widget.shopId, type: _filterProvider.index + 1);
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(
        value: _filterProvider,
      ),
      ChangeNotifierProvider.value(
        value: _ratingsProvider,
      )
    ];
  }
}
