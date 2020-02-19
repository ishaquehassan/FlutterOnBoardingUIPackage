import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui_view/slider_layout_view.dart';
import 'package:on_boarding_ui/model/slider.dart' as SliderModel;

class LandingPage extends StatefulWidget {
  final List<SliderModel.Slider> slides;

  LandingPage(this.slides);

  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(widget.slides),
      );
}
