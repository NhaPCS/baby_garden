import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/data/dynamic_link_service.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/dialogue/comment_bottom_sheet_dialogue.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/provider/list_comment_provider.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/provider/news_detail_provider.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/view_model/vcb_express_detail_view_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class VCBExpressDetailScreen extends StatefulWidget {
  final String newsID;

  VCBExpressDetailScreen(this.newsID) : super();

  @override
  State<StatefulWidget> createState() {
    return _VCBExpressDetailScreenState();
  }
}

class _VCBExpressDetailScreenState
    extends BaseStateModel<VCBExpressDetailScreen, VCBExpressDetailViewModel> {
  final TextEditingController _commentController = TextEditingController();
  final NewsDetailProvider _newsDetailProvider = NewsDetailProvider();
  final ListCommentProvider _listCommentProvider = ListCommentProvider();

  @override
  void initState() {
    super.initState();
    _newsDetailProvider.getNewsDetail(widget.newsID);
    _listCommentProvider.getListComment(widget.newsID);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(title: S.of(context).vcb_express.toUpperCase()),
      body: Consumer<NewsDetailProvider>(
        builder:
            (BuildContext context, NewsDetailProvider value, Widget child) {
          if (value.currentDetail == null) return LoadingView();
          bool isComment = value.currentDetail['is_comment'] != null &&
              value.currentDetail['is_comment'] == '1';
          return Column(children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: SizeUtil.smallSpace,
                    right: SizeUtil.smallSpace,
                    top: SizeUtil.smallSpace),
                child: Column(
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
                      "${value.currentDetail['category_name'] ?? ''} | ${value.currentDetail['date']}",
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeExpressDetail,
                          fontWeight: FontWeight.bold,
                          color: ColorUtil.textHint),
                    ),
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Html(
                          data: value.currentDetail['content'] ?? '',
                        ),
                      ),
                    ),
                  ],
                ),
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
                      enable: isComment,
                      textStyle:
                          TextStyle(fontSize: SizeUtil.textSizeExpressTitle),
                      elevation: SizeUtil.defaultElevation,
                      textEditingController: _commentController,
                      maxLines: 1,
                      backgroundColor:
                          isComment ? Colors.white : ColorUtil.lightGray,
                      borderRadius: SizeUtil.bigRadius,
                      hint: isComment
                          ? S.of(context).vcb_ex_detail_ctm_hint
                          : S.of(context).vcb_can_not_comment,
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
                    onTap: () async {
                      if (_commentController.text == null ||
                          _commentController.text.isEmpty) {
                        return;
                      }
                      await getViewModel().sendComment(
                          _commentController.text, value.currentDetail['id']);
                      _commentController.text = "";
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _listCommentProvider.getListComment(widget.newsID);
                      _showCommentsModal();
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
                    onTap: () {
                      _showCommentsModal();
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
                            child: Consumer<ListCommentProvider>(
                              builder: (BuildContext context,
                                  ListCommentProvider value, Widget child) {
                                return AutoSizeText(
                                  value.listComments == null
                                      ? "0"
                                      : value.listComments.length.toString(),
                                  minFontSize: 8,
                                  maxFontSize: 10,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                );
                              },
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
                    onTap: () {
                      DynamicLinkService.createDynamicLink(
                          title: _newsDetailProvider.currentDetail['title'],
                          id: _newsDetailProvider.currentDetail['id'],
                          suffix: 'news');
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
        },
      ),
    );
  }

  _showCommentsModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return CommentBottomSheetDialogue(
            newsId: widget.newsID,
          );
        });
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _newsDetailProvider),
      ChangeNotifierProvider.value(value: _listCommentProvider),
    ];
  }

  @override
  initViewModel() {
    return new VCBExpressDetailViewModel(context);
  }
}
