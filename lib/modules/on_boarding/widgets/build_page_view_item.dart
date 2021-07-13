import 'package:flutter/material.dart';
import 'package:sell_app/modules/on_boarding/models/model_boarding.dart';

class BuildPageItem extends StatelessWidget {
  final BoardingModel model;

  BuildPageItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Image(
          image: AssetImage(model.image),
        )),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).textTheme.headline4!.color,
                fontSize: 17,
                fontFamily: 'Airbnb',
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
