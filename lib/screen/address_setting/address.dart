import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  final address;
  final isDefault;

  const Address({Key key, this.address, this.isDefault}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
            child: Text(address),
          ),
          Expanded(
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
              child: Text(S.of(context).edit),
            ),
          ),
        ],
      ),
    );
  }
}
