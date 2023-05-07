import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plantapps/screen/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 15.0,
        fontFamily: "Noto",
        color: Color(0xFF6A6F7D)
    );

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
        fontFamily: "Noto",
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: Color(0xFF36455A)
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      isTopSafeArea: true,
      isBottomSafeArea: true,
      /*globalHeader: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: _buildImage('logo_main.png', 100),
              ),
            ),
          ),
          Container(
            height: 48.0)
        ]
      ),*/
      /*globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Let\'s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),*/
      pages: [
        PageViewModel(
          title: "Informasi Tanaman",
          body:
          "cari tahu lebih detil informasi tanaman\ndisekitar anda!",
          image: _buildImage('boarding_1.png', 300),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pelajari Berbagai Jenis Tanaman",
          body:
          "pelajari manfaat dari setiap jenis tanaman\nmulai dari tanaman hias hingga tanaman obat",
          image: _buildImage('boarding_2.png', 300),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Dapatkan Informasi Terkini",
          body:
          "dapatkan informasi terkini mulai dari perawatan\ndan informasi tanaman lainnya",
          image: _buildImage('boarding_3.png', 300),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
