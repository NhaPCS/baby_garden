import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class SwitchButtonTitle extends StatefulWidget {
  final String settingType;
  final String title;
  final Function onChange;
  const SwitchButtonTitle({this.settingType = "", this.title, this.onChange}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SwitchButtonTitleState();
  }
}

class _SwitchButtonTitleState extends BaseState<SwitchButtonTitle> {
  ValueNotifier<bool> isEnable = new ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    ShareValueProvider.shareValueProvider
        .getSetting(widget.settingType)
        .then((value) => isEnable.value = value==null?false:value);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return ValueListenableBuilder<bool>(
      valueListenable: isEnable,
      builder: (BuildContext context, bool value, Widget child) {
        return SwitchListTile(
          value: isEnable.value,
          onChanged: (bool newValue) {
            print(" change ");
            if(widget.onChange!= null){
              widget.onChange(newValue);
            }
            isEnable.value = newValue;
            ShareValueProvider.shareValueProvider.saveSetting(widget.settingType, newValue);
          },
          title: Text(
            widget.title,
            textAlign: TextAlign.start,
            style:
                TextStyle(fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
          ),
          activeColor: ColorUtil.primaryColor,
          inactiveThumbColor: ColorUtil.gray,
        );
      },
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
