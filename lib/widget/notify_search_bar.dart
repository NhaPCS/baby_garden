import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_text_field.dart';

class NotifySearchbar extends StatelessWidget{
  final TextEditingController searchTextController;

  const NotifySearchbar({Key key, this.searchTextController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + SizeUtil.smallSpace,
          left: SizeUtil.smallSpace),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  MyTextField(
                    elevation: SizeUtil.defaultElevation,
                    textEditingController: searchTextController,
                    borderRadius: SizeUtil.tinyRadius,
                    hint: S.of(context).search_hint,
                    contentPadding: EdgeInsets.only(
                        left: SizeUtil.hugSpace,
                        right: SizeUtil.hugSpace,
                        top: SizeUtil.smallSpace,
                        bottom: SizeUtil.smallSpace),
                    borderColor: Colors.white,
                  ),
                  Positioned(
                    child: Icon(
                      CupertinoIcons.search,
                      color: ColorUtil.textHint,
                    ),
                    left: SizeUtil.smallSpace,
                  ),
                  Positioned(
                    child: SvgIcon(
                      'ic_qr.svg',
                      width: SizeUtil.iconSizeBigger,
                      color: ColorUtil.textHint,
                    ),
                    right: SizeUtil.smallSpace,
                  )
                ],
              )),
          SvgIcon(
            'ic_bell.svg',
            padding: SizeUtil.tinyPadding,
            color: Colors.white,
            onPressed: () {
              //TODO
            },
          )
        ],
      ),
    );
  }


}