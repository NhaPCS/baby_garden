import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'my_text_field.dart';

class PickImageTextField extends StatefulWidget {
  final TextEditingController contentController;
  final int maxLine;
  final String svgImage;
  final ValueNotifier<File> selectedImageController;

  const PickImageTextField(
      {Key key,
      this.contentController,
      this.maxLine = 5,
      this.svgImage = "ic_camera.svg",
      this.selectedImageController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PickImageTextField> {
  File _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            _pickedImage == null
                ? SizedBox()
                : CircleImage(
                    imageFile: _pickedImage,
                    width: 100,
                    height: 100,
                    borderRadius: SizeUtil.tinyRadius,
                    margin: EdgeInsets.only(bottom: SizeUtil.smallSpace),
                  ),
            MyTextField(
              textEditingController: widget.contentController,
              borderRadius: SizeUtil.smallRadius,
              maxLines: widget.maxLine,
              inputType: TextInputType.multiline,
              borderColor: ColorUtil.textGray,
              hint: S.of(context).report_content_hint,
              textStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
            )
          ],
        ),
        Positioned(
          child: ButtonIcon(
            icon: SvgIcon(widget.svgImage),
            onPressed: () {
              WidgetUtil.showPickImageDialog(context, onCameraClick: () async {
                var file =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                setState(() {
                  _pickedImage = file;
                  widget.selectedImageController.value = _pickedImage;
                });
              }, onGalleryClick: () async {
                var file =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  _pickedImage = file;
                  widget.selectedImageController.value = _pickedImage;
                });
              });
            },
          ),
          right: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace,
        )
      ],
    );
  }
}
