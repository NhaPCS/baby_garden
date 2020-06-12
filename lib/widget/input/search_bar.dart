import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchTextController;
  final bool enable;
  final Widget trailing;
  final bool hasBack;
  final VoidCallback onPressed;
  final VoidCallback onQrPressed;
  final EdgeInsets padding;
  final ValueChanged<String> onSearchTextChanged;
  final Function(String) onSubmit;

  const SearchBar(
      {Key key,
      this.searchTextController,
      this.enable = true,
      this.trailing,
      this.hasBack = false,
      this.onPressed,
      this.padding,
      this.onSearchTextChanged,
      this.onSubmit,
      this.onQrPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding != null
          ? padding
          : EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + SizeUtil.smallSpace,
              left: SizeUtil.smallSpace),
      child: Row(
        children: <Widget>[
          hasBack
              ? InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeUtil.tinySpace,
                        right: SizeUtil.smallSpace,
                        top: SizeUtil.smallSpace,
                        bottom: SizeUtil.smallSpace),
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              : SizedBox(),
          Expanded(
            child: onPressed != null
                ? GestureDetector(
                    child: inputWidget(context),
                    onTap: onPressed,
                  )
                : inputWidget(context),
          ),
          trailing == null
              ? SizedBox(
                  height: 0,
                  width: 0,
                )
              : trailing
        ],
      ),
    );
  }

  Widget inputWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        MyTextField(
          elevation: SizeUtil.defaultElevation,
          textEditingController: searchTextController,
          borderRadius: SizeUtil.tinyRadius,
          enable: enable,
          hint: S.of(context).search_hint,
          onChanged: onSearchTextChanged,
          onSubmitted: onSubmit,
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
          child: InkWell(
            child: SvgIcon(
              'ic_qr.svg',
              width: SizeUtil.iconSizeBigger,
              color: ColorUtil.textHint,
            ),
            onTap: onQrPressed,
          ),
          right: SizeUtil.smallSpace,
        )
      ],
    );
  }
}
