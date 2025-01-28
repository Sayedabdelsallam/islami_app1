import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_data.dart';
import 'package:islami_app/shared/colors.dart';

class SuraCardWidget extends StatelessWidget {
  const SuraCardWidget({
    super.key,
    required this.suraData,
  });
  final SuraData suraData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/icons/num_border.png',
                width: 55,
                height: 55,
              ),
              Text(
                suraData.suraNumber,
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraData.suraNameEn,
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                suraData.verses,
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            suraData.suraNameAr,
            style: TextStyle(
              color: MyColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
