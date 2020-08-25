import 'package:baby_garden_flutter/data/model/address.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatefulWidget {
  final dynamic address;
  final isDefault;
  final VoidCallback onDeleteAddress;
  final VoidCallback onEditAddress;

  const AddressItem(
      {Key key,
      this.address,
      this.isDefault = false,
      this.onDeleteAddress,
      this.onEditAddress})
      : super(key: key);

  @override
  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: SizeUtil.defaultSpace, bottom: SizeUtil.defaultSpace),
        margin: EdgeInsets.only(
          left: SizeUtil.midSmallSpace,
          right: SizeUtil.midSmallSpace,
        ),
        decoration: setBorder("bottom", Color.fromRGBO(154, 154, 154, 1), 1),
        child: Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(SizeUtil.tinyRadius)),
              color: Color(0xffFBFBFB)),
          padding: SizeUtil.smallPadding,
          child: Row(
            children: <Widget>[
              Icon(Icons.location_on,
                  color: Colors.blue, size: SizeUtil.iconMidSize),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: SizeUtil.midSmallSpace),
                  child: MyText(widget.address['address']),
                ),
              ),
              widget.isDefault
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: SizeUtil.midSmallSpace),
                      child: Text(
                        "(${S.of(context).isDefault})",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: SizeUtil.textSizeSmall),
                      ),
                    )
                  : SizedBox(),
              SvgIcon('delete.svg', onPressed: (){
                WidgetUtil.showConfirmDialog(context, title: S.of(context).confirm, message: S.of(context).mess_confirm_delete, positiveClicked: (){
                  widget.onDeleteAddress();
                });
              })
            ],
          ),
        ),
      ),
      onTap: widget.onEditAddress,
    );
  }

}
