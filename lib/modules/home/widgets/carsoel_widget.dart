import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sell_app/modules/home/models/carousel_info.dart';

import 'common_style.dart';

class CarsoelWidget extends StatefulWidget {
  final List<CaroselInfo> _items;

  CarsoelWidget(this._items);

  @override
  _CarsoelWidgetState createState() => _CarsoelWidgetState();
}

class _CarsoelWidgetState extends State<CarsoelWidget> {
  int index = 0;

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;

    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        height: query * .4,
        scrollDirection: Axis.horizontal,
      ),
      carouselController: _carouselController,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        child: Image.asset(
                          widget._items[index].img,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          backgroundColor: Colors.grey.withOpacity(.6),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(11),
                          child: Container(
                            width: 95,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/network.png',
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  '${widget._items[index].noNetwork} Network',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                CommonWidget(widget._items[index])
              ],
            ),
          ),
        );
      },
      itemCount: widget._items.length,
    );
  }
}
