import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_health_suggest_product/list_product_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/painter/draw_triangle.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

const double height = 30;
const double width = 50;

class ListSuggestForChild extends StatelessWidget {
  final dynamic category;

  const ListSuggestForChild({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(" CATE ${category}");
    if (category == null) return SizedBox();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        InkWell(
          onTap: () {
            RouteUtil.push(
                context,
                ChildHealthSuggestProductsScreen(
                  title: category['name'],
                  products: category['list_product'],
                ));
          },
          child: Row(
            children: <Widget>[
              Container(
                height: height,
                width: 100,
                color: ColorUtil.primaryColor,
                alignment: Alignment.center,
                child: MyText(
                  category['name'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                child: CustomPaint(
                  painter:
                      DrawTriangle(color: ColorUtil.primaryColor, offsets: [
                    Offset(width, height),
                    Offset(0, height),
                  ]),
                ),
                height: height,
                width: width,
              ),
              Expanded(child: SizedBox()),
              Text(
                S.of(context).view_more,
                style: TextStyle(color: ColorUtil.primaryColor),
              )
            ],
          ),
        ),
        WidgetUtil.getLine(
            color: ColorUtil.primaryColor,
            width: 1,
            margin: EdgeInsets.only(top: 0)),
        SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: category['list_product'] == null
                  ? 0
                  : category['list_product'].length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                dynamic product = category['list_product'][index];
                return Center(
                  child: CircleImage(
                    width: 100,
                    height: 100,
                    borderRadius: SizeUtil.smallRadius,
                    imageUrl: product['image'] == null
                        ? ''
                        : product['image'].isEmpty ? '' : product['image'][0],
                  ),
                );
              }),
          height: 120,
        )
      ],
    );
  }
}
