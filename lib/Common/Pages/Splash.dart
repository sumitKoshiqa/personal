import 'package:ekikrit/App/Constants.dart';
import 'package:ekikrit/Common/Routing/CustomNavigator.dart';
import 'package:ekikrit/Common/Routing/Routes.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Constants.lightGreen,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      CustomNavigator.pushTo(Routes.CONSUMER_HOME);
    });
  }
}
