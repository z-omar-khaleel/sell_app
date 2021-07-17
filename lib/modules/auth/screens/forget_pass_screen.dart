import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:sell_app/modules/auth/controller/cubit/cubit_auth.dart';
import 'package:sell_app/modules/auth/controller/states/states_auth.dart';
import 'package:sell_app/modules/auth/widgets/header.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ref = SellAppAuthCubit.get(context);
    final query = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              SizedBox(
                height: query * .1,
              ),
              HeaderAuth(),
              SizedBox(
                height: query * .07,
              ),
              customText('Forgot Password',
                  fontWeight: FontWeight.bold, fontSize: 20),
              SizedBox(
                height: query * .057,
              ),
              customText('Email', fontSize: 18),
              SizedBox(
                height: 15,
              ),
              BlocConsumer<SellAppAuthCubit, SellAppAuthStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Form(
                    key: ref.keyForget,
                    child: defaultFormField(
                        onChange: (s) {
                          if (GetUtils.isEmail(s ?? '')) {
                            ref.changeEmailCheck('check', true);
                            print(s);
                          } else {
                            ref.changeEmailCheck('check', false);
                          }
                        },
                        suffix: ref.emailCheck
                            ? Icon(
                                Icons.check_circle,
                                color: primaryColorWhite,
                              )
                            : null,
                        focusBorderRadius: 25,
                        controller: ref.emailControllerForgetPass,
                        type: TextInputType.text,
                        validate: (s) {
                          if (s!.trim().isEmpty) {
                            return 'Enter your email';
                          }
                          if (!GetUtils.isEmail(s)) return 'Enter valid Email';
                        }),
                  );
                },
              ),
              SizedBox(
                height: query * .2,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ElevatedButton(
                    style: ButtonStyle(alignment: Alignment.center),
                    onPressed: () {
                      if (ref.keyForget.currentState!.validate()) {}
                    },
                    child: customText('Verify',
                        textAlign: TextAlign.center,
                        alignment: Alignment.center)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
