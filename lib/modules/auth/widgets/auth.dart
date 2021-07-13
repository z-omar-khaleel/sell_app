import 'package:flutter/material.dart';
import 'package:sell_app/modules/auth/controller/cubit/cubit_auth.dart';
import 'package:sell_app/modules/auth/widgets/sign_in.dart';
import 'package:sell_app/modules/auth/widgets/sign_up.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class AuthPage extends StatelessWidget {
  final bool isRegister;

  AuthPage(this.isRegister);

  @override
  Widget build(BuildContext context) {
    final ref = SellAppAuthCubit.get(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isRegister ? SignUpWidget() : LoginWidget(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ElevatedButton(
              style: ButtonStyle(alignment: Alignment.center),
              onPressed: () {
                if (isRegister) {
                  if (ref.keyRegister.currentState!.validate()) {}
                } else {
                  if (ref.keyLogin.currentState!.validate()) {}
                }
              },
              child: customText(isRegister ? 'Sign Up' : 'Sign In',
                  textAlign: TextAlign.center,
                  alignment: Alignment.center,
                  color: Colors.white)),
        ),
        SizedBox(
          height: 17,
        ),
        signWith(context, isRegister, ref)
      ],
    );
  }
}

Widget signWith(context, bool isRegister, SellAppAuthCubit ref) {
  return Column(
    children: [
      customText('Or, sign up with', alignment: Alignment.center),
      SizedBox(
        height: MediaQuery.of(context).size.height * .03,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(onTap: () {}, child: Image.asset('assets/images/apple.png')),
          SizedBox(
            width: 5,
          ),
          InkWell(onTap: () {}, child: Image.asset('assets/images/google.png')),
          SizedBox(
            width: 5,
          ),
          InkWell(
              onTap: () {}, child: Image.asset('assets/images/facebook.png')),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(isRegister
              ? 'Already have an account?'
              : 'Don\'t have a minimo account yet?'),
          TextButton(
            onPressed: () {
              isRegister ? ref.changeRegister(false) : ref.changeRegister(true);
            },
            child: Text(isRegister ? 'SIGN UP' : 'SIGN IN'),
            style: TextButton.styleFrom(primary: primaryColorWhite),
          )
        ],
      )
    ],
  );
}
