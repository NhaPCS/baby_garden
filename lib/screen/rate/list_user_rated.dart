import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/filter_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/expressItem.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ListUserRatedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListUserRatedScreenState();
  }
}

class _ListUserRatedScreenState extends BaseState<ListUserRatedScreen> {
  final FilterProvider _filterProvider = new FilterProvider();

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorUtil.primaryColor,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).list_user_rated,
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
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
                children: <Widget>[
                  Expanded(
                    child: StarItem(
                      isSelected: true,
                      star: 5,
                      subTitle: "( 1235 )",
                      ontab: () {},
                    ),
                  ),
                  Expanded(
                    child: StarItem(
                      isSelected: true,
                      star: 4,
                      subTitle: "( 355 )",
                      ontab: () {},
                    ),
                  ),
                  Expanded(
                    child: StarItem(
                      isSelected: true,
                      star: 3,
                      subTitle: "( 443 )",
                      ontab: () {},
                    ),
                  ),
                  Expanded(
                    child: StarItem(
                      isSelected: true,
                      star: 2,
                      subTitle: "( 123 )",
                      ontab: () {},
                    ),
                  ),
                  Expanded(
                    child: StarItem(
                      isSelected: true,
                      star: 1,
                      subTitle: "( 5 )",
                      ontab: () {},
                    ),
                  ),
                ],
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
                      child: new userRatedItem(),
                      onTap: () {
//                      push(VCBExpressDetailScreen());
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _filterProvider)];
  }
}

class TagItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subTitle;
  final Function ontab;

  const TagItem(
      {Key key, this.isSelected = false, this.title, this.subTitle, this.ontab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ontab,
      child: Container(
        padding: EdgeInsets.only(
            top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
        margin: EdgeInsets.only(
            left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
        decoration: BoxDecoration(
          color: isSelected ? ColorUtil.white : ColorUtil.lineColor,
          borderRadius: BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
          border: Border.all(
              color: isSelected ? ColorUtil.primaryColor : ColorUtil.white,
              width: 1),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: title + "\n",
                style: TextStyle(color: ColorUtil.textColor)),
            TextSpan(
                text: subTitle,
                style: TextStyle(color: ColorUtil.primaryColor)),
          ]),
        ),
      ),
    );
  }
}

class StarItem extends StatelessWidget {
  final bool isSelected;
  final int star;
  final String subTitle;
  final Function ontab;

  const StarItem(
      {Key key, this.isSelected = false, this.star, this.subTitle, this.ontab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ontab,
      child: Container(
        padding: EdgeInsets.only(
            top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
        margin: EdgeInsets.only(
            left: SizeUtil.superTinySpace, right: SizeUtil.superTinySpace),
        decoration: BoxDecoration(
          color: ColorUtil.lineColor,
          borderRadius: BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                star,
                (index) => Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SvgIcon(
                    'ic_favorite.svg',
                    width: SizeUtil.iconSizeTiny,
                    height: SizeUtil.iconSizeTiny,
                    color: ColorUtil.primaryColor,
                  ),
                ),
              ),
            ),
            Text(subTitle, style: TextStyle(color: ColorUtil.primaryColor))
          ],
        ),
      ),
    );
  }
}

class userRatedItem extends StatelessWidget {
  const userRatedItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeUtil.tinyRadius),
          ),
          side: BorderSide(
            color: ColorUtil.lineColor,
            width: 0.3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage("photo/child_avatar.png"),
              ),
              SizedBox(
                width: SizeUtil.tinySpace,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Trần Đỗ Minh Ân",
                    style: TextStyle(
                        color: ColorUtil.black33, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  RatingBar(
                    enable: false,
                    iconColor: ColorUtil.primaryColor,
                    showRateCount: true,
                    isIcon: true,
                    value: 4,
                    rateCount: 4,
                    alignment: MainAxisAlignment.start,
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    "- Những sản phẩm Vườn Của Bé thật tuyệt vời",
                    style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "photo/saling_detail_img.png.png",
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width * 2 / 9,
                      ),
                      SizedBox(
                        width: SizeUtil.smallSpace,
                      ),
                      Image.asset(
                        "photo/saling_detail_img.png.png",
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width * 2 / 9,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text("26/12/2019 15:10 I Áo len dạ nỉ bé gái 12 tuổi",
                      style: TextStyle(fontSize: SizeUtil.textSizeSmall))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
