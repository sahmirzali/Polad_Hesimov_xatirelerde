import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:general_polad/ui/tab_ui/tab_about.dart';
import 'package:general_polad/ui/tab_ui/tab_comment.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
     super.build(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

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
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => About()));
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
            width: size.width - 60,
            height: 379,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 45),
                  width: double.infinity,
                  //  width: 400,
                  height: 310,
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
                    left: 77,
                    //right: 30,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.33,
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
                                    spreadRadius: 10,
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
                                    Colors.grey.withOpacity(0.14),
                                    Colors.transparent,
                                    Colors.grey.withOpacity(0.14),
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
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.blue,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Oxu",
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
                  onPressed: () {},
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text(
                    "Oxu",
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
