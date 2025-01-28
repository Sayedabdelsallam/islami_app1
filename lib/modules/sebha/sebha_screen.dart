import 'package:flutter/material.dart';
import 'package:islami_app/shared/colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  double angle = 0;
  int currentIndex = 1;
  List<String> tasbeh = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sebha_bk.png'),
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
            height: size.height * 0.04,
          ),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height * 0.04,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
              fontFamily: 'Janna',
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          GestureDetector(
            onTap: _onSebhaTapped,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/sebhaTop.png',
                      height: size.height * 0.10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          'assets/images/SebhaBody.png',
                          height: size.height * 0.42,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.095,
                    ),
                    Text(
                      tasbeh[currentIndex],
            
                      style: TextStyle(
                          fontSize: size.height * 0.04,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white,
                          fontFamily: 'Janna'
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      counter.toString(),
            
                      style: TextStyle(
                          fontSize: size.height * 0.04,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white,
                          fontFamily: 'Janna'
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onSebhaTapped() {
    angle -= 0.1;
    counter++;
    if (counter == 33) {
      currentIndex = (currentIndex + 1) % 3;
      counter = 0;
    }
    setState(() {});
  }

}
