import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/provider/filter_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/widget/star_item.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/widget/tag_item.dart';
import 'package:baby_garden_flutter/screen/list_user_rated/widget/user_rate_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ListUserRatedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListUserRatedScreenState();
  }
}

class _ListUserRatedScreenState extends BaseState<ListUserRatedScreen> {
  final FilterProvider _filterProvider = new FilterProvider();

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
      body: Column(
        children: <Widget>[
          Consumer<FilterProvider>(
            builder:
                (BuildContext context, FilterProvider value, Widget child) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 8.0,
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
                          _filterProvider.onChangeFilter(0);
                        },
                      ),
                    ),
                    Expanded(
                      child: TagItem(
                        isSelected: value.index == 1,
                        title: "Có bình luận",
                        subTitle: "( 1035 )",
                        ontab: () {
                          _filterProvider.onChangeFilter(1);
                        },
                      ),
                    ),
                    Expanded(
                      child: TagItem(
                        isSelected: value.index == 2,
                        title: "Có hình ảnh",
                        subTitle: "( 105 )",
                        ontab: () {
                          _filterProvider.onChangeFilter(2);
                        },
                      ),
                    )
                  ],
                ),
              );
            },
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
              children: List.generate(5, (index) => Expanded(
                child: StarItem(
                  isSelected: true,
                  star: index+1,
                  subTitle: "( 1235 )",
                  ontab: () {},
                ),
              ),),
            ),
          ),
          WidgetUtil.getLine(
              width: 3, color: Color(0xffE4E4E4), margin: EdgeInsets.all(0)),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    child: new UserRatedItem(),
                    onTap: () {
//                      push(VCBExpressDetailScreen());
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _filterProvider)];
  }
}

