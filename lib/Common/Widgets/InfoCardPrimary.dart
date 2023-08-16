
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCardPrimary extends StatefulWidget {
  final String? title, imagePath;
  final Function? onTap;
  final Color? buttonColor;
  const InfoCardPrimary({this.title, this.imagePath, this.onTap, this.buttonColor, Key? key}) : super(key: key);

  @override
  State<InfoCardPrimary> createState() => _InfoCardPrimaryState();
}

class _InfoCardPrimaryState extends State<InfoCardPrimary> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap!();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: widget.buttonColor ?? Constants.lightOrange,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [

            CustomSpacers.width10,

            Image(
              height: 20,
              width: 20,
              image: AssetImage(widget.imagePath!),
            ),

            CustomSpacers.width10,


            Expanded(
              child: Text(widget.title!,
                style: Get.theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600
                ),
              ),
            ),

            Icon(Icons.arrow_forward_ios_outlined, size: 16,),

            CustomSpacers.width10,

          ],
        ),
      ),
    );
  }
}
