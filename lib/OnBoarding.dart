import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_boarding_ui/model/slider.dart' as SliderModel;
import 'screens/landing_page.dart';

class Configs {
  static Configs _instance;
  final List<SliderModel.Slider> slides;
  final Function onFinish;

  Configs(this.slides, this.onFinish);

  static Configs getInstance({List<SliderModel.Slider> slides,Function onFinish}) {
    if(_instance == null){
      _instance = Configs(slides,onFinish);
    }

    return _instance;
  }

   // rest of the class
}


class OnBoardingUi extends StatelessWidget{
  final List<SliderModel.Slider> slides;
  final Function onFinish;

  OnBoardingUi({@required this.slides,@required this.onFinish});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,  
    ));
    Configs.getInstance(slides: slides,onFinish: onFinish);

    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS, 
      ),
      child: LandingPage(),
    );
  }

}
