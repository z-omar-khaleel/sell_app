import 'package:flutter/material.dart';
import 'package:sell_app/modules/home/controller/cubit/home_cubit.dart';
import 'package:sell_app/modules/home/models/nearest_model.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    final width = (MediaQuery.of(context).size.width) - 32;
    final ref = SellAppCubitHome.get(context);

    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Image.asset('assets/images/location.png'),
              SizedBox(
                width: 12,
              ),
              customText('Or Use My Current location',
                  color: Color(0xffF2533F), fontSize: 14)
            ],
          ),
        ),
        SizedBox(
          height: query * .01,
        ),
        Divider(),
        SizedBox(
          height: query * .013,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            clickChip(
                onTap: () {},
                chipColor: Color(0xffF6F6F8),
                label: customText('London',
                    color: Color(0xff878596), fontSize: 14),
                padding: EdgeInsets.all(6),
                chipShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            clickChip(
                onTap: () {},
                chipColor: Color(0xffF6F6F8),
                label: customText('Durham',
                    color: Color(0xff878596), fontSize: 14),
                padding: EdgeInsets.all(6),
                chipShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            clickChip(
                onTap: () {},
                chipColor: Color(0xffF6F6F8),
                label: customText('Oxford',
                    color: Color(0xff878596), fontSize: 14),
                padding: EdgeInsets.all(6),
                chipShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            clickChip(
                onTap: () {},
                chipColor: Color(0xffF6F6F8),
                label: customText('Plymouth',
                    color: Color(0xff878596), fontSize: 14),
                padding: EdgeInsets.all(6),
                chipShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ],
        ),
        SizedBox(
          height: query * .019,
        ),
        ref.isSearchMap
            ? Container()
            : Container(
                height: query * .3,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/map.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
        ref.isSearchMap
            ? Container()
            : SizedBox(
                height: query * .019,
              ),
        customText('Nearest Properties'),
        SizedBox(
          height: query * .016,
        ),
        _NearestWidget(),
        SizedBox(
          height: 40,
        ),
        ref.isSearchMap
            ? Container(
                height: 40,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ElevatedButton(
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff423E5B))),
                    onPressed: () {
                      ref.changeSearchMap(false);
                    },
                    child: customText('Apply',
                        textAlign: TextAlign.center,
                        alignment: Alignment.center,
                        color: primaryColorWhite)),
              )
            : Container(),
      ],
    );
  }
}

class _NearestWidget extends StatelessWidget {
  List<NearestModel> _items = [
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
    NearestModel(
      img: 'assets/images/nearsert.png',
      houseFor: 'House for Sale',
      price: 469.000,
      desc: '3130 Range Rd, Huron MI',
      type: 'Family',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    final width = (MediaQuery.of(context).size.width) - 32;
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
            height: query * .22,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.08),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Container(
                    child: Image.asset(
                      _items[index].img,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                    width: width * (2 / 5),
                    height: query * .22,
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50))),
                Container(
                  width: width * (3 / 5),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          customText(
                              '\$ ${_items[index].price.toStringAsFixed(3)}',
                              color: primaryColorWhite),
                          Chip(
                            backgroundColor: Color(0xff2533F).withOpacity(.1),
                            labelPadding: EdgeInsets.zero,
                            label: Padding(
                              padding: const EdgeInsets.only(top: 5.0, left: 0),
                              child: customText('Family',
                                  color: Color(0xffF2533F), fontSize: 12),
                            ),
                            avatar: Icon(
                              Icons.family_restroom_outlined,
                              size: 18,
                              color: Color(0xffF2533F),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      customText('3130 Range Rd, Huron MI', fontSize: 14),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 5,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          customText(_items[index].houseFor, fontSize: 10)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
      itemCount: _items.length,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: query * .03,
      ),
    );
  }
}
