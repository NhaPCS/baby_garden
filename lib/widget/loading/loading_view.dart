import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final bool isNoData;
  final VoidCallback onReload;
  final String title;

  const LoadingView({Key key, this.isNoData = false, this.onReload, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isNoData) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("photo/logo_dim.png", width: 50,),
            SizedBox(height: SizeUtil.smallSpace,),
            Text(
              title == null ? S.of(context).no_data : title,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtil.textGray),
            ),
          ],
        ),
      );
    }
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(ColorUtil.primaryColor),
      ),
    );
  }
}
