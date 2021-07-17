import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:sell_app/modules/auth/controller/cubit/cubit_auth.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ref = SellAppAuthCubit.get(context);

    return Column(
      children: [
        customText('Welcome to back', fontSize: 12, color: textHeadline6White),
        SizedBox(
          height: 15,
        ),
        customText('Login with', fontWeight: FontWeight.bold, fontSize: 20),
        SizedBox(
          height: 20,
        ),
        customText('Email', fontSize: 14),
        SizedBox(
          height: 10,
        ),
        Form(
          key: ref.keyLogin,
          child: Column(
            children: [
              Container(
                height: 70,
                child: defaultFormField(
                    hintText: ' ',
                    onChange: (s) {
                      if (GetUtils.isEmail(s ?? '')) {
                        ref.changeEmailCheck('setCheck', true);
                        print(s);
                      } else {
                        ref.changeEmailCheck('setCheck', false);
                      }
                    },
                    suffix: ref.emailCheckSet
                        ? Icon(
                            Icons.check_circle,
                            color: primaryColorWhite,
                          )
                        : null,
                    focusBorderRadius: 8,
                    controller: ref.emailControllerLogin,
                    type: TextInputType.text,
                    validate: (s) {
                      if (s!.trim().isEmpty) {
                        return 'Enter your email';
                      }
                      if (!GetUtils.isEmail(s)) return 'Enter valid Email';
                    }),
              ),
              SizedBox(
                height: 9,
              ),
              customText('Password', fontSize: 14),
              SizedBox(
                height: 15,
              ),
              IntrinsicHeight(
                child: Container(
                  height: 70,
                  child: defaultFormField(
                      hintText: ' ',
                      onSubmit: (s) {
                        if (ref.keyLogin.currentState!.validate()) {}
                      },
                      focusBorderRadius: 8,
                      controller: ref.passControllerLogin,
                      type: TextInputType.text,
                      isPassword: ref.isPassword,
                      suffix: Icon(ref.suffix),
                      suffixPressed: () {
                        ref.changePasswordVisibility();
                      },
                      validate: (s) {
                        if (s!.trim().isEmpty || s.length < 8) {
                          return 'Enter Valid password The password must be greater than 8 char ';
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
