import 'package:flutter/material.dart';
import 'package:sell_app/modules/home/models/carousel_info.dart';
import 'package:sell_app/modules/home/widgets/common_style.dart';
import 'package:sell_app/utils/component/components.dart';

class VerticalListWidget extends StatelessWidget {
  final List<CaroselInfo> _items;

  VerticalListWidget(this._items);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.17),
                  borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              height: query * .3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 8),
                      child: Container(
                          child: Image.asset(
                            _items[index].img,
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 7,
                              ),
                              Chip(
                                label: Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: customText(
                                    '${_items[index].noNetwork} Network  ',
                                    fontSize: 12,
                                  ),
                                ),
                                labelPadding: EdgeInsets.zero,
                                avatar: Image(
                                  image:
                                      AssetImage('assets/images/network.png'),
                                  width: 30,
                                ),
                                backgroundColor: Colors.grey.withOpacity(.26),
                              ),
                              Spacer(),
                              Chip(
                                label: Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: customText('Family  ',
                                      fontSize: 14, color: Color(0xffF2533F)),
                                ),
                                labelPadding: EdgeInsets.zero,
                                avatar: Icon(
                                  Icons.family_restroom,
                                  size: 22,
                                  color: Color(0xffF2533F),
                                ),
                                backgroundColor: Color(0xffF2533),
                                padding: EdgeInsets.only(left: 4),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          CommonWidget(_items[index])
                        ],
                      ),
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
      itemCount: _items.length,
    );
  }
}
