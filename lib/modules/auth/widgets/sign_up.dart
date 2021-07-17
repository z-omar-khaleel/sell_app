import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:sell_app/modules/auth/controller/cubit/cubit_auth.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ref = SellAppAuthCubit.get(context);

    return Column(
      children: [
        customText('Welcome to ofspace',
            fontSize: 12, color: textHeadline6White),
        SizedBox(
          height: 15,
        ),
        customText('New Account', fontWeight: FontWeight.bold, fontSize: 20),
        SizedBox(
          height: 20,
        ),
        customText('Email', fontSize: 14),
        SizedBox(
          height: 10,
        ),
        Form(
          key: ref.keyRegister,
          child: Column(
            children: [
              Container(
                child: defaultFormField(
                    hintText: ' ',
                    onChange: (s1) {
                      if (GetUtils.isEmail(s1 ?? '')) {
                        ref.changeEmailCheck('checkSignUp', true);
                        print(s1);
                      } else {
                        ref.changeEmailCheck('checkSignUp', false);
                      }
                    },
                    suffix: ref.emailCheckSignUp
                        ? Icon(
                            Icons.check_circle,
                            color: primaryColorWhite,
                          )
                        : null,
                    focusBorderRadius: 8,
                    controller: ref.emailControllerSignUp,
                    type: TextInputType.emailAddress,
                    validate: (s) {
                      if (s!.trim().isEmpty) {
                        return 'Enter your email';
                      }
                      if (!GetUtils.isEmail(s)) return 'Enter valid Email';
                    }),
                height: 70,
              ),
              SizedBox(
                height: 9,
              ),
              customText('Password', fontSize: 14),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 70,
                child: defaultFormField(
                    hintText: ' ',
                    onSubmit: (s) {
                      if (ref.keyRegister.currentState!.validate()) {}
                    },
                    key: GlobalKey(),
                    focusBorderRadius: 8,
                    controller: ref.passControllerSignUp,
                    type: TextInputType.text,
                    isPassword: ref.isPassword,
                    suffix: Icon(ref.suffix),
                    suffixPressed: () {
                      ref.changePasswordVisibility();
                    },
                    validate: (s) {
                      if (s!.trim().isEmpty ||
                          s.length < 8 ||
                          !ref.validateStructure(s)) {
                        return 'The password must be greater than 8 and contain Minimum 1 Upper caseMinimum 1 lowercaseMinimum 1 Numeric NumberMinimum 1 Special Character';
                      }
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
