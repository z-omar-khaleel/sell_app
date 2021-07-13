import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_app/modules/auth/controller/states/states_auth.dart';

class SellAppAuthCubit extends Cubit<SellAppAuthStates> {
  SellAppAuthCubit(SellAppAuthStates initialState) : super(initialState);
  var emailControllerLogin = TextEditingController(text: 'ok@hotmail.com');
  var passControllerLogin = TextEditingController();
  var passControllerSetPass1 = TextEditingController();
  var passControllerSetPass2 = TextEditingController();
  var emailControllerSignUp = TextEditingController(text: 'ok@hotmail.com');
  var emailControllerForgetPass = TextEditingController(text: 'ok@hotmail.com');
  var passControllerSignUp = TextEditingController();
  final keyLogin = GlobalKey<FormState>();
  final keyForget = GlobalKey<FormState>();
  final keyRegister = GlobalKey<FormState>();
  final keySetPass = GlobalKey<FormState>();
  bool emailCheck = false;
  bool emailCheckSignUp = false;
  bool emailCheckSet = false;
  void changeEmailCheck(String val, bool isChecked) {
    if (val.trim() == 'check') {
      emailCheck = isChecked;
    }

    if (val.trim() == 'checkSignUp') {
      emailCheckSignUp = isChecked;
    } else {
      emailCheckSet = isChecked;
    }
    emit(SellCheckEmailState());
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static SellAppAuthCubit get(context) =>
      BlocProvider.of<SellAppAuthCubit>(context);
  bool _isRegister = false;
  bool get isRegister => _isRegister;
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SellChangePasswordVisibilityState());
  }

  changeRegister(bool val) {
    _isRegister = val;
    emit(SellAppAuthChangeRegister());
  }
}
