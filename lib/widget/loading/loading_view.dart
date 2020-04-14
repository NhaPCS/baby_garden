import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final bool isNoData;
  final VoidCallback onReload;

  const LoadingView({Key key, this.isNoData = false, this.onReload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isNoData) {
      return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            S.of(context).no_data,
            textAlign: TextAlign.center,
          ),
          MyRaisedButton(
              onPressed: () {
                if (onReload != null) onReload();
              },
              text: S.of(context).reload,
              textStyle: TextStyle(color: Colors.white),
              color: ColorUtil.primaryColor)
        ],
      ),);
    }
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(ColorUtil.primaryColor),
      ),
    );
  }
}
