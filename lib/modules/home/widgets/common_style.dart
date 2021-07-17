import 'package:flutter/material.dart';
import 'package:sell_app/modules/home/models/carousel_info.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class CommonWidget extends StatelessWidget {
  final CaroselInfo model;

  CommonWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customText(model.title, fontSize: 14),
        SizedBox(
          height: 12,
        ),
        customText('\$ ${model.price}', color: primaryColorWhite),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Row(
              children: [
                Image.asset('assets/images/Bathroom.png'),
                SizedBox(
                  width: 7,
                ),
                customText('${model.noBathroom} Bathroom', fontSize: 12)
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Image.asset('assets/images/Bathroom.png'),
                SizedBox(
                  width: 7,
                ),
                customText('${model.noBathroom} Bedroom', fontSize: 12)
              ],
            )),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Image.asset('assets/images/Space.png'),
            SizedBox(
              width: 7,
            ),
            customText('${model.area} Sq. Fit', fontSize: 13),
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
