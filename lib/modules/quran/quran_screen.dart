import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_data.dart';
import 'package:islami_app/modules/quran/quran_details_view.dart';
import 'package:islami_app/modules/quran/widget/sura_card_widget.dart';
import 'package:islami_app/shared/colors.dart';
import 'package:islami_app/shared/shared_pref.dart';
import 'package:islami_app/shared/shared_pref_keys.dart';

import '../../res/font_res.dart';
import 'widget/recent_card_widget.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({
    super.key,
  });

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    super.initState();
    _loadRecentSura();
  }

  String searchQuery = '';

  List<SuraData> recentSura = [];
  List<SuraData> suraList = [
    SuraData(suraNumber: '1', suraNameEn: 'Al-Fatiha', suraNameAr: 'الفاتحه', verses: '7 Verses'),
    SuraData(suraNumber: '2', suraNameEn: 'Al-Baqarah', suraNameAr: 'البقرة', verses: '286 Verses'),
    SuraData(suraNumber: '3', suraNameEn: 'Aal-E-Imran', suraNameAr: 'آل عمران', verses: '200 Verses'),
    SuraData(suraNumber: '4', suraNameEn: 'An-Nisa', suraNameAr: 'النساء', verses: '176 Verses'),
    SuraData(suraNumber: '5', suraNameEn: 'Al-Ma\'idah', suraNameAr: 'المائدة', verses: '120 Verses'),
    SuraData(suraNumber: '6', suraNameEn: 'Al-An\'am', suraNameAr: 'الأنعام', verses: '165 Verses'),
    SuraData(suraNumber: '7', suraNameEn: 'Al-A\'raf', suraNameAr: 'الأعراف', verses: '206 Verses'),
    SuraData(suraNumber: '8', suraNameEn: 'Al-Anfal', suraNameAr: 'الأنفال', verses: '75 Verses'),
    SuraData(suraNumber: '9', suraNameEn: 'At-Tawbah', suraNameAr: 'التوبة', verses: '129 Verses'),
    SuraData(suraNumber: '10', suraNameEn: 'Yunus', suraNameAr: 'يونس', verses: '109 Verses'),
    SuraData(suraNumber: '11', suraNameEn: 'Hud', suraNameAr: 'هود', verses: '123 Verses'),
    SuraData(suraNumber: '12', suraNameEn: 'Yusuf', suraNameAr: 'يوسف', verses: '111 Verses'),
    SuraData(suraNumber: '13', suraNameEn: 'Ar-Ra\'d', suraNameAr: 'الرعد', verses: '43 Verses'),
    SuraData(suraNumber: '14', suraNameEn: 'Ibrahim', suraNameAr: 'إبراهيم', verses: '52 Verses'),
    SuraData(suraNumber: '15', suraNameEn: 'Al-Hijr', suraNameAr: 'الحجر', verses: '99 Verses'),
    SuraData(suraNumber: '16', suraNameEn: 'An-Nahl', suraNameAr: 'النحل', verses: '128 Verses'),
    SuraData(suraNumber: '17', suraNameEn: 'Al-Isra', suraNameAr: 'الإسراء', verses: '111 Verses'),
    SuraData(suraNumber: '18', suraNameEn: 'Al-Kahf', suraNameAr: 'الكهف', verses: '110 Verses'),
    SuraData(suraNumber: '19', suraNameEn: 'Maryam', suraNameAr: 'مريم', verses: '98 Verses'),
    SuraData(suraNumber: '20', suraNameEn: 'Ta-Ha', suraNameAr: 'طه', verses: '135 Verses'),
    SuraData(suraNumber: '21', suraNameEn: 'Al-Anbiya', suraNameAr: 'الأنبياء', verses: '112 Verses'),
    SuraData(suraNumber: '22', suraNameEn: 'Al-Hajj', suraNameAr: 'الحج', verses: '78 Verses'),
    SuraData(suraNumber: '23', suraNameEn: 'Al-Mu\'minun', suraNameAr: 'المؤمنون', verses: '118 Verses'),
    SuraData(suraNumber: '24', suraNameEn: 'An-Nur', suraNameAr: 'النّور', verses: '64 Verses'),
    SuraData(suraNumber: '25', suraNameEn: 'Al-Furqan', suraNameAr: 'الفرقان', verses: '77 Verses'),
    SuraData(suraNumber: '26', suraNameEn: 'Ash-Shu\'ara', suraNameAr: 'الشعراء', verses: '227 Verses'),
    SuraData(suraNumber: '27', suraNameEn: 'An-Naml', suraNameAr: 'النّمل', verses: '93 Verses'),
    SuraData(suraNumber: '28', suraNameEn: 'Al-Qasas', suraNameAr: 'القصص', verses: '88 Verses'),
    SuraData(suraNumber: '29', suraNameEn: 'Al-Ankabut', suraNameAr: 'العنكبوت', verses: '69 Verses'),
    SuraData(suraNumber: '30', suraNameEn: 'Ar-Rum', suraNameAr: 'الرّوم', verses: '60 Verses'),
    SuraData(suraNumber: '31', suraNameEn: 'Luqman', suraNameAr: 'لقمان', verses: '34 Verses'),
    SuraData(suraNumber: '32', suraNameEn: 'As-Sajda', suraNameAr: 'السجدة', verses: '30 Verses'),
    SuraData(suraNumber: '33', suraNameEn: 'Al-Ahzab', suraNameAr: 'الأحزاب', verses: '73 Verses'),
    SuraData(suraNumber: '34', suraNameEn: 'Saba', suraNameAr: 'سبأ', verses: '54 Verses'),
    SuraData(suraNumber: '35', suraNameEn: 'Fatir', suraNameAr: 'فاطر', verses: '45 Verses'),
    SuraData(suraNumber: '36', suraNameEn: 'Ya-Sin', suraNameAr: 'يس', verses: '83 Verses'),
    SuraData(suraNumber: '37', suraNameEn: 'As-Saffat', suraNameAr: 'الصافات', verses: '182 Verses'),
    SuraData(suraNumber: '38', suraNameEn: 'Sad', suraNameAr: 'ص', verses: '88 Verses'),
    SuraData(suraNumber: '39', suraNameEn: 'Az-Zumar', suraNameAr: 'الزمر', verses: '75 Verses'),
    SuraData(suraNumber: '40', suraNameEn: 'Ghafir', suraNameAr: 'غافر', verses: '85 Verses'),
    SuraData(suraNumber: '41', suraNameEn: 'Fussilat', suraNameAr: 'فصّلت', verses: '54 Verses'),
    SuraData(suraNumber: '42', suraNameEn: 'Ash-Shura', suraNameAr: 'الشورى', verses: '53 Verses'),
    SuraData(suraNumber: '43', suraNameEn: 'Az-Zukhruf', suraNameAr: 'الزخرف', verses: '89 Verses'),
    SuraData(suraNumber: '44', suraNameEn: 'Ad-Dukhan', suraNameAr: 'الدّخان', verses: '59 Verses'),
    SuraData(suraNumber: '45', suraNameEn: 'Al-Jathiya', suraNameAr: 'الجاثية', verses: '37 Verses'),
    SuraData(suraNumber: '46', suraNameEn: 'Al-Ahqaf', suraNameAr: 'الأحقاف', verses: '35 Verses'),
    SuraData(suraNumber: '47', suraNameEn: 'Muhammad', suraNameAr: 'محمد', verses: '38 Verses'),
    SuraData(suraNumber: '48', suraNameEn: 'Al-Fath', suraNameAr: 'الفتح', verses: '29 Verses'),
    SuraData(suraNumber: '49', suraNameEn: 'Al-Hujurat', suraNameAr: 'الحجرات', verses: '18 Verses'),
    SuraData(suraNumber: '50', suraNameEn: 'Qaf', suraNameAr: 'ق', verses: '45 Verses'),
    SuraData(suraNumber: '51', suraNameEn: 'Adh-Dhariyat', suraNameAr: 'الذاريات', verses: '60 Verses'),
    SuraData(suraNumber: '52', suraNameEn: 'At-Tur', suraNameAr: 'الطور', verses: '49 Verses'),
    SuraData(suraNumber: '53', suraNameEn: 'An-Najm', suraNameAr: 'النجم', verses: '62 Verses'),
    SuraData(suraNumber: '54', suraNameEn: 'Al-Qamar', suraNameAr: 'القمر', verses: '55 Verses'),
    SuraData(suraNumber: '55', suraNameEn: 'Ar-Rahman', suraNameAr: 'الرحمن', verses: '78 Verses'),
    SuraData(suraNumber: '56', suraNameEn: 'Al-Waqi\'a', suraNameAr: 'الواقعة', verses: '96 Verses'),
    SuraData(suraNumber: '57', suraNameEn: 'Al-Hadid', suraNameAr: 'الحديد', verses: '29 Verses'),
    SuraData(suraNumber: '58', suraNameEn: 'Al-Mujadilah', suraNameAr: 'المجادلة', verses: '22 Verses'),
    SuraData(suraNumber: '59', suraNameEn: 'Al-Hasyr', suraNameAr: 'الحشر', verses: '24 Verses'),
    SuraData(suraNumber: '60', suraNameEn: 'Al-Mumtahanah', suraNameAr: 'الممتحنة', verses: '13 Verses'),
    SuraData(suraNumber: '61', suraNameEn: 'As-Saff', suraNameAr: 'الصّفّ', verses: '14 Verses'),
    SuraData(suraNumber: '62', suraNameEn: 'Al-Jumu\'ah', suraNameAr: 'الجمعة', verses: '11 Verses'),
    SuraData(suraNumber: '63', suraNameEn: 'Al-Munafiqun', suraNameAr: 'المنافقون', verses: '11 Verses'),
    SuraData(suraNumber: '64', suraNameEn: 'At-Taghabun', suraNameAr: 'التغابن', verses: '18 Verses'),
    SuraData(suraNumber: '65', suraNameEn: 'At-Talaq', suraNameAr: 'الطلاق', verses: '12 Verses'),
    SuraData(suraNumber: '66', suraNameEn: 'At-Tahrim', suraNameAr: 'التحريم', verses: '12 Verses'),
    SuraData(suraNumber: '67', suraNameEn: 'Al-Mulk', suraNameAr: 'الملك', verses: '30 Verses'),
    SuraData(suraNumber: '68', suraNameEn: 'Al-Qalam', suraNameAr: 'القلم', verses: '52 Verses'),
    SuraData(suraNumber: '69', suraNameEn: 'Al-Haqqah', suraNameAr: 'الحاقّة', verses: '52 Verses'),
    SuraData(suraNumber: '70', suraNameEn: 'Al-Ma\'arij', suraNameAr: 'المعارج', verses: '44 Verses'),
    SuraData(suraNumber: '71', suraNameEn: 'Nuh', suraNameAr: 'نوح', verses: '28 Verses'),
    SuraData(suraNumber: '72', suraNameEn: 'Al-Jinn', suraNameAr: 'الجن', verses: '28 Verses'),
    SuraData(suraNumber: '73', suraNameEn: 'Al-Muzzammil', suraNameAr: 'المزّمّل', verses: '20 Verses'),
    SuraData(suraNumber: '74', suraNameEn: 'Al-Muddaththir', suraNameAr: 'المدّثر', verses: '56 Verses'),
    SuraData(suraNumber: '75', suraNameEn: 'Al-Qiyamah', suraNameAr: 'القيامة', verses: '40 Verses'),
    SuraData(suraNumber: '76', suraNameEn: 'Al-Insan', suraNameAr: 'الانسان', verses: '31 Verses'),
    SuraData(suraNumber: '77', suraNameEn: 'Al-Mursalat', suraNameAr: 'المرسلات', verses: '50 Verses'),
    SuraData(suraNumber: '78', suraNameEn: 'An-Naba', suraNameAr: 'النبأ', verses: '40 Verses'),
    SuraData(suraNumber: '79', suraNameEn: 'An-Nazi\'at', suraNameAr: 'النازعات', verses: '46 Verses'),
    SuraData(suraNumber: '80', suraNameEn: 'Abasa', suraNameAr: 'عبس', verses: '42 Verses'),
    SuraData(suraNumber: '81', suraNameEn: 'At-Takwir', suraNameAr: 'التكوير', verses: '29 Verses'),
    SuraData(suraNumber: '82', suraNameEn: 'Al-Infitar', suraNameAr: 'الانفطار', verses: '19 Verses'),
    SuraData(suraNumber: '83', suraNameEn: 'Al-Mutaffifin', suraNameAr: 'المطفّفين', verses: '36 Verses'),
    SuraData(suraNumber: '84', suraNameEn: 'Al-Inshiqaaq', suraNameAr: 'الانشقاق', verses: '25 Verses'),
    SuraData(suraNumber: '85', suraNameEn: 'Al-Buruj', suraNameAr: 'البور', verses: '22 Verses'),
    SuraData(suraNumber: '86', suraNameEn: 'At-Tariq', suraNameAr: 'الطارق', verses: '17 Verses'),
    SuraData(suraNumber: '87', suraNameEn: 'Al-A\'la', suraNameAr: 'الاعلى', verses: '19 Verses'),
    SuraData(suraNumber: '88', suraNameEn: 'Al-Ghashiyah', suraNameAr: 'الغاشية', verses: '26 Verses'),
    SuraData(suraNumber: '89', suraNameEn: 'Al-Fajr', suraNameAr: 'الفجر', verses: '16 Verses'),
    SuraData(suraNumber: '90', suraNameEn: 'Al-Balad', suraNameAr: 'البلد', verses: '20 Verses'),
    SuraData(suraNumber: '91', suraNameEn: 'Ash-Shams', suraNameAr: 'الشمس', verses: '15 Verses'),
    SuraData(suraNumber: '92', suraNameEn: 'Al-Lail', suraNameAr: 'الليل', verses: '21 Verses'),
    SuraData(suraNumber: '93', suraNameEn: 'Ad-Dhuha', suraNameAr: 'الضحى', verses: '11 Verses'),
    SuraData(suraNumber: '94', suraNameEn: 'Ash-Sharh', suraNameAr: 'الشرح', verses: '8 Verses'),
    SuraData(suraNumber: '95', suraNameEn: 'At-Tin', suraNameAr: 'التين', verses: '8 Verses'),
    SuraData(suraNumber: '96', suraNameEn: 'Al-Alaq', suraNameAr: 'العقّ', verses: '19 Verses'),
    SuraData(suraNumber: '97', suraNameEn: 'Al-Qadr', suraNameAr: 'القدر', verses: '5 Verses'),
    SuraData(suraNumber: '98', suraNameEn: 'Al-Bayyina', suraNameAr: 'البينة', verses: '8 Verses'),
    SuraData(suraNumber: '99', suraNameEn: 'Az-Zalzalah', suraNameAr: 'الزلزلة', verses: '8 Verses'),
    SuraData(suraNumber: '100', suraNameEn: 'Al-Adiyat', suraNameAr: 'العين', verses: '11 Verses'),
    SuraData(suraNumber: '101', suraNameEn: 'Al-Qari\'a', suraNameAr: 'القرءان', verses: '11 Verses'),
    SuraData(suraNumber: '102', suraNameEn: 'At-Takathur', suraNameAr: 'التكاثر', verses: '8 Verses'),
    SuraData(suraNumber: '103', suraNameEn: 'Al-Asr', suraNameAr: 'العصر', verses: '3 Verses'),
    SuraData(suraNumber: '104', suraNameEn: 'Al-Humazah', suraNameAr: 'الهمزة', verses: '9 Verses'),
    SuraData(suraNumber: '105', suraNameEn: 'Al-Fil', suraNameAr: 'الفيل', verses: '5 Verses'),
    SuraData(suraNumber: '106', suraNameEn: 'Quraysh', suraNameAr: 'قريش', verses: '7 Verses'),
    SuraData(suraNumber: '107', suraNameEn: 'Al-Ma\'un', suraNameAr: 'الماعون', verses: '5 Verses'),
    SuraData(suraNumber: '108', suraNameEn: 'Al-Kawthar', suraNameAr: 'الكوثر', verses: '4 Verses'),
    SuraData(suraNumber: '109', suraNameEn: 'Al-Kafirun', suraNameAr: 'الكافرون', verses: '6 Verses'),
    SuraData(suraNumber: '110', suraNameEn: 'An-Nasr', suraNameAr: 'النصر', verses: '3 Verses'),
    SuraData(suraNumber: '111', suraNameEn: 'Al-Masad', suraNameAr: 'المسد', verses: '5 Verses'),
    SuraData(suraNumber: '112', suraNameEn: 'Al-Ikhlas', suraNameAr: 'الاخلاص', verses: '4 Verses'),
    SuraData(suraNumber: '113', suraNameEn: 'Al-Falaq', suraNameAr: 'الفلق', verses: '5 Verses'),
    SuraData(suraNumber: '114', suraNameEn: 'An-Nas', suraNameAr: 'الناس', verses: '6 Verses'),
  ];
  List<String> recentSuraIndexList = [];
  List<String> searchSuraModel = [];




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/quran_bk.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Image.asset(
              'assets/images/onBoardingTop.png',
              height: size.height * 0.18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                onChanged: (value) {
                  searchQuery = value;
                  search(searchQuery);
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: MyColors.primary,
                      width: 5.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: MyColors.primary,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: MyColors.primary,
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Sura Name',
                  labelStyle: TextStyle(
                    color: MyColors.white,
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: ImageIcon(
                      AssetImage('assets/icons/quranIcon.png'),
                      color: MyColors.primary,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: MyColors.primary, // Change the text color while typing
                  fontSize: size.height * 0.017,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: MyColors.primary, // Matches the theme color
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Visibility(
              visible: searchQuery.isEmpty,
              replacement: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: ()=>_onSuraTap(index),
                  child: SuraCardWidget(
                    suraData: suraList[index],
                  ),
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Divider(
                    color: MyColors.white,
                  ),
                ),
                itemCount: searchSuraModel.length,
              ),
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Most Recent',
                      style: TextStyle(
                        color: MyColors.white,
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontRes.janna,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.17,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: recentSura.length,
                    itemBuilder: (context, index) => RecentCardWidget(
                      suraData: recentSura[index],
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Suras List',
                      style: TextStyle(
                        fontFamily: FontRes.janna,
                        color: MyColors.white,
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: ()=>_onSuraTap(index),
                    child: SuraCardWidget(
                      suraData: suraList[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Divider(
                      color: MyColors.white,
                    ),
                  ),
                  itemCount: suraList.length,
                ),
              ],
            ), ),
          ],
        ),
      ),
    );
  }
  _onSuraTap(int index)
  {
    _cashSuraIndex(index);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuranDetailsView(
          suraData: suraList[index],
        ),
      ),);
  }

  _cashSuraIndex(int index) async
  {
    String indexString = index.toString();
    if(recentSuraIndexList.contains(indexString)) return;
    recentSuraIndexList.add(indexString);
    await SharedPref.setList(SharedPrefKeys.recentSura, recentSuraIndexList);
    _loadRecentSura();
    setState(() {

    });
  }


  _loadRecentSura() {
    // recentSuraIndexList = [];
    recentSura = [];
     List<String> recentSuraIndex = SharedPref.getStringList(SharedPrefKeys.recentSura) ?? [];

     for (var index in recentSuraIndex) {
       int indexInt = int.parse(index);
       recentSura.add(suraList[indexInt]);
     }
  }

  void search(String searchQuery)
  {
    searchSuraModel = [];
    for (var element in suraList) {
      if(element.suraNameAr.contains(searchQuery) || element.suraNameEn.toLowerCase().contains(searchQuery.toLowerCase(),)) {
        {
          searchSuraModel.add(element.suraNameEn);
        }
      }
    }
  }
}
