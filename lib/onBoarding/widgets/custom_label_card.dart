import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLabelCard extends StatelessWidget {
  final String? iconPath;
  final String? labelText;
  const CustomLabelCard({super.key,this.iconPath,this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      margin: EdgeInsets.only(left: 30,right: 30),
      height: 53,
      width: Get.width,
      decoration: ShapeDecoration(
        color: Color(0xFFFFF7EB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Image.asset(iconPath!,
          height: 24,
          width: 24,),
          Text(
            labelText!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF424141),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),
    );
  }
}
