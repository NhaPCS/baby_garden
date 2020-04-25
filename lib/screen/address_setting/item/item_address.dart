import 'package:baby_garden_flutter/data/model/address.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemAddress extends StatelessWidget {
  final Address address;
  final isDefault;

  const ItemAddress({Key key, this.address, this.isDefault = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: SizeUtil.defaultSpace, bottom: SizeUtil.defaultSpace),
      margin: EdgeInsets.only(
        left: SizeUtil.midSmallSpace,
        right: SizeUtil.midSmallSpace,
      ),
      decoration: setBorder("bottom", Color.fromRGBO(154, 154, 154, 1), 1),
      child: Row(
        children: <Widget>[
          Icon(Icons.location_on,
              color: Colors.blue, size: SizeUtil.iconMidSize),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: SizeUtil.midSmallSpace),
              child: Text(address.address),
            ),
          ),
          isDefault
              ? Padding(
                  padding: const EdgeInsets.only(left: SizeUtil.midSmallSpace),
                  child: Text(
                    "(${S.of(context).isDefault})",
                    style: TextStyle(
                        color: Colors.orange, fontSize: SizeUtil.textSizeSmall),
                  ),
                )
              : SizedBox(),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: SizeUtil.midSmallSpace),
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
