import 'package:flutter/material.dart';

class UserChatInfo {
  String img;
  String name;
  String? subTitle;
  bool isActive = false;
  String time;

  UserChatInfo(
      {required this.img,
      required this.name,
      this.subTitle,
      required this.isActive,
      required this.time});
}
