import 'package:flutter/material.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child:
                Image(image: AssetImage('assets/images/logo_onboarding.png'))),
        SizedBox(
          height: 14,
        ),
        Align(
            alignment: Alignment.center,
            child: Image(image: AssetImage('assets/images/text_logo.png'))),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
      ],
    );
  }
}
