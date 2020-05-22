
import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/dialogue/comment_bottom_sheet_dialogue.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/provider/news_detail_provider.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/view_model/vcb_express_detail_view_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class VCBExpressDetailScreen extends StatefulWidget {
  final String newsID;
  VCBExpressDetailScreen(this.newsID):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VCBExpressDetailScreenState();
  }
}

class _VCBExpressDetailScreenState extends BaseStateModel<VCBExpressDetailScreen,VCBExpressDetailViewModel> {
  final TextEditingController _commentController = TextEditingController();
  final NewsDetailProvider _newsDetailProvider = NewsDetailProvider();
  @override
  void initState() {
    // TODO: implement initState
    _newsDetailProvider.getNewsDetail(widget.newsID);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(title: S.of(context).vcb_express.toUpperCase()),
      body: Consumer<NewsDetailProvider>(builder: (BuildContext context, NewsDetailProvider value, Widget child) {
        if(value.currentDetail == null) return LoadingView();
        return Column(children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.smallSpace),
              child: ListView(children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText(
                      value.currentDetail['title'],
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeBigger,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    Text(
                      S.of(context).vcb_ex_detail_post_time(value.currentDetail['date']),
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeExpressDetail,
                          fontWeight: FontWeight.bold,
                          color: ColorUtil.textHint),
                    ),
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    Text(
                      value.currentDetail['title'],
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeExpressDetail,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    Text(
                      value.currentDetail['content'],
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: SizeUtil.tinySpace,
                    ),
                    Card(
                      child:
                      CachedNetworkImage(imageUrl: value.currentDetail['img'],width: MediaQuery.of(context).size.width)
                    ),
                    SizedBox(
                      height: SizeUtil.tinySpace,
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeExpressDetail,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Container(
            color: ColorUtil.lineColor,
            padding: EdgeInsets.only(
                top: SizeUtil.tinySpace,
                left: SizeUtil.midSmallSpace,
                right: SizeUtil.midSmallSpace,
                bottom: SizeUtil.midSmallSpace),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: MyTextField(
                    textStyle:
                    TextStyle(fontSize: SizeUtil.textSizeExpressTitle),
                    elevation: SizeUtil.defaultElevation,
                    textEditingController: _commentController,
                    maxLines: 1,
                    borderRadius: SizeUtil.bigRadius,
                    hint: S.of(context).vcb_ex_detail_ctm_hint,
                    contentPadding: EdgeInsets.only(
                        left: SizeUtil.midSpace,
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.midSmallSpace,
                        right: SizeUtil.smallSpace),
                    borderColor: Colors.white,
                    ontap: () {},
                    onChanged: (text) {},
                  ),
                ),
                SizedBox(
                  width: SizeUtil.tinySpace,
                ),
                GestureDetector(
                  onTap: (){
                    getViewModel().sendComment(_commentController.text, value.currentDetail['id']);
                  },
                  child: Icon(
                    Icons.send,
                    color: ColorUtil.colorAccent,
                    size: SizeUtil.iconSizeBigger,
                  ),
                ),
                SizedBox(
                  width: SizeUtil.tinySpace,
                ),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(context: context, builder: (context){
                      return CommentBottomSheetDialogue();
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: SizeUtil.smallPadding,
                        child: Image.asset(
                          "photo/comment_img.png",
                          width: SizeUtil.iconSizeBigger,
                          height: SizeUtil.iconSizeBigger,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 18,
                          height: 12,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorUtil.primaryColor),
                          child: AutoSizeText(
                            "12",
                            minFontSize: 8,
                            maxFontSize: 10,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        right: 2,
                        top: 5,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeUtil.tinySpace,
                ),
                GestureDetector(
                  onTap: (){
                    Share.share(S.of(context).share_content);
                  },
                  child: Icon(
                    Icons.share,
                    color: ColorUtil.gray,
                  ),
                )
              ],
            ),
          ),
        ]);
      },),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _newsDetailProvider)];
  }

  @override
  initViewModel() {
    // TODO: implement initViewModel
    return new VCBExpressDetailViewModel(context);
  }
}
