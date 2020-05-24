import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class VCBExpressDetailViewModel extends BaseViewModel{
  @override
  BuildContext context;

  VCBExpressDetailViewModel(this.context);

  Future<String> sendComment(String comment,String id)async{
      var data = await service.addComment(context,newsId: id,content: comment);
      return "1";
  }
}