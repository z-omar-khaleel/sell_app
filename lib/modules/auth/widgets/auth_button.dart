import 'package:flutter/material.dart';
import 'package:sell_app/modules/auth/controller/cubit/cubit_auth.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class AuthButton extends StatelessWidget {
  final bool isRegister;
  final SellAppAuthCubit ref;

  AuthButton(this.isRegister, this.ref);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .40,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color:
                              isRegister ? Colors.grey : primaryColorWhite))),
              child: TextButton(
                  onPressed: () {
                    ref.changeRegister(false);
                  },
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: isRegister ? Colors.black : primaryColorWhite),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)))),
                    backgroundColor: MaterialStateProperty.all(isRegister
                        ? Color(0xffE5E5E5)
                        : Colors.white.withOpacity(.5)),
                  )),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color:
                              isRegister ? primaryColorWhite : Colors.grey))),
              child: TextButton(
                onPressed: () {
                  ref.changeRegister(true);
                },
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: isRegister ? primaryColorWhite : Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(isRegister
                      ? Colors.white.withOpacity(.5)
                      : Color(0xffE5E5E5)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
