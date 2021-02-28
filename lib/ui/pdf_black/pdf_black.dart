import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fullpdfview/flutter_fullpdfview.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:general_polad/ui/pdf_black/pdf_b_detail.dart';
import 'package:general_polad/ui/pdf_white/pdf_w_detail.dart';

class PdfBlack extends StatefulWidget {
  final String pathblack;
  PdfBlack({
    Key key,
    this.pathblack,
  }) : super(key: key);

  @override
  _PdfBlackState createState() => _PdfBlackState();
}

class _PdfBlackState extends State<PdfBlack> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  /* @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

@override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }*/

  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  Completer<int> _imageCompleter = new Completer<int>();
  Future<int> get images => _imageCompleter.future;
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return Scaffold(
      //resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: true,
      backgroundColor: Color(0xff030c2b),
      //drawerEdgeDragWidth: MediaQuery.of(context).size.width,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 39, left: 20, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  disabledColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  splashRadius: 2,
                  visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                  icon: Icon(Icons.keyboard_backspace),
                  color: Colors.white,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Row(
                  children: [
                    Text(
                      '${currentPage + 1}/$pages',

                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white

                          //color: Color(titleColor),
                          ),
                      //color: Color(titleColor),
                    ),
                    IconButton(
                      disabledColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      splashRadius: 2,
                      visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                      icon: Icon(Feather.list),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageIndexBlack(
                                      control: _controller,
                                    )));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(8.0),
              //color: Colors.green,
              height: MediaQuery.of(context).size.height * 0.77,
              width: MediaQuery.of(context).size.width,
              child: PDFView(
                filePath: widget.pathblack,
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: true,
                fitEachPage: true,
                pageFling: true,
                pageSnap: true,
                backgroundColor: bgcolors.TRANSPARENT,
                defaultPage: currentPage,
                fitPolicy: FitPolicy.BOTH,
                onRender: (_pages) {
                  setState(() {
                    pages = _pages;
                    isReady = true;
                  });
                },
                onError: (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                  print(error.toString());
                },
                onPageError: (page, error) {
                  setState(() {
                    errorMessage = '$page: ${error.toString()}';
                  });
                  print('$page: ${error.toString()}');
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  _controller.complete(pdfViewController);
                },
                onPageChanged: (int page, int total) {
                  print('page change: $page/$total');

                  setState(() {
                    currentPage = page;
                  });
                },
              ),
            ),
          ),
          FutureBuilder<PDFViewController>(
            future: _controller.future,
            builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      disabledColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      splashRadius: 2,
                      visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                      color: Colors.white,
                      icon: Icon(Feather.chevrons_left),
                      onPressed: () async {
                        final PDFViewController pdfController = snapshot.data;

                        await pdfController.setPage(0);
                      },
                    ),
                    IconButton(
                      disabledColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      splashRadius: 2,
                      visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                      color: Colors.white,
                      icon: Icon(Feather.chevron_left),
                      onPressed: () async {
                        final PDFViewController pdfController = snapshot.data;
                        final int currentPage =
                            await pdfController.getCurrentPage() - 1;
                        if (currentPage >= 0) {
                          await pdfController.setPage(currentPage);
                        }
                      },
                    ),
                    IconButton(
                      disabledColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      splashRadius: 2,
                      visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                      color: Colors.white,
                      icon: Icon(Feather.chevron_right),
                      onPressed: () async {
                        final PDFViewController pdfController = snapshot.data;
                        final int currentPage =
                            await pdfController.getCurrentPage();
                        final int numberOfPages =
                            await pdfController.getPageCount();
                        if (numberOfPages > currentPage + 1) {
                          await pdfController.setPage(currentPage + 1);
                        }
                      },
                    ),
                    IconButton(
                      disabledColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      splashRadius: 2,
                      visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                      color: Colors.white,
                      icon: Icon(Feather.chevrons_right),
                      onPressed: () async {
                        final PDFViewController pdfController = snapshot.data;

                        await pdfController.setPage(199);
                      },
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),

      //Text('qaqam',style: TextStyle(fontSize: 20),)
    );
  }
}
