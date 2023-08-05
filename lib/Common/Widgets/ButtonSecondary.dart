import 'package:ekikrit/App/Constants.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends StatefulWidget {
  final Function() onTap;
  final String buttonText;
  final double? fontSize;
  const ButtonSecondary({required this.onTap, required this.buttonText, this.fontSize,  Key? key}) : super(key: key);

  @override
  State<ButtonSecondary> createState() => _ButtonSecondaryState();
}

class _ButtonSecondaryState extends State<ButtonSecondary> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Constants.accentGreen,
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
