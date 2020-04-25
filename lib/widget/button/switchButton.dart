import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class SwitchButton extends StatefulWidget{
  final ValueNotifier<bool> valueController;
  final ValueChanged<bool> valueChanged;

  const SwitchButton({this.valueController, this.valueChanged}):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SwitchButtonState();
  }

}

class _SwitchButtonState extends BaseState<SwitchButton>{
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return ValueListenableBuilder<bool>(
      valueListenable: widget.valueController,
      builder: (BuildContext context, value, Widget child) {
      return Switch(
        value: value,
        onChanged: (bool newValue) {
          widget.valueController.value = newValue;
          if(widget.valueChanged!=null){
            widget.valueChanged(newValue);
          }
        },
        activeColor: ColorUtil.primaryColor,
        inactiveThumbColor: ColorUtil.gray,
      );
    },);
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }

}