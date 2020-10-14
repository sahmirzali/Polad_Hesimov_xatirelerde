import 'package:flutter/material.dart';

class TabAbout extends StatefulWidget {
  TabAbout({Key key}) : super(key: key);

  @override
  _TabAboutState createState() => _TabAboutState();
}

class _TabAboutState extends State<TabAbout>
    with AutomaticKeepAliveClientMixin<TabAbout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: const EdgeInsets.only(left: 17.5, right: 17.5, top: 18),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '“General Polad Həşimov xatirələrdə” kitabı 14 iyul 2020-ci il tarixində Tovuz rayonu ətrafında gedən döyüşlərdə şəhid olan general-mayor Polad Həşimov haqqında xatirələrdən ibarətdir. Kitabda şəhid generalın ailə üzvlərindən, yaxınlarından, zabit və əsgər yoldaşlarından götürülən xatirə yazıları yer alıb. “Polad Həşimov fotolarda” adlı bölmədə isə generalın ta uşaqlıq illərindən tutmuş bizdən ayrılan vaxta qədər müxtəlif dövrlərdə çəkilmiş şəkillər verilib. Kitab geniş oxucu kütləsi üçün nəzərdə tutulub və şəhid generalın cəmiyyətə daha yaxından tanıdılması məqsədi daşıyır.\nKitabın ərsəyə gəlməsində dəstəyini göstərən bütün insanlara, o cümlədən məqalə və müsahibələrin müəlliflərinə, təşkilati işlərdə İlahə Nəccari, İlham Həşimov, Loğman Xanlarov, Elçin Kərimov, Elbrus Rzayev və Mahir Şəkərova təşəkkürümüzü bildiririk.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.1 * textScale,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Vətənimiz Azərbaycan uğrundan canından keçən bütün şəhidlərimizə rəhmət diləyirik!',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15.1 * textScale,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  'Şəhidlərimizin ruhuna dərin ehtiramla,',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.5 * textScale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0,bottom: 15),
              child: Center(
                child: Text(
                  '“Hədəf Nəşrləri” komandası',
                  
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.5 * textScale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
    
  }

  @override
  bool get wantKeepAlive => true;
}
