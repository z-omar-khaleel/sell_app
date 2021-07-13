import 'package:flutter/material.dart';
import 'package:sell_app/modules/home/widgets/carsoel_widget.dart';
import 'package:sell_app/utils/component/components.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

class HomeScreen extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: InkWell(
            highlightColor: Colors.transparent,
            onTap: () {},
            child: Image.asset(
              'assets/images/more.png',
              width: 40,
              height: 40,
            )),
        leadingWidth: 55,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.154),
                borderRadius: BorderRadius.circular(124)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_rounded,
                  color: primaryColorWhite,
                )),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: query * .09,
                    ),
                    Expanded(
                        child: Container(
                      height: 45,
                      child: defaultFormField(
                          controller: _controller,
                          type: TextInputType.text,
                          label: 'Search',
                          fillColor: Colors.grey.withOpacity(.05),
                          labelColor: Colors.grey,
                          suffix: Icon(
                            Icons.search,
                            color: Colors.grey.withOpacity(.5),
                          ),
                          suffixPressed: () {}),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Image.asset('assets/images/Filter.png')),
                  ],
                ),
                SizedBox(
                  height: query * .02,
                ),
                Container(
                  height: query * .4,
                  child: CarsoelWidget(),
                ),
                SizedBox(
                  height: query * .03,
                ),
                customText('Featured Property', fontWeight: FontWeight.bold),
                SizedBox(
                  height: query * .03,
                ),
                Container(
                  height: query * .1,
                  decoration: BoxDecoration(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
