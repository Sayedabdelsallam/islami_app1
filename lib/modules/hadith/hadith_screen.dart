import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadith_data.dart';
import 'package:islami_app/modules/hadith/widgets/hadith_item_card.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    if(hadithDataList.isEmpty) loadHadithData();
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hadith_bk.png'),
          fit: BoxFit.cover,

        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height * 0.02,),
          Image.asset(
            'assets/images/onBoardingTop.png',
            height: size.height * 0.16,
          ),
          Expanded(
            child: CarouselSlider(
                items: hadithDataList.map((item) => HadithItemCard(
                  hadithData: item,
                )).toList(),
                options: CarouselOptions(
                  // height: 900,
                  aspectRatio: 0.5,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )
            ),
          )
        ],
      ),
    );
  }

   Future<void> loadHadithData() async {
     String content = await rootBundle
         .loadString('assets/files/ahadeth.txt');
     List<String> allHadith = content.split('#');
     for(var element in allHadith){
       String singleHadith = element.trim();
       int index = singleHadith.indexOf('\n');
       String hadithContent = singleHadith.substring(index +1 );
       String hadithTitle = singleHadith.substring(0,index);
       var hadithData = HadithData(title: hadithTitle, content: hadithContent);
       hadithDataList.add(hadithData);
       setState(() {

       });
     }
   }
}
