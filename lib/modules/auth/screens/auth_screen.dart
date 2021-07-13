import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_app/modules/auth/controller/cubit/cubit_auth.dart';
import 'package:sell_app/modules/auth/controller/states/states_auth.dart';
import 'package:sell_app/modules/auth/widgets/auth_button.dart';
import 'package:sell_app/modules/auth/widgets/header.dart';
import 'package:sell_app/modules/auth/widgets/auth.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: BlocConsumer<SellAppAuthCubit, SellAppAuthStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final ref = SellAppAuthCubit.get(context);
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .032,
                  ),
                  HeaderAuth(),
                  AuthButton(ref.isRegister, ref),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  AuthPage(ref.isRegister),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
