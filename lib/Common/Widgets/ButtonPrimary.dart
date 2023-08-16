import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {
  final Function() onTap;
  final String buttonText;
  final double? fontSize;
  const ButtonPrimary({required this.onTap, required this.buttonText, this.fontSize,  Key? key}) : super(key: key);

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Constants.accentOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )
        ),
        onPressed: (){
          widget.onTap();
        },
        child: Center(
          child: Text(widget.buttonText,
            style: theme.textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontSize: widget.fontSize ?? 14 ,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
