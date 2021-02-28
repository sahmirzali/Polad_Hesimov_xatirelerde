import 'package:flutter/material.dart';
import 'package:general_polad/model/model.dart';
import 'package:general_polad/model/service.dart';
import 'package:readmore/readmore.dart';

class TabComment extends StatefulWidget {
  TabComment({Key key}) : super(key: key);

  @override
  _TabCommentState createState() => _TabCommentState();
}

class _TabCommentState extends State<TabComment>
    with AutomaticKeepAliveClientMixin<TabComment> {
  Future<List<Comment>> serviceInfo;
  ServiceData serviceData;

  List<String> rey = [
    "Bu kitab üzərində böyük bir komanda çalışıb. Onların bu işə necə həvəs və məsuliyyətlə yanaşdığının şahidi olmuşam. Doğrusu, belə də gözləyirdim: vəzifəsindən, sənətindən, ixtisas uğurlarından daha çox parlaq insan kimi yaddaşlarda qalan Polad Həşimov fenomeninə başqa cür yanaşmaq olmazdı. Sağlığında onu şəxsən tanıyanlar necə xoşbəxt olduqlarını dilə gətirdikləri kimi, haqqında bitib-tükənməz xoş təəssürat oxuyanların da içinə qəribə istilik dolur. Tamamilə əminəm ki, bu istilikdə ucsuz-bucaqsız doğmalıq var. İnsanlığı zaman-zaman aclıqdan, xəstəliklərdən, müharibələrdən və başqa bəlalardan xilas edən də bu doğmalıqdır. İnsanın insana, insanın təbiətə, insanın hər şeyə doğmalığı.\nŞəhid elə bir mərhumdur ki, onun fərd olaraq yoxoluşu yaşadığı cəmiyyətə, ümumiyyətlə, dəyərlərini paylaşan hər kəsə həyatın qiymətini daha yaxşı anladır. Bu şərəfli ölümdür, çünki özündən sonra milyonların qəlbinə hər şeyin yaxşı olacağı inamını bəxş etmiş olur. Polad Həşimovun şəhidliyi milli kimliyimizi, vətənpərvərlik hissimizi pafosdan çıxarıb, gerçək əsaslara köklədi. O, həm öz həyatı, həm də şəhidliyi ilə bizə sübut etdi ki, hələ insanlıq tam təravətilə yaşayır və bu millət hər bir hüceyrəsinə kimi diridir.\nUğrunda canını fəda etdiyin müqəddəs dəyərlərin və sənin ölməz şəxsiyyətinin qarşısında baş əyirəm, doğma generalım!",
    "“Dağın zirvəsindən uzaqlaşdıqca zirvəni daha aydın görərik” deyiblər. Eyni zamanda necə yüksək bir zirvədən endiyimizi də uzaqlaşdıqca anlayarıq.\nSon bir neçə həftə ərzində Polad Həşimov zirvəsini də belə dərk etməyə başladıq. Şəhid general haqqında olan hər kiçik xatirə, hər status, hər müsahibə, hətta generalın hər bir şəkli belə, onun böyüklüyünü gözümüz önündə canlandırdı.\nPolad Həşimovun ailə üzvlərinin, cəbhə və kursant yoldaşlarının, dostlarının xatirələrini, onun haqq ında esse və məqalələri qısa zamanda nəşrə hazırlamaq ciddi bir iş idi ki, bu işin də öhdəsindən generalımızın adına layiq olan şəkildə gəlməyə çalışdıq.\nPolad Həşimov haqqında minlərlə fərqli insanın fikri çıxdı qarşımıza. Heç kim, bəli, heç bir nəfər Polad Həşimovla bağlı mənfi fikir dilə gətirmədi.\nAllah şəhidimizə rəhmət etsin! Bizə də Polad kimi ömür sürmək, xatirələrdə Polad Həşimov kimi yaşamaq qismət olsun!",
    "Polad Həşimov kimi bir şəxsiyyət haqqında kitab hazırlamaq olduqca məsuliyyətli iş idi. Kitabın istər üz qabığını, istərsə də iç səhifələrində olan şəkilləri yerləşdirərkən qəribə hisslərə qapılırdım. Təəssüflər olsun ki, biz Polad Həşimovu şəhidliyindən sonra tanıdıq. Şəkillərinə istər iş prosesində, istərsə də adi zamanlarda təkrar-təkrar dönüb baxırdım. Sanki bir doğmamdı və onun üçün çox darıxırdım. Hətta bir neçə gün yuxularıma da girdi. Çünkü bu proses başlayandan nəşriyyatda hər gün Polad Həşimovun adı çəkilirdi.\nYaxşı ki, generalımız haqqında bu kitabı nəşr etdik! Bu kitab – bundan sonrakı nəsilə vətəninin qəhrəmanlarından biri olan Polad Həşimovu daima yaddaşlarda saxlamağa və onu yaxından tanımağa imkan yaradacaq.\nYaxşı ki, vardın, cənab general, həmişə də var olacaqsan!",
    "Xalqımız öz qəhrəmanlarını tanımalıdır! Düşünürəm ki, Bizi Azərbaycan edən hər bir vətəndaşın yumruq kimi bir olub istər cəbhədə, istərsə də beynəlxalq aləmdə vətən üçün çalışmasıdır. Vətənin bir parçası olaraq, Polad Həşimov kimi şəfqətli bir şəxsiyyəti xatirələrindən tanımaq və tanıtmağı özümə borc bilirəm. Ümid edirəm ki, bu tətbiq nəinki Azərbaycan, həmçinin Azərbaycanın hüdudlarından kənarda yaşayan azərbaycanlıların qəlblərində Polad Həşimov çırağı yandıracaq."
  ];

  List<String> ad = [
    "Səbuhi Şahmursoy",
    "Nizami Hüseynov",
    "Tamerlan İsmayılzadə",
    "Şahmirzəli Hüseynov"
  ];

  List<String> vezife = [
    "“Hədəf Nəşrləri”nin direktoru",
    "“Hədəf Nəşrləri”nin baş redaktoru",
    "“Hədəf Nəşrləri”nin qrafik-dizayneri",
    "“Polad Həşimov xatirələrdə” tətbiqinin proqramçısı"
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var textScale = MediaQuery.of(context).textScaleFactor;

    return ListView.builder(
      padding: EdgeInsets.only(top: 14),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ad.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            //top: 10,
            left: 7,
            right: 7,
            bottom: 11,
          ),
          child: Container(
            //height: 300,
            //color: Colors.black,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  offset: Offset(1.0, 1.0), // shadow direction: bottom right
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(6.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                    color: Colors.blue[50],
                  ),
                  width: double.infinity,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ad[index],
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.8 * textScale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        vezife[index],
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13 * textScale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0,left: 8,right: 8,bottom: 6),
                  child: ReadMoreText(
                    rey[index],
                    trimLines: 10,

                    colorClickableText: Colors.blue[400],
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '...Daha çox',
                    trimExpandedText: '   Daha az',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.1 * textScale,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/*import 'package:flutter/material.dart';
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
  //ServiceData serviceData;

  @override
  void initState() {
    serviceInfo = _fetchData();
    super.initState();
  }

  Future<List<Comment>> _fetchData() async {
    await Future.delayed(Duration(seconds: 0));
    return ServiceData().loadInfo();
  }

  var x;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var textScale = MediaQuery.of(context).textScaleFactor;

    return x == null
        ? FutureBuilder<List<Comment>>(
            future: serviceInfo,
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

*/
