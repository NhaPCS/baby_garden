import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO-QAnh: cái này là 1 item trng list, tên phải kêt thúc bằng chữ Item
class ProductCard extends StatelessWidget {
  // TODO-QAnh: không để quá nhiều param con như thế này, nó gộp chung vào 1 object product thôi
  final image;
  final description;
  final price;
  final datetime;
  // TODO-QAnh: vì là sản phẩm yêu thích nên em nghĩ lúc nào favorite chả bằng true?
  final favorite;
  final Function onTap;

  ProductCard(
      {Key key,
      this.image,
      this.description,
      this.price,
      this.datetime,
      this.onTap,
      this.favorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: SizeUtil.normalSpace,
            right: SizeUtil.smallSpace,
            left: SizeUtil.smallSpace),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                // TODO-QAnh: k fix cứng số liệu
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0.0, 3.0),
              )
            ],
            // TODO-QAnh: k fix cứng số liệu
            border: Border.all(
                color: Color.fromRGBO(112, 112, 112, 1), width: 0.3)),
        width: double.infinity,
        // TODO-QAnh: không set height cho Container, set size cho image, và wrap content, tránh trường hợp bị mất view nếu content quá dài
        height: 110,
        child: Card(
          // TODO-QAnh: nếu ở đây có card rồi thì không cần conatiner trên nữa, vì card đã có shape để set border và set margin
          margin: EdgeInsets.only(top: 0),
          child: Row(children: <Widget>[
            // TODO-QAnh: em thấy design không cần border cho image
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
                // TODO-QAnh: set height như này có thể làm mất content khi content qúa dài
                  height: 100,
                  padding: EdgeInsets.only(top: 0),
                  // TODO-QAnh: sao lại dùng ListView ở đây? thay bằng Column cho hợp lý
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Text(this.description),
                        // TODO-QAnh: bỏ Padding ra, muốn marginTop thì có thê thêm 1 SizeBox(height: 5)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            // TODO-QAnh: khi muốn hiển thị giá tiền thì dùng StringUtil.getPriceText
                            this.price + ' đ',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                        // TODO-QAnh: bỏ Padding ra, muốn marginTop thì có thê thêm 1 SizeBox(height: 5)
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(this.datetime,
                                style: TextStyle(
                                    color: Color.fromRGBO(10, 133, 158, 1),
                                    fontSize: 12))),
                      ])),
            ),
            // TODO-QAnh:nếu chỉ dùng padding thì thay bằng Padding, không dùng Container
            Container(
              padding: EdgeInsets.only(top: 40, right: 15),
              child: Icon(
                Icons.favorite,
                color: favorite == true ? Colors.pink : Colors.white,
                size: 21.0,
                // TODO-QAnh: cái này bỏ đi, k dùng
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
