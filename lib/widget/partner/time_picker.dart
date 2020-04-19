import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class TimePicker extends StatefulWidget{
  final ValueNotifier<int> valueController;
  const TimePicker({ this.valueController }):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TimePickerState();
  }

}

class _TimePickerState extends BaseState<TimePicker>{
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return ValueListenableBuilder<int>(
      valueListenable: widget.valueController,
      builder: (context,value,child){
        return Container(
          height: MediaQuery.of(context).size.width / 3.50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 0.5),
            padding: EdgeInsets.all(0),
            itemCount: StringUtil.time.length,
            itemBuilder: (context, index) {
              bool isSelected = value == index;
              print(StringUtil.time[index]['off']);
              return StringUtil.time[index]['off'] == null
                  ? GestureDetector(
                  onTap: () {
                    if (value != index) {
                      widget.valueController.value = index ;
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(1),
                    color: isSelected
                        ? Color(0xffFF7700)
                        : ColorUtil.lineColor,
                    child: Center(
                      child: Text(
                        StringUtil.time[index]['time'],
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeTiny,
                            color: isSelected
                                ? Colors.white
                                : ColorUtil.textColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
                  : Container(
                margin: EdgeInsets.all(1),
                color: ColorUtil.red,
                child: Center(
                  child: Text(
                    StringUtil.time[index]['time'],
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeTiny,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }

}