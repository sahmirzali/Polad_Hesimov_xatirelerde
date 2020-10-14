import 'package:flutter/material.dart';
import 'package:general_polad/model/model.dart';
import 'package:general_polad/model/service.dart';

class TabComment extends StatefulWidget {
  TabComment({Key key}) : super(key: key);

  @override
  _TabCommentState createState() => _TabCommentState();
}

class _TabCommentState extends State<TabComment>
    with AutomaticKeepAliveClientMixin<TabComment> {
  Future<List<Comment>> serviceInfo;
  ServiceData serviceData;

  @override
  void initState() {
    super.initState();
    serviceInfo = ServiceData().loadInfo();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var textScale = MediaQuery.of(context).textScaleFactor;

    return FutureBuilder<List<Comment>>(
      future: serviceInfo,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                //primary: true,
                // padding: EdgeInsets.zero,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  //Comment data = allComment[i];
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data[i].ad),
                    ),
                  );
                },
              )
            : CircularProgressIndicator();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
