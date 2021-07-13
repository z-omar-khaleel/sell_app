import 'package:flutter/material.dart';

import 'package:sell_app/modules/on_boarding/widgets/build_pageView.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image(
                      image: AssetImage('assets/images/logo_onboarding.png'))),
              SizedBox(
                height: 25,
              ),
              Align(
                  alignment: Alignment.center,
                  child:
                      Image(image: AssetImage('assets/images/text_logo.png'))),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              BuidPageView(),
            ],
          ),
        ),
      ),
    );
  }
}
