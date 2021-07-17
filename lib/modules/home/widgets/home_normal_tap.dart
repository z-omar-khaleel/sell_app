import 'package:flutter/material.dart';
import 'package:sell_app/modules/home/controller/cubit/home_cubit.dart';
import 'package:sell_app/modules/home/models/carousel_info.dart';
import 'package:sell_app/modules/home/widgets/vertical%20_list_main.dart';
import 'package:sell_app/utils/component/components.dart';

import 'carsoel_widget.dart';

class HomeNormalTapWidget extends StatelessWidget {
  List<CaroselInfo>? _items;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    _items = SellAppCubitHome.get(context).items;
    return Column(
      children: [
        Container(
          height: query * .4,
          child: CarsoelWidget(_items!),
        ),
        SizedBox(
          height: query * .03,
        ),
        customText('Featured Property', fontWeight: FontWeight.bold),
        SizedBox(
          height: query * .03,
        ),
        VerticalListWidget(_items!),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
