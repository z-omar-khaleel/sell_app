import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_app/modules/auth/controller/cubit/cubit_auth.dart';
import 'package:sell_app/modules/auth/controller/states/states_auth.dart';
import 'package:sell_app/modules/auth/widgets/header.dart';
import 'package:sell_app/utils/component/components.dart';

class SetPassScreen extends StatelessWidget {
  const SetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: query * .1,
              ),
              HeaderAuth(),
              SizedBox(
                height: query * .07,
              ),
              customText('Set New Password',
                  fontWeight: FontWeight.bold, fontSize: 20),
              SizedBox(
                height: query * .047,
              ),
              customText('New Password', fontSize: 18),
              SizedBox(
                height: 15,
              ),
              BlocConsumer<SellAppAuthCubit, SellAppAuthStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  final ref = SellAppAuthCubit.get(context);
                  return Form(
                      key: ref.keySetPass,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          defaultFormField(
                              focusBorderRadius: 20,
                              controller: ref.passControllerSetPass1,
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
                          SizedBox(
                            height: 30,
                          ),
                          customText('Confirm New Password', fontSize: 18),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              onSubmit: (s) {
                                print(ref.passControllerSetPass1.text.trim());
                                print(ref.passControllerSetPass2.text.trim());
                                if (ref.keySetPass.currentState!.validate()) {}
                              },
                              key: GlobalKey(),
                              focusBorderRadius: 20,
                              controller: ref.passControllerSetPass2,
                              type: TextInputType.text,
                              isPassword: ref.isPassword,
                              suffix: Icon(ref.suffix),
                              suffixPressed: () {
                                ref.changePasswordVisibility();
                              },
                              validate: (s) {
                                if (s!.trim().isEmpty ||
                                    s.length < 8 ||
                                    ref.passControllerSetPass1.text.trim() !=
                                        ref.passControllerSetPass2.text
                                            .trim()) {
                                  return 'Password does not match';
                                }
                              }),
                          SizedBox(
                            height: query * .1,
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: ElevatedButton(
                                style: ButtonStyle(alignment: Alignment.center),
                                onPressed: () {
                                  if (ref.keySetPass.currentState!
                                      .validate()) {}
                                },
                                child: customText('Confirm',
                                    textAlign: TextAlign.center,
                                    alignment: Alignment.center)),
                          ),
                        ],
                      ));
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
