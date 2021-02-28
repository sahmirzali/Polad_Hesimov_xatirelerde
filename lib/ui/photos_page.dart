import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:general_polad/model/model_image.dart';
import 'package:general_polad/model/service.dart';
import 'package:general_polad/ui/photo_detail.dart';
import 'package:system_shortcuts/system_shortcuts.dart';

class PhotosPage extends StatefulWidget {
  PhotosPage({Key key}) : super(key: key);

  @override
  _PhotosPageState createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage>
    with AutomaticKeepAliveClientMixin<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Color(0xfff8f9f9),
      body: FutureBuilder<List<Images>>(
        future: ServiceData().loadImage(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,

                  // padding: EdgeInsets.zero,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    var x = snapshot.data[i].image;
                    //Comment data = allComment[i];
                    return i == 0
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, bottom: 4),
                                child: Text(
                                  "Polad Həşimov fotolarda",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 21,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // SystemShortcuts.orientLandscape()
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PhotoDetail(
                                                detail: x,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  child: snapshot.data[i].soz != null
                                      ? Card(
                                          semanticContainer: false,
                                          shadowColor: Colors.grey[100],
                                          elevation: 1.5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9.0)),
                                          child: Column(
                                            children: <Widget>[
                                              ClipRRect(
                                                child: Image.asset(
                                                    snapshot.data[i].image),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(9.0),
                                                  topRight:
                                                      Radius.circular(9.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      snapshot.data[i].soz,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0)),
                                          child: Column(
                                            children: <Widget>[
                                              ClipRRect(
                                                child: Image.asset(
                                                    snapshot.data[i].image),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(7.0),
                                                  topRight:
                                                      Radius.circular(7.0),
                                                  bottomLeft:
                                                      Radius.circular(7.0),
                                                  bottomRight:
                                                      Radius.circular(7.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              // SystemShortcuts.orientLandscape()
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhotoDetail(
                                            detail: x,
                                          )));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: snapshot.data[i].soz != null
                                  ? Card(
                                      semanticContainer: false,
                                      shadowColor: Colors.grey[100],
                                      elevation: 1.5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9.0)),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            child: Image.asset(
                                                snapshot.data[i].image),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(9.0),
                                              topRight: Radius.circular(9.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data[i].soz,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            child: Image.asset(
                                                snapshot.data[i].image),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(7.0),
                                              topRight: Radius.circular(7.0),
                                              bottomLeft: Radius.circular(7.0),
                                              bottomRight: Radius.circular(7.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          );
                  },
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
