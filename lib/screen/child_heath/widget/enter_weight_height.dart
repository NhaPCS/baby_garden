import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';

class EnterWeightHeight extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController noteController;
  final ValueNotifier<File> imageController;

  const EnterWeightHeight(
      {Key key,
      this.heightController,
      this.weightController,
      this.noteController,
      this.imageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: SizeUtil.defaultPadding,
      children: <Widget>[
        Text(
          S.of(context).enter_all_value_child,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorUtil.blueLight, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeUtil.defaultSpace,
        ),
        MyTextField(
          textEditingController: heightController,
          hint: S.of(context).enter_baby_height,
          inputType: TextInputType.number,
          suffix: Padding(
            padding: SizeUtil.smallPadding,
            child: Text(
              S.of(context).cm_unit,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtil.primaryColor),
            ),
          ),
          borderRadius: 10,
          borderColor: ColorUtil.primaryColor,
          elevation: 2,
        ),
        SizedBox(
          height: SizeUtil.defaultSpace,
        ),
        MyTextField(
          textEditingController: weightController,
          hint: S.of(context).enter_baby_weight,
          inputType: TextInputType.number,
          suffix: Padding(
            padding: SizeUtil.smallPadding,
            child: Text(
              S.of(context).kg_unit,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtil.primaryColor),
            ),
          ),
          borderRadius: 10,
          borderColor: ColorUtil.primaryColor,
          elevation: 2,
        ),
        SizedBox(
          height: SizeUtil.defaultSpace,
        ),
        MyTextField(
          textEditingController: noteController,
          maxLines: 5,
          hint: S.of(context).enter_baby_note,
          borderRadius: 10,
          borderColor: ColorUtil.primaryColor,
          elevation: 2,
        ),
        SizedBox(
          height: SizeUtil.defaultSpace,
        ),
        InkWell(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: ColorUtil.primaryColor, width: 1)),
            child: ValueListenableBuilder(
                valueListenable: imageController,
                builder: (context, value, child) {
                  Color textColor = value == null
                      ? ColorUtil.primaryColor
                      : Colors.white.withOpacity(0.8);
                  return Stack(
                    children: <Widget>[
                      value != null
                          ? Image.file(value, width: double.infinity)
                          : SizedBox(
                              height: 200,
                            ),
                      Positioned(
                        child: Container(
                          padding: SizeUtil.smallPadding,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.camera_alt,
                                color: textColor,
                                size: 100,
                              ),
                              Text(
                                S.of(context).click_on_here,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: SizeUtil.textSizeSmall),
                              ),
                              Padding(
                                padding: SizeUtil.smallPadding,
                                child: Text(
                                  S.of(context).child_take_photo_desc,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: textColor),
                                ),
                              ),
                            ],
                          ),
                          color:
                              Colors.black.withOpacity(value == null ? 0 : 0.1),
                        ),
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                      )
                    ],
                  );
                }),
          ),
          onTap: () {
            WidgetUtil.showPickImageDialog(context, onCameraClick: () async {
              var pickedImage =
                  await ImagePicker.pickImage(source: ImageSource.camera);
              if (pickedImage != null) {
                imageController.value = pickedImage;
              }
            }, onGalleryClick: () async {
              var pickedImage =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              imageController.value = pickedImage;
            });
          },
        )
      ],
    );
  }
}
