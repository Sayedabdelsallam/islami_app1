import 'package:flutter/material.dart';
import 'package:islami_app/modules/times/widget/azkar_widget.dart';
import 'package:islami_app/modules/times/widget/sallah_time_widget.dart';
import 'package:islami_app/shared/colors.dart';

class TimesScreen extends StatelessWidget {
  const TimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/times_bk.png'),
          fit: BoxFit.cover,
        ),
      ),
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
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.01,),
            height: size.height * 0.37,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF856B3F),
              borderRadius: BorderRadius.circular(40.0),
              image: DecorationImage(
                image: AssetImage('assets/images/time_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      '16 Jul,\n 2024',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: MyColors.white,
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Pray Time',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: MyColors.darkPrimary,
                            fontSize: size.height * 0.03,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Tuesday',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: MyColors.black,
                            fontSize: size.height * 0.027,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '09 Muh,\n  1446',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: MyColors.white,
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SallahTimeWidget(),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      'Next Pray - 02:32',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: MyColors.black,
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                          Icons.volume_up,
                          color: MyColors.black,
                          size: size.height * 0.03
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
              'Azkar',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: MyColors.white,
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w700,
              )
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              AzkarWidget(
                image: 'assets/images/morning_azkar.png',
                title: 'Morning Azkar',
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              AzkarWidget(
                title: 'Evening Azkar',
                image: 'assets/images/evening_azkar.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
