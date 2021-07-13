import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sell_app/modules/home/models/carousel_info.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class CarsoelWidget extends StatefulWidget {
  @override
  _CarsoelWidgetState createState() => _CarsoelWidgetState();
}

class _CarsoelWidgetState extends State<CarsoelWidget> {
  int index = 0;

  List<CaroselInfo> _items = [
    CaroselInfo(
        isFav: false,
        title: '425 Vine St #301, Seattle, WA',
        price: 269.000,
        area: 1200,
        img: 'assets/images/house_home.png',
        noBathroom: 2,
        noNetwork: 6),
    CaroselInfo(
        isFav: false,
        title: '425 Vine St #301, Seattle, WA',
        price: 269.000,
        area: 1200,
        img: 'assets/images/house_home.png',
        noBathroom: 2,
        noNetwork: 6),
    CaroselInfo(
        isFav: false,
        title: '425 Vine St #301, Seattle, WA',
        price: 269.000,
        area: 1200,
        img: 'assets/images/house_home.png',
        noBathroom: 2,
        noNetwork: 6),
    CaroselInfo(
        isFav: false,
        title: '425 Vine St #301, Seattle, WA',
        price: 269.000,
        area: 1200,
        img: 'assets/images/house_home.png',
        noBathroom: 2,
        noNetwork: 6),
    CaroselInfo(
        isFav: false,
        title: '425 Vine St #301, Seattle, WA',
        price: 269.000,
        area: 1200,
        img: 'assets/images/house_home.png',
        noBathroom: 2,
        noNetwork: 6),
  ];
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
            margin: EdgeInsets.all(10),
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
                          _items[index].img,
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
                          padding: EdgeInsets.all(12),
                          child: Container(
                            width: 95,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/network.png',
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${_items[index].noNetwork} Network',
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
                customText(_items[index].title, fontSize: 14),
                SizedBox(
                  height: 12,
                ),
                customText('\$ ${_items[index].price}',
                    color: primaryColorWhite),
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
                        customText('${_items[index].noBathroom} Bathroom',
                            fontSize: 12)
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Image.asset('assets/images/Bathroom.png'),
                        SizedBox(
                          width: 7,
                        ),
                        customText('${_items[index].noBathroom} Bedroom',
                            fontSize: 12)
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
                    customText('${_items[index].area} Sq. Fit', fontSize: 13)
                  ],
                )
              ],
            ),
          ),
        );
      },
      itemCount: _items.length,
    );
  }
}
