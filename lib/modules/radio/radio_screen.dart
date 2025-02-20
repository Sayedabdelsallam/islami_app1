import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manger.dart';
import 'package:islami_app/models/radio_response_model.dart';

import '../../shared/colors.dart';
import 'widget/custom_tap_bar_item.dart';
import 'widget/radio_item.dart';

class RadioScreen extends StatefulWidget {
   RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
   int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/radio_bk.png'),
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
            height: size.height * 0.18,
          ),
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CustomTapBarItem(
              size: size,
              title: 'Radio',
              isSelected: selectedTab == 0,
              onTap: () {
                setState(() {
                  selectedTab = 0;
                });
              },
            ),
            const SizedBox(width: 10),
            CustomTapBarItem(
              size: size,
              title: 'Reciters',
              isSelected: selectedTab == 1,
              onTap: () {
                setState(() {
                  selectedTab = 1;
                });
              },
            ),
          ],
        ),
      ),
          Expanded(
            child: FutureBuilder(
              future: ApiManger.getRadioData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(
                    color: MyColors.primary,
                  ));
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      ElevatedButton(onPressed: ()
                      {
                        ApiManger.getRadioData();
                        setState(() {
                        });
                      },
                      child: Text('Error: ${snapshot.error}'),),
                    ],
                  );
                } else {
                  log(snapshot.data.toString());
                  RadioResponseModel data = snapshot.data!;
                  return  ListView.builder(
                    itemCount: data.radios!.length,
                    itemBuilder: (context, index) => RadioItem(
                      model: data.radios![index],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
