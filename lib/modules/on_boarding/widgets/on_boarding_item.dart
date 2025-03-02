import 'package:flutter/material.dart';
import 'package:islami_app/shared/colors.dart';

import '../../../res/font_res.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {super.key,
      required this.title,
      required this.image,
      required this.description});
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          image,
          width: size.width * 0.8,
          height: size.height * 0.5,
        ),
        Text(
          title,
          style: TextStyle(
            color: MyColors.primary,
            fontFamily: FontRes.janna,
            fontSize: size.height * 0.03,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Text(
          description,
          style: TextStyle(
            color: MyColors.primary,
            fontFamily: FontRes.janna,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
