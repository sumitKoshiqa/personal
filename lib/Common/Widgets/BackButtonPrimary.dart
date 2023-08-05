import 'package:ekikrit/App/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonPrimary extends StatefulWidget {
  const BackButtonPrimary({Key? key}) : super(key: key);

  @override
  State<BackButtonPrimary> createState() => _BackButtonPrimaryState();
}

class _BackButtonPrimaryState extends State<BackButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Constants.accentOrange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: IconButton(
          tooltip: "Back",
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
        ),
      ),
    );
  }
}
