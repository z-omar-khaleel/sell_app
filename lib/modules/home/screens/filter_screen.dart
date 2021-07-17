import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sell_app/modules/home/controller/cubit/home_cubit.dart';
import 'package:sell_app/modules/home/controller/states/home_states.dart';
import 'package:sell_app/modules/home/screens/main_screen.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

enum EnvironmentFilter {
  BalkongOrTerrasse,
  KidFriendly,
  Garden,
  GarageOrParkinglot,
  PetAllowed,
  Sewer
}
enum OtherFilter { Parquet, Fireplace, Calm }

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    final head3 = Theme.of(context).textTheme.headline3!.color!;

    var primeColor = Theme.of(context).primaryColor;
    return WillPopScope(
      key: UniqueKey(),
      onWillPop: () async {
        print('zeco');
        pushUntil(context, HomeScreen());
        SellAppCubitHome.get(context).changeBottomVisibality(true);

        return await Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Color(0xff3E3955),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Color(0xff3E3955),
              systemNavigationBarColor: Color(0xff3E3955)),
          child: BlocConsumer<SellAppCubitHome, SellAppHomeStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final ref = SellAppCubitHome.get(context);
              print(ref.sizeFilterController?.text ?? '');
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: query * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                pushUntil(context, HomeScreen());
                                SellAppCubitHome.get(context)
                                    .changeBottomVisibality(true);
                              },
                              child: Chip(
                                backgroundColor:
                                    Color(0xff3e3955).withOpacity(.8),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                label: Icon(
                                  Icons.cancel,
                                  color: primaryColorWhite,
                                  size: 20,
                                ),
                              ),
                            ),
                            customText('Filter',
                                color: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color!,
                                fontSize: 19),
                            Chip(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                label: InkWell(
                                  onTap: () {
                                    ref.resetFilter();
                                  },
                                  child: customText('Reset', color: primeColor),
                                ),
                                backgroundColor:
                                    Color(0xff3e3955).withOpacity(.8)),
                          ],
                        ),
                        SizedBox(
                          height: query * .035,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person_add_alt,
                              color: head3,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            customText('Property Type', color: head3),
                          ],
                        ),
                        SizedBox(
                          height: query * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            clickChip(
                                label: customText('Any'),
                                onTap: () {
                                  ref.changeChipColor('any', head3, primeColor);
                                },
                                chipColor: ref.anyChip),
                            clickChip(
                                label: customText('Family'),
                                onTap: () {
                                  ref.changeChipColor(
                                      'family', head3, primeColor);
                                },
                                chipColor: ref.familyChip),
                            clickChip(
                                label: customText('Bachelor'),
                                onTap: () {
                                  ref.changeChipColor(
                                      'bach', head3, primeColor);
                                },
                                chipColor: ref.bachelorChip),
                            clickChip(
                                label: customText('Buy'),
                                onTap: () {
                                  ref.changeChipColor('buy', head3, primeColor);
                                },
                                chipColor: ref.buyChip),
                          ],
                        ),
                        SizedBox(
                          height: query * .04,
                        ),
                        defaultFormField(
                            borderRadius: 12,
                            focusBorderRadius: 20,
                            label: 'Location',
                            labelColor: Colors.white,
                            borderColor: Colors.white.withOpacity(.6),
                            focusColor: Colors.white,
                            controller: ref.locationFilterController,
                            type: TextInputType.text,
                            prefix:
                                Icon(Icons.location_on, color: Colors.white),
                            suffix: Icon(Icons.my_location_rounded,
                                color: Colors.white),
                            onTap: () {
                              print('zeco');
                            }),
                        SizedBox(
                          height: query * .04,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.format_size_rounded,
                              color: head3,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            customText('Size (Sq. Fit)', color: head3)
                          ],
                        ),
                        SizedBox(
                          height: query * .02,
                        ),
                        defaultFormField(
                            borderRadius: 12,
                            focusBorderRadius: 20,
                            label: 'Enter the size',
                            labelColor: Colors.white,
                            borderColor: Colors.white.withOpacity(.6),
                            focusColor: Colors.white,
                            controller: ref.sizeFilterController,
                            type: TextInputType.text,
                            prefix:
                                Icon(Icons.format_size, color: Colors.white),
                            onTap: () {
                              print('zeco');
                            }),
                        SizedBox(
                          height: query * .04,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.room_service,
                              color: head3,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            customText('Rooms', color: head3)
                          ],
                        ),
                        SizedBox(
                          height: query * .02,
                        ),
                        defaultFormField(
                            borderRadius: 12,
                            focusBorderRadius: 20,
                            label: 'Enter number of rooms',
                            labelColor: Colors.white,
                            borderColor: Colors.white.withOpacity(.6),
                            focusColor: Colors.white,
                            controller: ref.roomFilterController,
                            type: TextInputType.text,
                            prefix:
                                Icon(Icons.room_service, color: Colors.white),
                            onTap: () {
                              print('zeco');
                            }),
                        SizedBox(
                          height: query * .04,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.view_array_outlined,
                              color: head3,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            customText('Environment', color: head3)
                          ],
                        ),
                        SizedBox(
                          height: query * .04,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref.changeEnviromentFilter(
                                      EnvironmentFilter.KidFriendly,
                                      !ref.isKidFriendly);
                                },
                                child: Chip(
                                    side: BorderSide(color: Colors.white),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    backgroundColor: textHeadline4White,
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText('Kid Friendly',
                                            color: head3, fontSize: 13),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Container(
                                          width: 23,
                                          height: 23,
                                          child: GFCheckbox(
                                            activeBgColor: primeColor,
                                            size: GFSize.SMALL,
                                            type: GFCheckboxType.square,
                                            onChanged: (value) {
                                              ref.changeEnviromentFilter(
                                                  EnvironmentFilter.KidFriendly,
                                                  value);
                                            },
                                            value: ref.isKidFriendly,
                                            inactiveIcon: null,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref.changeEnviromentFilter(
                                      EnvironmentFilter.BalkongOrTerrasse,
                                      !ref.isBalkongOrTerrasse);
                                },
                                child: Chip(
                                    side: BorderSide(color: Colors.white),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    backgroundColor: textHeadline4White,
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText(
                                          'Balkong/Terrasse',
                                          color: head3,
                                          fontSize: 13,
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Container(
                                          width: 23,
                                          height: 23,
                                          child: GFCheckbox(
                                            activeBgColor: primeColor,
                                            size: GFSize.SMALL,
                                            type: GFCheckboxType.square,
                                            onChanged: (value) {
                                              ref.changeEnviromentFilter(
                                                  EnvironmentFilter
                                                      .BalkongOrTerrasse,
                                                  value);
                                            },
                                            value: ref.isBalkongOrTerrasse,
                                            inactiveIcon: null,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: query * .018,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref.changeEnviromentFilter(
                                      EnvironmentFilter.Garden, !ref.isGarden);
                                },
                                child: Chip(
                                    side: BorderSide(color: Colors.white),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    backgroundColor: textHeadline4White,
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText('Garden',
                                            color: head3, fontSize: 13),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Container(
                                          width: 23,
                                          height: 23,
                                          child: GFCheckbox(
                                            activeBgColor: primeColor,
                                            size: GFSize.SMALL,
                                            type: GFCheckboxType.square,
                                            onChanged: (value) {
                                              ref.changeEnviromentFilter(
                                                  EnvironmentFilter.Garden,
                                                  value);
                                            },
                                            value: ref.isGarden,
                                            inactiveIcon: null,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref.changeEnviromentFilter(
                                      EnvironmentFilter.GarageOrParkinglot,
                                      !ref.isGarageOrParkinglot);
                                },
                                child: Chip(
                                    side: BorderSide(color: Colors.white),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    backgroundColor: textHeadline4White,
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText(
                                          'Garage/Parking lot',
                                          color: head3,
                                          fontSize: 12,
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Container(
                                          width: 23,
                                          height: 23,
                                          child: GFCheckbox(
                                            activeBgColor: primeColor,
                                            size: GFSize.SMALL,
                                            type: GFCheckboxType.square,
                                            onChanged: (value) {
                                              ref.changeEnviromentFilter(
                                                  EnvironmentFilter
                                                      .GarageOrParkinglot,
                                                  value);
                                            },
                                            value: ref.isGarageOrParkinglot,
                                            inactiveIcon: null,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: query * .018,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref.changeEnviromentFilter(
                                      EnvironmentFilter.PetAllowed,
                                      !ref.isPetAllowed);
                                },
                                child: Chip(
                                    side: BorderSide(color: Colors.white),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    backgroundColor: textHeadline4White,
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText('Pet Allowed',
                                            color: head3, fontSize: 13),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Container(
                                          width: 23,
                                          height: 23,
                                          child: GFCheckbox(
                                            activeBgColor: primeColor,
                                            size: GFSize.SMALL,
                                            type: GFCheckboxType.square,
                                            onChanged: (value) {
                                              print('PetAllowed');
                                              ref.changeEnviromentFilter(
                                                  EnvironmentFilter.PetAllowed,
                                                  value);
                                            },
                                            value: ref.isPetAllowed,
                                            inactiveIcon: null,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref.changeEnviromentFilter(
                                      EnvironmentFilter.Sewer, !ref.isSewer);
                                },
                                child: Chip(
                                    side: BorderSide(color: Colors.white),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    backgroundColor: textHeadline4White,
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText(
                                          'Sewer',
                                          color: head3,
                                          fontSize: 13,
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Container(
                                          width: 23,
                                          height: 23,
                                          child: GFCheckbox(
                                            activeBgColor: primeColor,
                                            size: GFSize.SMALL,
                                            type: GFCheckboxType.square,
                                            onChanged: (value) {
                                              ref.changeEnviromentFilter(
                                                  EnvironmentFilter.Sewer,
                                                  value);
                                              print('filter');
                                            },
                                            value: ref.isSewer,
                                            inactiveIcon: null,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: query * .04,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.other_houses,
                              color: head3,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            customText('Others', color: head3)
                          ],
                        ),
                        SizedBox(
                          height: query * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                ref.changeOtherFilter(
                                    OtherFilter.Parquet, !ref.isParquet);
                              },
                              child: Chip(
                                  side: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  backgroundColor: textHeadline4White,
                                  label: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      customText(
                                        'Parquet',
                                        color: head3,
                                        fontSize: 13,
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Container(
                                        width: 23,
                                        height: 23,
                                        child: GFCheckbox(
                                          activeBgColor: primeColor,
                                          size: GFSize.SMALL,
                                          type: GFCheckboxType.square,
                                          onChanged: (value) {},
                                          value: ref.isParquet,
                                          inactiveIcon: null,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                ref.changeOtherFilter(
                                    OtherFilter.Fireplace, !ref.isFireplace);
                              },
                              child: Chip(
                                  side: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  backgroundColor: textHeadline4White,
                                  label: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      customText(
                                        'Fireplace',
                                        color: head3,
                                        fontSize: 13,
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Container(
                                        width: 23,
                                        height: 23,
                                        child: GFCheckbox(
                                          activeBgColor: primeColor,
                                          size: GFSize.SMALL,
                                          type: GFCheckboxType.square,
                                          onChanged: (value) {},
                                          value: ref.isFireplace,
                                          inactiveIcon: null,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                ref.changeOtherFilter(
                                    OtherFilter.Calm, !ref.isCalm);
                              },
                              child: Chip(
                                  side: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  backgroundColor: textHeadline4White,
                                  label: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      customText(
                                        'Calm',
                                        color: head3,
                                        fontSize: 13,
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Container(
                                        width: 23,
                                        height: 23,
                                        child: GFCheckbox(
                                          activeBgColor: primeColor,
                                          size: GFSize.SMALL,
                                          type: GFCheckboxType.square,
                                          onChanged: (value) {},
                                          value: ref.isCalm,
                                          inactiveIcon: null,
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: query * .04,
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: ElevatedButton(
                              style: ButtonStyle(alignment: Alignment.center),
                              onPressed: () {},
                              child: customText('Apply',
                                  textAlign: TextAlign.center,
                                  alignment: Alignment.center,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
