import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadith_data.dart';
import 'package:islami_app/shared/colors.dart';

class HadithItemCard extends StatelessWidget {
  const HadithItemCard({super.key, required this.hadithData});
  final HadithData hadithData;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: size.height * 0.02,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/HadithCardBk.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            hadithData.title,
            style: TextStyle(
              fontFamily: "Janna",
              color: MyColors.black,
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  Text(
                    hadithData.content,
                    textAlign:  TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Janna",
                      color: MyColors.black,
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
