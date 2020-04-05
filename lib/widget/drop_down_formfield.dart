import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownFormField extends StatelessWidget {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final int value;

  DropDownFormField(
      {Key key,
      this.titleText = 'Title',
      this.hintText = 'Select one option',
      this.required = false,
      this.errorText = 'Please select one option',
      this.dataSource,
      this.value,
      this.textField,
      this.valueField,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputDecorator(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 0),
                labelText: titleText,
                labelStyle: TextStyle(fontSize: 20, color: ColorUtil.textColor),
                filled: false,
                border: InputBorder.none),
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: DropdownButton<int>(
                isDense: true,
                // remove dropdown padding
                underline: WidgetUtil.getLine(
                    width: 1,
                    margin: EdgeInsets.all(0),
                    color: Colors.grey.shade500),
                isExpanded: true,
                hint: Text(
                  hintText,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      color: Colors.grey.shade500),
                ),
                value: value,
                onChanged: (int newValue) {
                  if (onChanged != null) onChanged(newValue);
                },
                items: List.generate(dataSource!=null?dataSource.length:0, (index) {
                  var source = dataSource[index];
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(
                      source[textField],
                      style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
