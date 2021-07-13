import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_app/modules/auth/widgets/header.dart';
import 'package:sell_app/modules/home/models/main_home_model.dart';
import 'package:sell_app/modules/home/widgets/select_screen_item.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class SelectScreen extends StatelessWidget {
  final List<MainHomeModel> myProducts = [
    MainHomeModel(
      color: textHeadline4White,
      img: 'assets/images/house.png',
      title: 'House',
    ),
    MainHomeModel(
        color: textHeadline4White,
        img: 'assets/images/apartment.png',
        title: 'Apartment'),
    MainHomeModel(
        color: textHeadline4White,
        img: 'assets/images/office.png',
        title: 'Office'),
    MainHomeModel(
        color: textHeadline4White,
        img: 'assets/images/house.png',
        title: 'House'),
  ];
  Color color = textHeadline4White;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .032,
              ),
              HeaderAuth(),
              SizedBox(
                height: query * .05,
              ),
              customText('What do you want to sell?',
                  fontSize: 16, alignment: Alignment.center),
              SizedBox(
                height: query * .015,
              ),
              customText('Select a property type below to begins',
                  fontWeight: FontWeight.w100,
                  color: textHeadline6White.withOpacity(.6),
                  fontSize: 14,
                  alignment: Alignment.center),
              SizedBox(
                height: query * .05,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: myProducts.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return SelectItemWidget(index);
                    }),
              ),
              Container(
                height: 48,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: ElevatedButton(
                    style: ButtonStyle(
                      alignment: Alignment.center,
                    ),
                    onPressed: () {},
                    child: customText('Continue',
                        alignment: Alignment.center, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
