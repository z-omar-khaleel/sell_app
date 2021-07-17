import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sell_app/modules/home/controller/cubit/home_cubit.dart';
import 'package:sell_app/modules/home/controller/states/home_states.dart';
import 'package:sell_app/modules/home/screens/filter_screen.dart';
import 'package:sell_app/modules/home/widgets/search_tap.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

import 'home_normal_tap.dart';

class HomeTab extends StatelessWidget {
  /// just  define _formkey with static final

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<SellAppCubitHome, SellAppHomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final ref = SellAppCubitHome.get(context);

          return SingleChildScrollView(
            //h
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/more.png',
                            width: 40,
                            height: 40,
                          )),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.154),
                            borderRadius: BorderRadius.circular(124)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_rounded,
                              color: primaryColorWhite,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: query * .09,
                      ),
                      Expanded(
                          child: Container(
                        height: 45,
                        child: _FormWidget(),
                      )),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {
                            Get.off(FilterScreen());
                            SellAppCubitHome.get(context)
                                .changeBottomVisibality(false);
                          },
                          child: Image.asset('assets/images/Filter.png')),
                    ],
                  ),
                  SizedBox(
                    height: query * .02,
                  ),
                  ref.isSearched ? SearchWidget() : HomeNormalTapWidget()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return BuildForm();
  }
}

class BuildForm extends StatelessWidget {
  bool cancelFocus = false;

  @override
  Widget build(BuildContext context) {
    final ref2 = SellAppCubitHome.get(context);
    final keyboard = MediaQuery.of(context).viewInsets.bottom;
    return Form(
      child: defaultFormField(
          prefix: ref2.isSearched
              ? Icon(
                  Icons.location_on,
                  size: 23,
                  color: primaryColorWhite,
                )
              : null,
          textInputAction: TextInputAction.search,
          onTap: () {
            if (keyboard == 0 && !ref2.isSearched && !cancelFocus) {
              ref2.changeSearchValue(true);
            }
            cancelFocus = false;
          },
          onChange: (s) {},
          controller: ref2.searchHomeController,
          borderRadius: 10,
          type: TextInputType.text,
          label: 'Search',
          fillColor: Colors.grey.withOpacity(.05),
          labelColor: Colors.grey,
          suffix: Icon(
            ref2.isSearched ? Icons.cancel : Icons.search,
            color: Colors.grey.withOpacity(.5),
          ),
          suffixPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());

            ref2.searchHomeController.clear();
            cancelFocus = true;
            ref2.changeSearchValue(false);
          }),
    );
  }
}
