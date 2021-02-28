import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_share/flutter_share.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var titleColor = 0xff803BE2;
    var titleColor2 = 0xffA261FF;
    var textScale = MediaQuery.of(context).textScaleFactor;

    Future<void> shareMeal() async {
      await FlutterShare.share(
          title: 'General Polad Həşimov xatirələrdə',
          text: 'General Polad Həşimov xatirələrdə',
          linkUrl:
              'https://play.google.com/store/apps/details?id=com.mirze.general_polad',
          chooserTitle: 'General Polad Həşimov xatirələrdə');
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 27, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tətbiq haqqında",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20 * textScale,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87

                      //color: Colors.deepPurple[900],
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 23, right: 23, top: 18, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Bu vətən, bu torpaq bizimdir və bütün şəxsi heyət bizim - birik,hamımız əsgərik!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.2 * textScale,
                      fontWeight: FontWeight.w500,
                      //color: Colors.deepPurple[900],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    "Polad Həşimov",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16 * textScale,
                      fontWeight: FontWeight.w500,
                      //color: Colors.deepPurple[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            indent: 25,
            endIndent: 35,
          ),
          SizedBox(
            height: 1,
          ),
          SizedBox(
            height: 14,
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Kitabı nəşr etdi:",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14 * textScale,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      //color: Colors.deepPurple[900],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Hədəf Nəşrləri",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.5 * textScale,
                      fontWeight: FontWeight.w500,
                      //color: Colors.deepPurple[900],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Proqram tərtibi:",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.7 * textScale,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      //color: Colors.deepPurple[900],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Hüseynov Şahmirzəli",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.5 * textScale,
                      fontWeight: FontWeight.w500,
                      //color: Colors.deepPurple[900],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 1,
                    indent: 25,
                    endIndent: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 23, right: 23, top: 13, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "Bütün təklif və iradlarınızı e-poçt adresi ilə əlaqə saxlayaraq bildirə bilərsiniz",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15.2 * textScale,
                              fontWeight: FontWeight.w400,
                              //color: Colors.deepPurple[900],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Container(
                            color: Colors.blue[50],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "sahmirzeli.huseynov@gmail.com",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.5 * textScale,
                                  fontWeight: FontWeight.w400,
                                  //color: Colors.deepPurple[900],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( top: 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.82,
                      child: RaisedButton(
                        onPressed: () {
                          shareMeal();
                          //Share.share('Qurani kərim və məalı \nhttps://play.google.com/store/apps/details?id=com.meal.quran_app',subject: 'tətbiq kateoqiryasi');
                        },
                        color: Colors.blue[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 60),
                              child: Text(
                                'Tətbiqi paylaş',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16 * textScale,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
