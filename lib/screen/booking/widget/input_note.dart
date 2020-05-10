import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputNote extends StatelessWidget {
  final TextEditingController noteController;

  const InputNote({this.noteController}):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //todo note
        Padding(
          padding: const EdgeInsets.only(
              left: SizeUtil.smallSpace, top: SizeUtil.smallSpace),
          child: Text(
            S.of(context).booking_note,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: SizeUtil.smallSpace,
              right: SizeUtil.midSpace,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace),
          child: TextField(
            controller: noteController,
            style: TextStyle(fontSize: SizeUtil.textSizeSmall),
            obscureText: false,
            decoration: InputDecoration(
                fillColor: Color(0xffF3F3F3),
                filled: true,
                border: OutlineInputBorder(),
                hintText: S.of(context).enter_your_note,
                hintStyle: TextStyle(fontSize: SizeUtil.textSizeSmall),
                contentPadding: EdgeInsets.only(
                    left: SizeUtil.midSmallSpace,
                    right: SizeUtil.tinySpace,
                    top: SizeUtil.tinySpace)),
          ),
        ),
        WidgetUtil.getLine(margin: EdgeInsets.all(0)),
      ],
    );
  }
}
