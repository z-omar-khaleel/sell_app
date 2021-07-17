import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/modules/chat/models/user_info_model.dart';
import 'package:sell_app/modules/home/controller/cubit/home_cubit.dart';
import 'package:sell_app/utils/component/components.dart';

import 'details_chat_screen.dart';

class UserChatScreen extends StatelessWidget {
  List<UserChatInfo> _items = [
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: true),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: true),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
    UserChatInfo(
        img: 'assets/images/userChat.png',
        name: 'Devon Lane',
        subTitle: 'There are Many Variations of Passages',
        time: '11:26',
        isActive: false),
  ];
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: query * .027,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [customText('Message ')],
              ),
              SizedBox(
                height: query * .02,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          onTap: () {
                            Get.to(DetailsChatScreen(_items[index]));
                            SellAppCubitHome.get(context)
                                .changeBottomVisibality(false);
                          },
                          leading: CircleAvatar(
                            child: Image.asset(_items[index].img),
                            radius: 30,
                          ),
                          title: customText(_items[index].name,
                              fontSize: 14, fontWeight: FontWeight.bold),
                          subtitle: customText(
                            _items[index].subTitle ?? '',
                            fontSize: 12,
                            color: Color(0xff423E5B),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: customText(
                              _items[index].time,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          _items[index].isActive
                              ? CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Color(0xff4A93FF),
                                )
                              : Container()
                        ],
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                itemCount: _items.length,
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
