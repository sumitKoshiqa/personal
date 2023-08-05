import 'package:ekikrit/App/CustomSpacers.dart';
import 'package:ekikrit/Common/Widgets/BackButtonPrimary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  final String? title;
  const NavBar({this.title, Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [

              const BackButtonPrimary(),

              CustomSpacers.width10,

              Text(widget.title ?? "",
                style: Get.theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600
                ),
              )
            ],
          ),

          CustomSpacers.height8,

          Container(
            height: 1,
            width: Get.width,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );
  }
}
