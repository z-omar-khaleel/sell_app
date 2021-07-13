import 'package:flutter/material.dart';
import 'package:sell_app/modules/auth/screens/auth_screen.dart';
import 'package:sell_app/modules/on_boarding/models/model_boarding.dart';
import 'package:sell_app/services/shared_pref.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'build_page_view_item.dart';

class BuidPageView extends StatefulWidget {
  @override
  _BuidPageViewState createState() => _BuidPageViewState();
}

class _BuidPageViewState extends State<BuidPageView> {
  var _boardController = PageController();
  bool isLast = false;

  List<BoardingModel> _boardings = [
    BoardingModel(
        title: 'The Best way to explore an off-beat location',
        image: 'assets/images/onboarding_1.png'),
    BoardingModel(
        title: 'Find a home or space from our Platform.',
        image: 'assets/images/onboarding2.png'),
    BoardingModel(
        image: 'assets/images/onboarding3.png',
        title: 'Find a home or space from our Platform.')
  ];
  submit() {
    SharePref.setData(key: 'isBoarding', data: true).then((value) {
      if (value) pushNavAndReplace(context, LoginScreen());
    });
  }

  int indexNow = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .4,
          width: double.infinity,
          child: PageView.builder(
            controller: _boardController,
            itemBuilder: (BuildContext context, int index) {
              return BuildPageItem(_boardings[index]);
            },
            onPageChanged: (int index) async {
              if (index == _boardings.length - 1) {
                setState(() {
                  isLast = true;
                  indexNow = index;
                });
                await Future.delayed(Duration(seconds: 5));
                submit();
              } else {
                setState(() {
                  isLast = false;
                  indexNow = index;
                });
              }
            },
            itemCount: _boardings.length,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: _boardController,
              effect: ExpandingDotsEffect(
                dotColor: primaryColorWhite.withOpacity(.2),
                activeDotColor: primaryColorWhite,
                dotHeight: 15,
                expansionFactor: 2,
                dotWidth: 20,
                spacing: 10.0,
              ),
              count: _boardings.length,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .08,
        ),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: double.infinity,
            child: indexNow == 0
                ? ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(15))),
                    onPressed: () {
                      submit();
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline4!.color),
                    ),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(15))),
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        _boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline4!.color),
                    ),
                  )),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account?'),
            SizedBox(
              width: 1,
            ),
            TextButton(
              onPressed: () {
                submit();
              },
              child: Text('Sign up'),
              style: TextButton.styleFrom(primary: primaryColorWhite),
            )
          ],
        )
      ],
    );
  }
}
