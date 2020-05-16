import 'dart:io';

import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeAvatar extends StatefulWidget {
  final String avatarUrl;
  final ValueChanged<File> onSelectImage;
  final double borderRadius;
  final double width;
  final double height;

  const ChangeAvatar(
      {Key key,
      this.avatarUrl,
      this.onSelectImage,
      this.borderRadius,
      this.width = SizeUtil.iconSizeLarge,
      this.height = SizeUtil.iconSizeLarge})
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
        if (widget.onSelectImage == null) return;

        WidgetUtil.showPickImageDialog(context, onCameraClick: () async {
          var pickedImage =
              await ImagePicker.pickImage(source: ImageSource.camera);
          setState(() {
            if (_pickedImage == null) return;
            _pickedImage = pickedImage;

            widget.onSelectImage(pickedImage);
          });
        }, onGalleryClick: () async {
          var pickedImage =
              await ImagePicker.pickImage(source: ImageSource.gallery);
          setState(() {
            if (_pickedImage == null) return;
            _pickedImage = pickedImage;
            widget.onSelectImage(pickedImage);
          });
        });
      },
      child: CircleImage(
        imageFile: _pickedImage,
        imageUrl: _pickedImage == null ? widget.avatarUrl : null,
        width: widget.width,
        height: widget.height,
        borderRadius: widget.borderRadius,
      ),
    );
  }
}
