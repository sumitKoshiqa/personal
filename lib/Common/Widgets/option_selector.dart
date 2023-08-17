import 'package:flutter/material.dart';

class OptionSelector extends StatelessWidget {
  final String selectedOption;
  final List<String> options;
  final Function(String) setNewValue;
  final int? bgColor;

  const OptionSelector({
    super.key,
    required this.selectedOption,
    required this.options,
    this.bgColor,
    required this.setNewValue,
  });

  @override
  Widget build(BuildContext context) {
    print('options>>> ${options.length}');
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: ShapeDecoration(
        color: Color(bgColor!),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(bgColor!)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            // prefixIcon: Image.asset('assets/your-account/gender.png',
            //     height: 8,
            //   width: 8,
            // ),
            // enabledBorder:  OutlineInputBorder(
            //   borderSide: BorderSide(
            //
            //       color: Color(bgColor!), width: 1),
            // ),
            enabledBorder: UnderlineInputBorder(

                borderSide: BorderSide(

                    color: Color(bgColor!)))
        ),
        hint: Text('Gender'),
        value: selectedOption,
        items: options.map((val) {
          return DropdownMenuItem(
            value: val,
            child: Text(
              val,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
        onChanged: <String>(newValue) {
          setNewValue(newValue);
        },
      ),
    );
  }
}
