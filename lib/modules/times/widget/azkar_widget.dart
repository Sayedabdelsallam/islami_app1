import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class AzkarWidget extends StatelessWidget {
  const AzkarWidget({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      height: 270,
      width: 210,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: MyColors.primary,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 200,
            width: 190,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            title,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: MyColors.white,
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
