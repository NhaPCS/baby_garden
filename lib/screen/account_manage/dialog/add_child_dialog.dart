import 'dart:io';

import 'package:baby_garden_flutter/data/model/baby.dart';
import 'package:baby_garden_flutter/data/model/param.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/select_date_provider.dart';
import 'package:baby_garden_flutter/provider/select_gender_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/profile/widget/change_avatar.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

typedef AddChildCallBack = void Function(
    String name, int gender, String birthday);

class AddChildDialog extends StatefulWidget {
  final AddChildCallBack addChildCallBack;
  final ValueChanged<File> onSelectImage;
  final Baby baby;

  const AddChildDialog(
      {Key key, this.addChildCallBack, this.onSelectImage, this.baby})
      : super(key: key);

  @override
  _ShowAddAddressDialogState createState() => _ShowAddAddressDialogState();
}

class _ShowAddAddressDialogState extends BaseState<AddChildDialog> {
  final TextEditingController _nameController = TextEditingController();
  final SelectGenderProvider _selectGenderProvider = SelectGenderProvider();
  final SelectDateProvider _selectDateProvider = SelectDateProvider();
  var checkDefaultAdd = false;

  @override
  void initState() {
    super.initState();
    if (widget.baby != null) {
      _nameController.text = widget.baby.name;
      _selectGenderProvider.updateGender(widget.baby.gender.index+1);
      _selectDateProvider
          .updateDate(DateUtil.parseBirthdayDate(widget.baby.birthday));
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
      ),
      title: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).addChild,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorUtil.primaryColor,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // title
          Padding(
            padding: const EdgeInsets.only(top: SizeUtil.midSpace),
            child: Center(
              child: ChangeAvatar(
                avatarUrl: widget.baby == null ? null : widget.baby.avatar,
                borderRadius: SizeUtil.tinyRadius,
                width: 92,
                height: 92,
                onSelectImage: widget.onSelectImage,
              ),
            ),
          ),
          Center(
              child: Icon(
            Icons.photo_camera,
            color: ColorUtil.colorAccent,
          )),
          Center(
            child: Text(
              S.of(context).uploadChildAvatar,
              style: TextStyle(
                  color: ColorUtil.colorAccent,
                  fontSize: SizeUtil.textSizeSmall),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeUtil.midSpace,
                left: SizeUtil.midSpace,
                right: SizeUtil.midSpace),
            child: MyTextField(
              borderColor: ColorUtil.colorAccent,
              borderRadius: SizeUtil.tinyRadius,
              borderWidth: 0.5,
              elevation: 3,
              labelText: S.of(context).nameOfChild,
              labelStyle: TextStyle(
                  color: ColorUtil.black33, fontSize: SizeUtil.textSizeSmall),
              textEditingController: _nameController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeUtil.midSpace,
                left: SizeUtil.midSpace,
                right: SizeUtil.midSpace),
            child: ButtonTheme(
              child: RaisedButton(
                onPressed: () {
                  WidgetUtil.showGenderSelectorDialog(context, (gender) {
                    _selectGenderProvider.updateGender(gender);
                  }, initGender: _selectGenderProvider.gender);
                },
                elevation: 3,
                child: SizedBox(
                  child: Consumer<SelectGenderProvider>(
                    builder: (BuildContext context, SelectGenderProvider value,
                        Widget child) {
                      String gender = S.of(context).gender;
                      if (value.gender != null) {
                        gender = value.gender == 1
                            ? S.of(context).boy
                            : S.of(context).girl;
                      }
                      return Text(
                        gender,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: ColorUtil.black33),
                      );
                    },
                  ),
                  width: double.infinity,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorUtil.primaryColor, width: 0.5),
                    borderRadius:
                        BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))),
                color: Colors.white,
              ),
              minWidth: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeUtil.midSpace,
                left: SizeUtil.midSpace,
                right: SizeUtil.midSpace),
            child: ButtonTheme(
              child: RaisedButton(
                onPressed: () {
                  WidgetUtil.showBirthdaySelectorDialog(context, (birthday) {
                    _selectDateProvider.updateDate(birthday);
                  });
                },
                elevation: 3,
                child: SizedBox(
                  child: Consumer<SelectDateProvider>(
                    builder: (BuildContext context, SelectDateProvider value,
                        Widget child) {
                      String dob = S.of(context).dateOfBirth;
                      if (value.date != null) {
                        dob = DateUtil.formatBirthdayDate(value.date);
                      }
                      return Text(
                        dob,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: ColorUtil.black33),
                      );
                    },
                  ),
                  width: double.infinity,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorUtil.primaryColor, width: 0.5),
                    borderRadius:
                        BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))),
                color: Colors.white,
              ),
              minWidth: double.infinity,
            ),
          ),
          SizedBox(height: SizeUtil.defaultSpace),
          dialogBtn(context)
        ],
      ),
    );
  }

  Widget dialogBtn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: SizeUtil.smallSpace,
        ),
        Flexible(
          child: MyRaisedButton(
              matchParent: true,
              padding: EdgeInsets.only(
                top: SizeUtil.midSpace,
                bottom: SizeUtil.midSpace,
              ),
              text: S.of(context).addChild.toUpperCase(),
              textStyle: TextStyle(
                  fontSize: SizeUtil.textSizeSmall, color: Colors.white),
              color: ColorUtil.colorAccent,
              borderRadius: SizeUtil.tinyRadius,
              onPressed: () {
                // add child
                if (!WidgetUtil.verifyParams(context, params: [
                  Param(
                      key: S.of(context).nameOfChild,
                      value: _nameController.text),
                  Param(
                      key: S.of(context).gender,
                      value: _selectGenderProvider.gender),
                  Param(
                      key: S.of(context).date, value: _selectDateProvider.date)
                ])) return;
                widget.addChildCallBack(
                    _nameController.text,
                    _selectGenderProvider.gender,
                    DateUtil.formatBirthdayDate(_selectDateProvider.date));
                Navigator.of(context).pop();
              }),
        ),
        SizedBox(
          width: SizeUtil.midSmallSpace,
        ),
        Flexible(
          child: MyRaisedButton(
              matchParent: true,
              padding: EdgeInsets.only(
                top: SizeUtil.midSpace,
                bottom: SizeUtil.midSpace,
              ),
              text: S.of(context).comeBack.toUpperCase(),
              textStyle: TextStyle(
                  fontSize: SizeUtil.textSizeSmall, color: Colors.white),
              color: Color.fromRGBO(10, 133, 158, 1),
              borderRadius: SizeUtil.tinyRadius,
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        SizedBox(
          width: SizeUtil.smallSpace,
        ),
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _selectGenderProvider),
      ChangeNotifierProvider.value(value: _selectDateProvider),
    ];
  }
}
