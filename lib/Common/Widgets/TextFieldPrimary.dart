import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldPrimary extends StatefulWidget {
  final String? hint, imagePath;
  final Color? color, disabledColor;
  final bool? isEnabled;
  final Function? onChanged, onTap;
  final int? textLength;
  final TextInputType? txtInputType;
  final TextEditingController? textEditingController;

  const TextFieldPrimary({required this.color, required this.hint,
    required this.imagePath, this.onChanged, required this.textEditingController,
    this.txtInputType, this.disabledColor, this.textLength,
    this.isEnabled, this.onTap, Key? key}) : super(key: key);

  @override
  State<TextFieldPrimary> createState() => _TextFieldPrimaryState();
}

class _TextFieldPrimaryState extends State<TextFieldPrimary> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (widget.onTap != null){
          widget.onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(color: widget.color == Constants.lightGreen ? Constants.accentGreen : Constants.accentOrange),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Theme(
          data: ThemeData(
            disabledColor: widget.disabledColor ?? Colors.black
          ),
          child: TextField(
              controller: widget.textEditingController,
              onChanged: (value){
                if (widget.onChanged != null){
                  widget.onChanged!(value);
                }
              },
              enabled: widget.isEnabled ?? false,
              keyboardType: widget.txtInputType,

              maxLength: widget.textLength,
              style: Get.textTheme.titleMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: widget.isEnabled! ? Colors.black : Colors.grey.shade600
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
                labelText: widget.hint,
                contentPadding: const EdgeInsets.all(4),
                labelStyle: Get.textTheme.titleMedium!.copyWith(
                    color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500
                ),
                hintText: widget.hint,
                hintStyle: Get.textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
                prefixIcon: SizedBox(
                  height: 5,
                  width: 5,
                  child: Padding(
                    padding: widget.imagePath! == "assets/your-account/phone.png" ? const EdgeInsets.all(15) : const EdgeInsets.only(top: 12, bottom: 12, ),
                    child: Image(
                      image: AssetImage(widget.imagePath!),
                    ),
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
