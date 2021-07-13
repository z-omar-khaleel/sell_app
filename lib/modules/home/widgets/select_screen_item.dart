import 'package:flutter/material.dart';
import 'package:sell_app/modules/home/models/main_home_model.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class SelectItemWidget extends StatefulWidget {
  final int index;

  SelectItemWidget(this.index);

  @override
  _SelectItemWidgetState createState() => _SelectItemWidgetState();
}

class _SelectItemWidgetState extends State<SelectItemWidget> {
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
    return InkWell(
      onHighlightChanged: (s) {
        if (s) {
          setState(() {
            myProducts[widget.index].color = Colors.white;
            print('zeco');
          });
        } else {
          setState(() {
            myProducts[widget.index].color = textHeadline4White;
            print('zeco');
          });
        }
      },
      borderRadius: BorderRadius.circular(14),
      highlightColor: primaryColorWhite,
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.06),
                borderRadius: BorderRadius.circular(14)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Image.asset(
                  myProducts[widget.index].img,
                  height: 50,
                ),
                SizedBox(
                  height: 15,
                ),
                customText(myProducts[widget.index].title,
                    alignment: Alignment.center,
                    color: myProducts[widget.index].color),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
