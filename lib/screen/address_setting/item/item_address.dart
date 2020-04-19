import 'package:baby_garden_flutter/data/model/address.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO-QAnh: bỏ fix cứng kích thước
class ItemAddress extends StatelessWidget {
  final Address address;
  final isDefault;

  const ItemAddress({Key key, this.address, this.isDefault = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // TODO-QAnh: bỏ set height
      height: 63,
      margin: EdgeInsets.only(left: 8, right: 8),
      decoration: setBorder("bottom", Color.fromRGBO(154, 154, 154, 1), 1),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            color: Colors.blue,
            size: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(address.address),
          ),
          Expanded(
            // TODO-QAnh: phần này có thể check bằng cách isDefault? Padding(): SizeBox()
            child: Visibility(
              visible: isDefault,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "(${S.of(context).isDefault})",
                  style: TextStyle(color: Colors.orange, fontSize: 12),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                S.of(context).edit,
                style: TextStyle(fontSize: SizeUtil.textSizeSmall),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
