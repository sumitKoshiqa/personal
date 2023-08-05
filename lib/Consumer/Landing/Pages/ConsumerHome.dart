import 'package:ekikrit/Consumer/Landing/Widgets/DrawerLayoutConsumer.dart';
import 'package:ekikrit/app_entry_point/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsumerHome extends StatefulWidget {
  const ConsumerHome({Key? key}) : super(key: key);

  @override
  State<ConsumerHome> createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const DrawerLayoutConsumer(),
          body: Container(
            color: Constants.lightOrange,
            child: Column(
              children: [

                Container(
                  height: 50,
                  width: Get.width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        icon: Icon(Icons.menu),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
