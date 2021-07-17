import 'package:flutter/material.dart';
import 'package:sell_app/modules/chat/models/user_info_model.dart';
import 'package:sell_app/modules/home/controller/cubit/home_cubit.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class DetailsChatScreen extends StatelessWidget {
  final UserChatInfo model;
  final TextEditingController _controller = TextEditingController();
  DetailsChatScreen(this.model);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    bool isMe = true;
    return WillPopScope(
      onWillPop: () async {
        SellAppCubitHome.get(context).changeBottomVisibality(true);
        return true;
      },
      child: Scaffold(
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: query * .027,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.only(left: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff3D3956).withOpacity(.06)),
                    child: IconButton(
                      onPressed: () {
                        SellAppCubitHome.get(context)
                            .changeBottomVisibality(true);
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: primaryColorWhite,
                        size: 20,
                      ),
                      color: Colors.grey.withOpacity(1),
                    ),
                  ),
                  Expanded(
                      child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset(model.img),
                    ),
                    title: customText(model.name),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColorWhite,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.phone),
                        color: Colors.black,
                        iconSize: 15,
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (c, index) {
                        if (!isMe) {
                          return buildMyMessage('Hello iam the user');
                        }

                        return buildMessage('Hello iam the guest');
                      },
                      separatorBuilder: (c, i) {
                        return Padding(padding: EdgeInsets.all(10));
                      },
                      itemCount: 4)),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey[300]!)),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        onFieldSubmitted: (v) async {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        controller: _controller,
                        decoration: InputDecoration(
                            hintText: 'Enter Your Message Here ....',
                            border: InputBorder.none),
                      ),
                    )),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(.8),
                          borderRadius: BorderRadius.circular(5)),
                      child: MaterialButton(
                        onPressed: () async {},
                        child: Icon(
                          Icons.send_rounded,
                          size: 15,
                          color: Colors.white.withOpacity(.9),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Align buildMyMessage(String message) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(.4),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ),
  );
}

Align buildMessage(String message) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))),
      child: Text(
        message,
        style: TextStyle(fontSize: 15),
      ),
    ),
  );
}
