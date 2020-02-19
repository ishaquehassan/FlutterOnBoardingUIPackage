import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_boarding_ui/model/slider.dart' as SliderModel;
import 'screens/landing_page.dart';

class OnBoardingUi extends StatelessWidget{
  final List<SliderModel.Slider> slides;

  OnBoardingUi(this.slides);

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
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS, 
      ),
      child: LandingPage(slides),
    );
  }

}
