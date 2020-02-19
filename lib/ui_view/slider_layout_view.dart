import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_boarding_ui/OnBoarding.dart';
import 'package:on_boarding_ui/model/slider.dart' as SliderModel;

import '../constants/constants.dart';
import '../widgets/slide_dots.dart';
import '../widgets/slide_items/slide_item.dart';

class SliderLayoutView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout(){
    var slides = Configs.getInstance().slides;
    return Container(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: slides.length,
                itemBuilder: (ctx, i) => SlideItem(slides,i),
              ),
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      if(_currentPage+1 < slides.length){
                        _pageController.jumpToPage(_currentPage+1);
                      }else{
                        Configs.getInstance().onFinish();
                      }
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                        child: Text(
                          _currentPage+1 == slides.length ? Constants.FINISH : Constants.NEXT,
                          style: TextStyle(
                            fontFamily: Constants.OPEN_SANS,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Configs.getInstance().onFinish();
                    },
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                        child: Text(
                          _currentPage+1 == slides.length ? Constants.FINISH : Constants.SKIP,
                          style: TextStyle(
                            fontFamily: Constants.OPEN_SANS,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < slides.length; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
