import 'package:baby_garden_flutter/data/model/product.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  // TODO-QAnh: vì là sản phẩm yêu thích nên em nghĩ lúc nào favorite chả bằng true?
  // cái này dùng chung cho sản phẩm yêu thích và sản phẩm đã xem nhé
  final Function onTap;
  ProductItem({Key key, this.onTap, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(product.isFavorite);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(
            top: SizeUtil.normalSpace,
            right: SizeUtil.smallSpace,
            left: SizeUtil.smallSpace),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtil.tinyRadius),
        ),
        elevation: SizeUtil.defaultElevation,
        child: Row(children: <Widget>[
          SizedBox(width: SizeUtil.smallSpace),
          Flexible(
            child: ClipRRect(
              child: Image.network(
                product.image[0],
                fit: BoxFit.cover,
                width: 94.0,
                height: 94.0,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
                padding: SizeUtil.defaultPadding,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(product.name),
                      SizedBox(height: SizeUtil.tinySpace),
                      Text(
                        StringUtil.getPriceText(product.price),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: SizeUtil.textSizeBigger),
                      ),
                      SizedBox(height: SizeUtil.tinySpace),
                      Row(
                        children: <Widget>[
                          Text(DateUtil.formatDDMMyyyy(product.date),
                              style: TextStyle(
                                  color: Color.fromRGBO(10, 133, 158, 1),
                                  fontSize: SizeUtil.textSizeSmall)),
                          Spacer(),
                          Icon(
                            Icons.favorite,
                            color: product.isFavorite == true
                                ? Colors.pink
                                : Colors.white,
                            size: SizeUtil.iconSizeBigger,
                          ),
                        ],
                      ),
                    ])),
          ),
        ]),
      ),
    );
  }
}
