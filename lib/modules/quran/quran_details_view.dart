import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/sura_data.dart';
import 'package:islami_app/shared/colors.dart';

class QuranDetailsView extends StatefulWidget {
 const QuranDetailsView({super.key,required this.suraData});
  static const String routeName = 'quranDetails';
  final SuraData suraData;

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    loadData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.suraData.suraNameEn,
          style: TextStyle(
            fontFamily: 'Janna',
            color: MyColors.primary,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: MyColors.black,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/QuranDtLeft.png',
                  width: size.width * 0.25,
                  height: size.height * 0.12,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/QuranDtRght.png',
                  width: size.width * 0.25,
                  height: size.height * 0.12,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/QuranDtBottom.png',
                width: double.infinity,
                height: size.height * 0.15,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    widget.suraData.suraNameAr,
                    style: TextStyle(
                      fontFamily: 'Janna',
                      color: MyColors.primary,
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.09,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: versesList.length,
                      itemBuilder: (context, index) => Text(
                        '[${index + 1}] ${versesList[index]} ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Janna',
                          color: MyColors.primary,
                          fontSize: size.height * 0.027,
                          fontWeight: FontWeight.bold,
                        ),
                      ), ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadData() async {
    try {
      String content = await rootBundle
          .loadString('assets/files/${widget.suraData.suraNumber}.txt');
      setState(() {
        versesList = content.split('\n');
      });
    } catch (e) {
      setState(() {
        versesList = ['Error loading sura content. Please try again later.'];
      });
      debugPrint('Error loading file: $e');
    }
  }
}