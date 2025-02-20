import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_data.dart';
import 'package:islami_app/shared/colors.dart';

class RecentCardWidget extends StatelessWidget {

  final SuraData suraData;

  const RecentCardWidget({super.key, required this.suraData,});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.17,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: size.height * 0.001,
                ),
                Text(suraData.suraNameEn,
                    style: TextStyle(
                      color: MyColors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                Text(suraData.suraNameAr,
                    style: TextStyle(
                      color: MyColors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                Text(suraData.verses,
                    style: TextStyle(
                      color: MyColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: size.height * 0.001,
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/images/most_recent_bk.png',
            height: size.height * 0.15,
          ),
        ],
      ),
    );
  }
}
