import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final bool isNoData;
  final VoidCallback onReload;
  final String title;
  final bool showButton;
  final String buttonLabel;

  const LoadingView(
      {Key key,
      this.isNoData = false,
      this.onReload,
      this.title,
      this.showButton = false,
      this.buttonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isNoData) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            !showButton
                ? Image.asset(
                    "photo/logo_dim.png",
                    width: 50,
                  )
                : SizedBox(),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Text(
                title == null ? S.of(context).no_data : title,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorUtil.textGray),
              ),
            ),
            showButton
                ? MyRaisedButton(
                    onPressed: () {
                      if (onReload != null) onReload();
                    },
                    text: buttonLabel ?? S.of(context).reload,
                    textStyle: TextStyle(color: Colors.white),
                    color: ColorUtil.primaryColor)
                : SizedBox()
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
