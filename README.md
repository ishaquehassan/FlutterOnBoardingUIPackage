# flutter_onboarding_ui

A conceptual design for on boarding screens for mobile apps. This app provides you with all the information you need to explore how to work with mobile on boarding in mobile apps.

![preview (1)](https://github.com/ishaquehassan/FlutterOnBoardingUIPackage/blob/master/demo.png?raw=true)

## Usage Sample
```dart
class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingUi([
        SliderModel.Slider(
          sliderHeading: "Slide 1",
          sliderSubHeading: "Slide Sub Heading 1",
          sliderImageUrl: CImages.slider1,
        ),
        SliderModel.Slider(
          sliderHeading: "Slide 1",
          sliderSubHeading: "Slide Sub Heading 1",
          sliderImageUrl: CImages.slider2,
        ),
        SliderModel.Slider(
          sliderHeading: "Slide 1",
          sliderSubHeading: "Slide Sub Heading 1",
          sliderImageUrl: CImages.slider3,
        )
      ]),
    );
  }
}

```

### Inspired By : https://github.com/CodeHomie/Flutter-Onboarding-UI-Concept

