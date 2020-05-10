import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/personal_notice_screen/provider/personal_notice_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PersonalNoticeScreen extends StatefulWidget {
  final String notifyId;

  const PersonalNoticeScreen({this.notifyId}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonalNoticeScreenState();
  }
}

class _PersonalNoticeScreenState extends BaseState<PersonalNoticeScreen> {
  final PersonalNoticeProvider _personalNoticeProvider =
      new PersonalNoticeProvider();

  @override
  void initState() {
    // TODO: implement initState
    _personalNoticeProvider.getNotifyDetail(notifyId: widget.notifyId);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(title: "Hello "),
      body: Consumer<PersonalNoticeProvider>(
        builder:
            (BuildContext context, PersonalNoticeProvider value, Widget child) {
          if (value.detail == null) {
            return Container();
          }
          return ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                margin: EdgeInsets.only(
                    top: SizeUtil.tinySpace,
                    left: SizeUtil.tinySpace,
                    right: SizeUtil.tinySpace),
                padding: EdgeInsets.only(
                    left: 0,
                    right: SizeUtil.tinySpace,
                    top: SizeUtil.tinySpace,
                    bottom: SizeUtil.smallSpace),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(SizeUtil.smallSpace),
                      child: Container(
                        child: CachedNetworkImage(
                          imageUrl: value.detail['shop_img'] == null
                              ? StringUtil.dummyImage
                              : value.detail['shop_img'],
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.width / 6,
                          fit: BoxFit.cover,
                        ),
                        color: ColorUtil.logoBgColor,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            value.detail['title'],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeBigger,
                                fontWeight: FontWeight.bold,
                                color: ColorUtil.textHint),
                          ),
                          SizedBox(
                            height: SizeUtil.tinySpace,
                          ),
                          Text(
                            S.of(context).send_by(value.detail['shop_name']),
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.textHint),
                          ),
                          SizedBox(
                            height: SizeUtil.tinySpace,
                          ),
                          Text(
                            S.of(context).date + value.detail['date'],
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: ColorUtil.textHint),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(left: SizeUtil.tinySpace),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(SizeUtil.tinySpace),
                child: Text(
                  value.detail['content'],
                  style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _personalNoticeProvider)];
  }
}
