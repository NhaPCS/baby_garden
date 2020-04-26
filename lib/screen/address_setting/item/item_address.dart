import 'package:baby_garden_flutter/data/model/address.dart';
import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/address_setting/provider/get_list_address_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef EditAddressCallBack = void Function(String address, String addressId);

class ItemAddress extends StatefulWidget {
  final ValueNotifier<Address> address;
  final isDefault;
  final ValueChanged<String> onDeleteAddress;
  final EditAddressCallBack onEditAddress;


  const ItemAddress(
      {Key key, this.address, this.isDefault = false, this.onDeleteAddress, this.onEditAddress})
      : super(key: key);

  @override
  _ItemAddressState createState() => _ItemAddressState();
}

class _ItemAddressState extends State<ItemAddress> {
  bool isEditting = false;
  final addressFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressFieldCtrl.text = widget.address.value.address;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: widget.address, builder: (context, value, child){
      addressFieldCtrl.text = widget.address.value.address;
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: SizeUtil.defaultSpace, bottom: SizeUtil.defaultSpace),
        margin: EdgeInsets.only(
          left: SizeUtil.midSmallSpace,
          right: SizeUtil.midSmallSpace,
        ),
        decoration: setBorder("bottom", Color.fromRGBO(154, 154, 154, 1), 1),
        child: Container(
          color: isEditting ? Color(0xffFBFBFB) : Colors.white,
          child: Row(
            children: <Widget>[
              Icon(Icons.location_on,
                  color: Colors.blue, size: SizeUtil.iconMidSize),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: SizeUtil.midSmallSpace),
                  child: MyTextField(
                      inputType: TextInputType.multiline,
                      contentPadding: EdgeInsets.only(left: 0),
                      maxLines: null,
                      textStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                      isBorder: false,
                      enable: isEditting,
                      textEditingController: addressFieldCtrl),
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
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditting = true;
                    });
                  },
                  child: Stack(
                    children: [
                      Visibility(
                        visible: !isEditting,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: SizeUtil.midSmallSpace),
                          child: Text(
                            S.of(context).edit,
                            style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isEditting,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                right: SizeUtil.midSmallSpace, top: 5, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () => editAddress(),
                                  child: Text(
                                    S.of(context).done,
                                    style: TextStyle(
                                        fontSize: SizeUtil.textSizeSmall),
                                  ),
                                ),
                                SizedBox(height: 15),
                                SvgIcon('delete.svg',
                                    onPressed: () => deleteAddr())
                              ],
                            )),
                      )
                    ],
                  )),
            ],
          ),
        ),
      );
    },);

  }

  void editAddress() async {
    final newAdd = addressFieldCtrl.text.trim();

    if (newAdd == widget.address.value.address) {
      setState(() {
        isEditting = false;
      });
      return;
    }

    widget.onEditAddress(newAdd,widget.address.value.id );
    setState(() {
      isEditting = false;
    });
  }

  void deleteAddr() async {
    widget.onDeleteAddress(widget.address.value.id);
    setState(() {
      isEditting = false;
    });
  }
}
