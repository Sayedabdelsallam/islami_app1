import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class SallahTimeWidget extends StatelessWidget {
  const SallahTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      width: size.width * 0.32,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/images/sallah_time.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Fajr',
            style: theme.textTheme.bodySmall!.copyWith(
              color: MyColors.white,
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '04:38',
            style: theme.textTheme.bodySmall!.copyWith(
              color: MyColors.white,
              fontSize: size.height * 0.045,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'PM',
            style: theme.textTheme.bodySmall!.copyWith(
              color: MyColors.white,
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
