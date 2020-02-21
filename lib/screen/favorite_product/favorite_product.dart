import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class FavoriteProduct extends StatefulWidget {
  @override
  _FavoriteProduct createState() => _FavoriteProduct();
}

class _FavoriteProduct extends BaseState<FavoriteProduct> {
  final GetListProvider _getListProvider = GetListProvider();

  final product = FavoriteProductCard(
    image: "photo/sample_product.png",
    description: "Sữa Alene dành cho bé thể tích 320ml...",
    price: "900000",
    datetime: "13/2/2020",
  );

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar:
            getAppBar(title: "Sản phẩm yêu thích"), //S.of(context).myProfile),
        body: Column(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[product, product, product],
            ),
          ),
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}

class FavoriteProductCard extends StatelessWidget {
  final image;
  final description;
  final price;
  final datetime;

  FavoriteProductCard(
      {Key key, this.image, this.description, this.price, this.datetime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeUtil.normalSpace,
          right: SizeUtil.smallSpace,
          left: SizeUtil.smallSpace),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0.0, 3.0),
            )
          ],
          border:
              Border.all(color: Color.fromRGBO(112, 112, 112, 1), width: 0.3)),
      width: double.infinity,
      height: 110,
      child: Card(
        margin: EdgeInsets.only(top: 0),
        child: Row(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              this.image,
              width: 94.0,
              height: 94.0,
            ),
          ),
          Expanded(
            child: Container(
                height: 100,
                padding: EdgeInsets.only(top: 0),
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Text(this.description),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          this.price,
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(this.datetime,
                              style: TextStyle(
                                  color: Color.fromRGBO(10, 133, 158, 1),
                                  fontSize: 12))),
                    ])),
          ),
          Container(
            padding: EdgeInsets.only(top: 40, right: 15),
            child: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 21.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
        ]),
      ),
    );
  }
}
