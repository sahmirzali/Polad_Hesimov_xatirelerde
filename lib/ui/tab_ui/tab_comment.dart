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

  var x;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var textScale = MediaQuery.of(context).textScaleFactor;

    return x == null
        ? FutureBuilder<List<Comment>>(
            future: ServiceData().loadInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                x = snapshot.data;
                return loadBody();
              }

              return CircularProgressIndicator();
            },
          )
        : loadBody();
  }

  Widget loadBody() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      //primary: true,
      // padding: EdgeInsets.zero,
      itemCount: x.length,
      itemBuilder: (context, index) {
        
        return Card(
          child: ListTile(
            title: Text(x[index].ad),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
