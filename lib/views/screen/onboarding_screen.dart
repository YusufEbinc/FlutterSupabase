import 'package:flutter/material.dart';
import 'package:flutter_book_app/constant/constant_color.dart';

import 'package:flutter_book_app/views/screen/home_screen.dart';

import 'package:flutter_book_app/views/widgets/text_widget.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            bodyWidget: const Center(
              child: TextWidegt(
                fontName: 'Caslon',
                fontSize: 25,
                titleName: 'A room without books is like a body without a soul',
                textColor: blackColor,
              ),
            ),
            titleWidget: const TextWidegt(
              fontName: 'Monts',
              fontSize: 30,
              titleName: 'Cicero',
              textColor: blackColor,
            ),
            image: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: SizedBox(
                  height: size.height * .5,
                  child: Image.asset('assets/images/book1.png'),
                ),
              ),
            ),
          ),
          PageViewModel(
            bodyWidget: const Center(
              child: TextWidegt(
                fontName: 'Caslon',
                fontSize: 25,
                titleName: 'Think before you speak read before you think',
                textColor: blackColor,
              ),
            ),
            titleWidget: const TextWidegt(
              fontName: 'Monts',
              fontSize: 30,
              titleName: ' Fran Lebowitz',
              textColor: blackColor,
            ),
            image: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: SizedBox(
                  height: size.height * .4,
                  child: Image.asset('assets/images/book2.png'),
                ),
              ),
            ),
          ),
          PageViewModel(
            bodyWidget: const TextWidegt(
              fontName: 'Caslon',
              fontSize: 25,
              titleName: 'Today a reader, tomorrow a leader',
              textColor: blackColor,
            ),
            titleWidget: const TextWidegt(
              fontName: 'Monts',
              fontSize: 30,
              titleName: 'Margaret Fuller',
              textColor: blackColor,
            ),
            image: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: SizedBox(
                  height: size.height * .5,
                  child: Image.asset('assets/images/book3.png'),
                ),
              ),
            ),
          ),
        ],
        done: const Icon(
          Icons.arrow_forward,
          size: 30,
          color: blackColor,
        ),
        onDone: () => nextHomePage(context),
        showDoneButton: true,
        showNextButton: false,
        showSkipButton: false,
        globalBackgroundColor: kBackground,
        skipColor: blackColor,
        nextColor: blackColor,
      ),
    );
  }

  Future<void> nextHomePage(
    BuildContext context,
  ) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => (const HomePage()),
      ),
    );
  }
}
