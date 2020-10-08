import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/child_health_suggest_product/list_product_screen.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/painter/draw_triangle.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

const double height = 30;
const double width = 50;

class ListSuggestForChild extends StatelessWidget {
  final List<dynamic> products;

  const ListSuggestForChild({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products == null) return SizedBox();
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            dynamic product = products[index];
            return InkWell(
              onTap: () {
                RouteUtil.push(
                    context,
                    ProductDetailScreen(
                      productId: product['id'],
                    ));
              },
              child: CircleImage(
                width: 100,
                height: 100,
                borderRadius: SizeUtil.smallRadius,
                imageUrl: product['product_image'] == null ||
                        product['product_image'].isEmpty
                    ? ''
                    : (product['product_image'][0]['img'] ?? ''),
              ),
            );
          }),
      height: 120,
    );
  }
}
