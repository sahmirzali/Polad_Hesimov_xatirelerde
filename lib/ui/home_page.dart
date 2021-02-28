import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:general_polad/ui/about.dart';
import 'package:general_polad/ui/pdf_black/pdf_black.dart';
import 'package:general_polad/ui/pdf_white/pdf_white.dart';
import 'package:general_polad/ui/tab_ui/tab_about.dart';
import 'package:general_polad/ui/tab_ui/tab_comment.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  String whitepathPDF = "";
  String blackpathPDF = "";
  

  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    fromAsset('pdf_asset/pdfwhite.pdf', 'pdfwhite.pdf').then((f) {
      setState(() {
        whitepathPDF = f.path;
      });
    });
     fromAsset('pdf_asset/pdfblack.pdf', 'pdfblack.pdf').then((f) {
      setState(() {
        blackpathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  final List<Widget> myTabs = [
    Tab(
      text: '  Haqqında  ',
    ),
    Tab(text: '  Dəyərləndirmə  '),
  ];

  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /* @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }*/

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfff8f9f9),
      body: ListView(
        addAutomaticKeepAlives: true,
        physics: AlwaysScrollableScrollPhysics(),
        primary: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Feather.info),
                  color: Colors.grey[850],
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => About()));
                  },
                ),
              ],
            ),
          ),
          //SizedBox(height: 60),
          Container(
            padding: EdgeInsets.only(
              right: 17,
              left: 17,
              //  top: 10,
            ),
            //width: size.width,
            height: size.height * 0.5,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 45),
                  width: double.infinity,
                  //  width: 400,
                  height: size.height *  0.43,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500].withOpacity(0.15),
                        spreadRadius: 5,
                        blurRadius: 14,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 28),
                        child: Column(
                          children: [
                            Text(
                              'General',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black87,
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Polad Həşimov Xatirələrdə',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    //top: 0,
                   // width: MediaQuery.of(context).size.width,
                    //right: 30,
                    child: Container(
                      
                      height: MediaQuery.of(context).size.height * 0.34,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 0,
                        ),
                        height: MediaQuery.of(context).size.height * 0.33,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.575,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 40,
                                    offset: Offset(3, 3),
                                    spreadRadius: 7,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  "asset/hasimov.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: MediaQuery.of(context).size.width * 0.575,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                gradient: new LinearGradient(
                                  colors: [
                                    Colors.grey.withOpacity(0.145),
                                    Colors.transparent,
                                    Colors.grey.withOpacity(0.145),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top :13.0),
            child: Container(
              child: Center(
                child: Text(
                  "Oxumaq üçün arxaplan rejimi seçin:",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.2,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              // crossAxisAlignment: Cro,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  elevation: 1.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),

                    //side: BorderSide(color: Colors.blue),
                  ),
                  onPressed: () {
                    
                   // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
                    if (whitepathPDF != null || whitepathPDF.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfWhite(pathwhite: whitepathPDF),
                        ),
                      );
                    }
                  },
                  color: Colors.white,
                  textColor: Colors.blue,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Açıq",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                //SizedBox(width: 25,),
                RaisedButton(
                  elevation: 1.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                  onPressed: ()  {
                     // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
                    if (blackpathPDF != null || blackpathPDF.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfBlack(pathblack: blackpathPDF),
                        ),
                      );
                     
                    }
                  },
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text(
                    "Tünd",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 42,
              // width: 70,
              color: Colors.grey[200],
              child: TabBar(
                //isScrollable: true,

                physics: ScrollPhysics(),
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelColor: Colors.grey[400],
                /*indicator:  BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue[900],
                ),*/
                indicatorColor: Colors.blue[400],
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                labelColor: Colors.blue[400],
                tabs: myTabs,
              ),
            ),
          ),
          [
            TabAbout(),
            TabComment(),
          ][_tabController.index],
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/* 

Center(
            child: Container(
              margin: EdgeInsets.only(top: 20,),
              height: MediaQuery.of(context).size.height * 0.37,
              width: MediaQuery.of(context).size.width * 0.55,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 25,
                          offset: Offset(3, 3),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        "asset/hasimov.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: new LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.17),
                          Colors.transparent,
                          Colors.grey.withOpacity(0.17),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          */
