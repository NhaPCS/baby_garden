import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewMoreProduct extends StatelessWidget {
  final VoidCallback onViewMoreClick;

  const ViewMoreProduct({Key key, this.onViewMoreClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onViewMoreClick,
      child: Container(
        margin: EdgeInsets.only(
          bottom: SizeUtil.tinySpace,
          left: SizeUtil.superTinySpace,
          right: SizeUtil.superTinySpace,
        ),
        color: Colors.white,
        width: Provider.of<AppProvider>(context).productWidth,
        alignment: Alignment.center,
        child: Wrap(
          direction: Axis.vertical,
          spacing: SizeUtil.tinySpace,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: ColorUtil.primaryColor,
              ),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeUtil.iconSize)),
                  border: Border.all(color: ColorUtil.primaryColor, width: 2)),
            ),
            Text(
              S.of(context).view_all,
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: SizeUtil.textSizeDefault),
            )
          ],
        ),
      ),
    );
  }
}
