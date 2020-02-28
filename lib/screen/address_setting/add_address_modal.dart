import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAddAddressDialog(BuildContext context) {
  List<Map<String, String>> listInput = [
    {
      'title': S.of(context).addressDetail,
      'hint': S.of(context).addressDetailHint
    },
    {'title': S.of(context).city, 'hint': S.of(context).cityHint},
    {'title': S.of(context).district, 'hint': S.of(context).districtHint},
    {'title': S.of(context).commune, 'hint': S.of(context).communeHint}
  ];

  Dialog addAddress = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
      // height: 350.0,
      // width: 350.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // title
          Container(
            // height: 38,
            // width: double.infinity,
            decoration:
                setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
            child: Center(
              child: Text(
                S.of(context).myAddress,
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          listInputView(listInput),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.check_box,
                  size: 20,
                ),
              ),
              Text(
                S.of(context).setToDefaultAddress,
                style: TextStyle(color: ColorUtil.black33, fontSize: 12),
              ),
            ],
          ),

          dialogBtn(context)
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => addAddress);
}

Widget listInputView(List<Map<String, String>> listInput) {
  return Expanded(
    child: ListView.builder(
        itemCount: listInput.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 8),
            // height: 40,
            // width: double.infinity,
            decoration:
                setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(left: 8, top: 8),
                  //   child: Text(
                  //     listInput[index]['title'],
                  //     style: TextStyle(
                  //         color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: listInput[index]['title'],
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12),
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.symmetric(vertical: 20),
                        hintText: listInput[index]['hint'],
                        hintStyle: TextStyle(
                            fontSize: 9.0,
                            color: Color.fromRGBO(100, 100, 100, 1)),
                      ),
                    ),
                  )
                ]),
          );
        }),
  );
}

Widget dialogBtn(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        ButtonTheme(
          minWidth: 90,
          height: 23,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            color: ColorUtil.primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).cancel,
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        ButtonTheme(
          minWidth: 90,
          height: 23,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            color: ColorUtil.primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).addNew,
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}
