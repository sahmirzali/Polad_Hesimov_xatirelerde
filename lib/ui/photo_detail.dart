import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhotoDetail extends StatefulWidget {
  final detail;
  PhotoDetail({Key key, this.detail}) : super(key: key);

  @override
  _PhotoDetailState createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
/*     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
    ]);*/

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(child: Image.asset(widget.detail)),
      ),
    );
  }
}
