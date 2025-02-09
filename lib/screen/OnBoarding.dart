import 'package:flutter/material.dart';
import 'package:movies/widget/onboarding/screen_color.dart';
import 'package:movies/widget/onboarding/static/onboarding.dart';
import 'package:movies/widget/onboarding/text_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(onBoarding[index]["image"])),
            ScreenColor(
              colors: onBoarding[index]['colors'],
            ),
            index == 0
                ? TextAndButton(
                    title: "${onBoarding[index]["title"]}",
                    description: "${onBoarding[index]["description"]}",
                  )
                : TextAndButton(
                    title: onBoarding[index]['title'],
                    description: onBoarding[index]['description'])
          ],
        ),
      ),
    );
  }
}
