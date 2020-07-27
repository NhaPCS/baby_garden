import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/provider/list_comment_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CommentBottomSheetDialogue extends StatefulWidget {
  final String newsId;

  const CommentBottomSheetDialogue({this.newsId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CommentBottomSheetDialogue();
  }
}

class _CommentBottomSheetDialogue
    extends BaseState<CommentBottomSheetDialogue> {
  final ListCommentProvider _listCommentProvider = new ListCommentProvider();

  @override
  void initState() {
    // TODO: implement initState
    if (_listCommentProvider.listComments.length == 0) {
      _listCommentProvider.getListComment(widget.newsId);
    }
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Container(
      padding: EdgeInsets.all(SizeUtil.smallSpace),
      height: MediaQuery.of(context).size.height / 2,
      child: Consumer<ListCommentProvider>(
        builder:
            (BuildContext context, ListCommentProvider value, Widget child) {
              if (value.listComments == null || value.listComments.isEmpty)
                return LoadingView(
                  isNoData: value.listComments != null,
                  onReload: () {
                    _listCommentProvider.getListComment(widget.newsId);
                  },
                );
          return ListView(
            children: value.listComments
                .map((e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleImage(
                          imageUrl: e["user_avatar"] ?? '',
                          width: SizeUtil.iconSizeBig,
                          height: SizeUtil.iconSizeBig,
                        ),
                        Expanded(
                          child: Container(
                            margin:
                                EdgeInsets.only(bottom: SizeUtil.smallSpace),
                            padding: EdgeInsets.all(SizeUtil.smallSpace),
                            decoration: BoxDecoration(
                                color: ColorUtil.lineService,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(SizeUtil.tinyRadius))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  e['user_name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeUtil.textSizeDefault),
                                ),
                                Text(
                                  e["content"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: SizeUtil.textSizeDefault),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
                .toList(),
          );
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _listCommentProvider)];
  }
}
