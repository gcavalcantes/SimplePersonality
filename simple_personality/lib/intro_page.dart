import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      next: const Text("Next"),
      skip: const Text("Skip"),
      done: const Text("Done"),
      onDone: () {},
      onSkip: () {},
      pages: [
        PageViewModel(
          title: "Title of first page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child:
                Image.network("https://domaine.com/image.png", height: 175.0),
          ),
        )
      ],
    ));
  }
}
