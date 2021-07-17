import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_app/modules/home/controller/states/home_states.dart';
import 'package:sell_app/modules/home/models/carousel_info.dart';
import 'package:sell_app/modules/home/screens/filter_screen.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class SellAppCubitHome extends Cubit<SellAppHomeStates> {
  var searchKey2 = GlobalKey<FormState>();

  bool isSearchMap = true;
  changeSearchMap(bool value) {
    isSearchMap = value;
    emit(SellAppChangeSearchMapState());
  }

  SellAppCubitHome(SellAppHomeStates initialState) : super(initialState);
  static SellAppCubitHome get(context) =>
      BlocProvider.of<SellAppCubitHome>(context);
  List<CaroselInfo> items = [
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
  bool isSearched = false;
  changeSearchValue(bool value) {
    isSearched = value;
    print(isSearched);
    emit(SellAppChangeSearchState());
  }

  var searchHomeController = TextEditingController();

  TextEditingController? locationFilterController = TextEditingController();
  TextEditingController? sizeFilterController = TextEditingController();
  TextEditingController? roomFilterController = TextEditingController();
  bool isBottomShow = true;
  changeBottomVisibality(bool val) {
    isBottomShow = val;
    emit(SellAppChangeBottomVisiabiltyState());
  }

  //filter enviroment
  bool isBalkongOrTerrasse = true,
      isKidFriendly = false,
      isGarden = false,
      isGarageOrParkinglot = false,
      isPetAllowed = false,
      isSewer = false;
  //filter other
  bool isParquet = true, isFireplace = false, isCalm = false;
  Color anyChip = primaryColorWhite;
  Color familyChip = Colors.white;
  Color bachelorChip = Colors.white;
  Color buyChip = Colors.white;
  changeChipColor(String type, Color head3, Color primeColor) {
    //wh can use enum with constant value instead of String type
    if (type == 'any') {
      anyChip = primeColor;
      buyChip = head3;
      bachelorChip = head3;
      familyChip = head3;
    }
    if (type == 'family') {
      anyChip = head3;
      buyChip = head3;
      bachelorChip = head3;
      familyChip = primeColor;
    }
    if (type == 'bach') {
      anyChip = head3;
      buyChip = head3;
      bachelorChip = primeColor;
      familyChip = head3;
    }
    if (type == 'buy') {
      anyChip = head3;
      buyChip = primeColor;
      bachelorChip = head3;
      familyChip = head3;
    }
    emit(SellAppChangeChipColorState());
  }

  resetFilter() {
    isParquet = false;
    isFireplace = false;
    isCalm = false;
    isBalkongOrTerrasse = false;
    isKidFriendly = false;
    isGarden = false;
    isGarageOrParkinglot = false;
    isPetAllowed = false;
    isSewer = false;
    locationFilterController?.clear();
    sizeFilterController?.clear();

    roomFilterController?.clear();
    anyChip = primaryColorWhite;
    familyChip = Colors.white;
    bachelorChip = Colors.white;
    buyChip = Colors.white;
    emit(SellAppResetFilterState());
  }

  changeEnviromentFilter(EnvironmentFilter filter, bool val) {
    if (filter == EnvironmentFilter.BalkongOrTerrasse)
      isBalkongOrTerrasse = val;
    if (filter == EnvironmentFilter.GarageOrParkinglot)
      isGarageOrParkinglot = val;
    if (filter == EnvironmentFilter.Garden) isGarden = val;
    if (filter == EnvironmentFilter.KidFriendly) isKidFriendly = val;
    if (filter == EnvironmentFilter.Sewer) isSewer = val;
    if (filter == EnvironmentFilter.PetAllowed) isPetAllowed = val;
    emit(SellAppChangeEnviromentFilterState());
  }

  changeOtherFilter(OtherFilter filter, bool val) {
    if (filter == OtherFilter.Calm) isCalm = val;
    if (filter == OtherFilter.Fireplace) isFireplace = val;
    if (filter == OtherFilter.Parquet) isParquet = val;
    emit(SellAppChangeOtherFilterState());
  }
}
