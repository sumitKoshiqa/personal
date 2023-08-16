import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Image.asset(
              'assets/your-account/arrow.png',
              width: 44,
              height: 44,

            ),
          ),
          Image.asset(
            'assets/images/onboarding/splash_logo.png',
            width: 44,
            height: 44,

          ),

          Visibility(
            visible: false,
            child: Image.asset(
              'assets/your-account/arrow.png',
              width: 44,
              height: 44,

            ),
          ),


        ],
      ),
    );
  }
}
