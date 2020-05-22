import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/cupertino.dart';

class CommentBottomSheetDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(SizeUtil.smallSpace),
      width: double.infinity,
      height: MediaQuery.of(context).size.height/2,
      child: ListView(
        children: List.generate(
            10,
            (index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleImage(
                      imageUrl: StringUtil.dummyImage,
                      width: SizeUtil.iconSizeBig,
                      height: SizeUtil.iconSizeBig,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: SizeUtil.smallSpace),
                        padding: EdgeInsets.all(SizeUtil.smallSpace),
                        decoration: BoxDecoration(
                          color: ColorUtil.lineService,
                          borderRadius:BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Tran Nguyen Tue Lam",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeUtil.textSizeDefault),
                            ),
                            Text(
                              "Co khi trong nay Co khi trong nay Co khi trong nay Co khi trong nay Co khi trong nay Co khi trong nay Co khi trong nay Co khi trong nay ",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: SizeUtil.textSizeDefault),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
