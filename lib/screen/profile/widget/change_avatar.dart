import 'dart:io';

import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeAvatar extends StatefulWidget {
  final String avatarUrl;
  final ValueChanged<File> onSelectImage;

  const ChangeAvatar({Key key, this.avatarUrl, this.onSelectImage})
      : super(key: key);
  @override
  _ChangeAvatar createState() => _ChangeAvatar();
}

class _ChangeAvatar extends State<ChangeAvatar> {
  File _pickedImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ImageUtil.uploadImage(context, (value) {
          setState(() {
            _pickedImage = value;
            widget.onSelectImage(value);
          });
        });
      },
      child: CircleImage(
          imageFile: _pickedImage,
          imageUrl: _pickedImage == null ? widget.avatarUrl : null,
          width: SizeUtil.iconSizeLarge,
          height: SizeUtil.iconSizeLarge),
    );
  }
}
