import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fullpdfview/flutter_fullpdfview.dart';

class PageIndexWhite extends StatefulWidget {
  final Completer<PDFViewController> control;
  PageIndexWhite({Key key, this.control}) : super(key: key);

  @override
  _PageIndexWhiteState createState() => _PageIndexWhiteState();
}

class _PageIndexWhiteState extends State<PageIndexWhite> {
  List<String> mundericat = [
    "Həyat qədər dəyərli ölüm – Şəmil Sadiq",
    "Tərcümeyi-hal: Həşimov Polad İsrayıl oğlu",
    "Xidməti xasiyyətnamə",
    "POLAD HƏŞİMOV XATİRƏLƏRDƏ",
    "Həm anam, həm atamsan – Səmayə Həşimova",
    "Sıxıntılarını bildirməzdi – Ofelya Həşimova",
    "Gör, nə deyirəm – Kəmalə Həşimova",
    "Sevirdi çətinliyi – İlham Həşimov",
    "Atamın portretini çəkməyə əlim gəlmir... – Aybəniz Həşimova",
    "Arzuları çox idi – Babək Salmanov",
    "Əsrimizin Poladı: şəhid generalı tanımaq – Cavid Qədir",
    "Sənin general olmağın yanındakı xanımdan asılıdır – Famil Məmmədli",
    "Onu ürəkdən öyrətmək istəyən müəllim və zabitlərin hörmətini saxlayırdı - Sənan Valehov",
    "Qarabağı işğaldan azad etmək üçün mənə cəmi iki ay vaxt lazımdır – İbrahim Xitilov",
    "Polad həmişə tank rəsmi çəkərdi – Vüqar Cəfərov",
    "Sən öz bildiyini etdin, hərbçi olmağı seçdin – Vəfa İbrahim",
    "İndi onu bütün Azərbaycan tanıdı və sevdi! – İlham Tumas",
    "Mən dağ adamıyam – Turqut Bayramov",
    "Yuxusuzluqdan onun gözləri qıpqırmızıdır – Vahid Məhərrəmov",
    "Xalqının sənin haqqında bilmədiyi çox şey var – Yusif Məmmədhüseynov ",
    "Əsgərini qoruyurdu – Qismət Məsim",
    "Qoy, əsgər məni görüb öz səhvini düzəltsin – Mərziyyə Nəcəfova",
    "ZABİT XATİRƏLƏRİ",
    "Hər kəs onu göstərdiyi münasibətə görə çox istəyirdi – Elçin Kərimov",
    "Poladın da şəhidlik zirvəsinə ucalmaq arzusu olub – Eldəniz Aslanov",
    "Mən onun məzuniyyətə getdiyini görmədim – Elxan Fərzəliyev",
    "Mən kabinet generalı deyiləm, səngər generalıyam – İlkin Möhsümlü",
    "Bütöv bir qəhrəmanlıq dastanı Polad Həşimov – Qalib Paşayev",
    "Bizim şəhid Polad qardaşımız – Həsən Əliyev, Şəmsəddin Məhəmmədov və Elvin Qasımov",
    "Komutan, olarmı sizinlə şəkil çəkdirim? – Elbrus Rzayev",
    "Axırıncı dəfə Nadir şah haqqında danışdığını xatırlayıram – Loğman Xanlarov",
    "Səbirli olun, az qalıb, qısa vaxtda işğal olunmuş torpaqlarımızı sizinlə birlikdə azad edəcəyik – İbrahim Yunusov",
    "Bütün şəxsi heyət bizik – birik, hamımız əsgərik – Ağabala Manafov",
    "Bu da məndən sənə yadigar – Həsən Əliyev",
    "O bütün dünyaya öz saf dünyasından baxırdı – Elmdar Hüseynov",
    "Siz harda yatırsınızsa, mən də orada yatacam – Nicat Hüseynov",
    "ƏSGƏR XATİRƏLƏRİ",
    "Hansısa əsgərin qəlbinə dəyməkdən haram və günah nəsə ola bilməz – Ağa Qasımov",
    "Atan bizim fəxrimizdir – Asəm Eyvazov",
    "Hansısa qərar qəbul edərkən yalnız vicdanının səsinə qulaq as! – Orxan Əsgərli",
    "General-mayor Polad Həşimov əsl şərəfli zabit obrazıdır – Fərrux Çələbi",
    "Həşimov Polad kimi komandiriniz var – Əlisəfa Mirzaliyev",
    "İstəmərəm ki, mənim əsgərim evinə xəstə olaraq getsin! – Fərhad Xəlif",
    "Az müddətdə hamımızın həm də dostu oldu – Namiq Məmmədov",
    "Evdən çox da pul istəmə – Razim Allahverdiyev",
    "Ürəyi o qədər təmizdi ki, bu yüngül cəza yalnız bir gün çəkdi – Rəvan Tağıyev",
    "Sən keçmiş hərbi dəniz donanmasında olanlar qədər xidmət etmisən – Niyaməddin Şahmarov",
    "“Polad Həşimova qədər” və “Polad Həşimovdan sonra” – Vüqar Ədilov ",
    "Onun əsgəri olduğumuz üçün özümüzü təhlükəsiz və qürurlu hiss edirdik – Tural Əzizov",
    "Kaş tezliklə yenə gələydi – Rəhim Nəcəfov",
    "İş stolunun üstündən heç vaxt kitablar əskik olmurdu – Xalid Zalov",
    "Öz payına düşən çörəyi, yeməyi əsgərlərə verərdi – Vəfa Quliyev",
    "Həmin hərbi botinkaları hələ də saxlayıram – Kənan Novruzov",
    "Səni fəxri fərmanla təltif edirəm! – Rəşad Novruzov",
    "Sizi kim incitsə, qarşısında məni görər – Yasin Heydərov",
  ];

  List<int> munindex = [
    7,
    10,
    12,
    null,
    15,
    21,
    27,
    32,
    41,
    46,
    47,
    66,
    69,
    71,
    73,
    75,
    78,
    81,
    87,
    94,
    96,
    99,
    null,
    103,
    110,
    113,
    118,
    121,
    124,
    128,
    133,
    136,
    138,
    140,
    142,
    145,
    null,
    147,
    150,
    152,
    160,
    163,
    166,
    167,
    169,
    173,
    175,
    178,
    181,
    187,
    190,
    193,
    195,
    196,
    197,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<PDFViewController>(
          future: widget.control.future,
          builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                // padding: EdgeInsets.zero,
                itemCount: mundericat.length,
                itemBuilder: (context, i) {
                  return i == 0
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18, bottom: 4),
                              child: Text(
                                "Mündəricat",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 21,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () async {
                                await snapshot.data.setPage(munindex[i] - 1);
                                Navigator.pop(context, true);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            mundericat[i],
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            munindex[i].toString(),
                                            //maxLines: 1,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () async {
                            await snapshot.data.setPage(munindex[i] - 1);
                            Navigator.pop(context, true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Flexible(
                                        child: Text(
                                          mundericat[i],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            // color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      child: munindex[i] != null
                                          ? Text(
                                              munindex[i].toString(),
                                              //maxLines: 1,
                                              style: TextStyle(
                                                //color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        );
                },
              );
            }

            return Container(
              child: Center(child: Text('---')),
            );
          },
        ),
      ),
    );
  }
}

/*

ListTile(
                    onTap: () async {
                      await snapshot.data.setPage(5);
                      Navigator.pop(context, true);
                    },
                    title: Text('sehife 5'),
                  ),

*/
