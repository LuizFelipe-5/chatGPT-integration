import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    String current = 'Model1';
    return FutureBuilder(
      builder: builder,
      future: future,
    );
  }
}


// DropdownButton(
//       dropdownColor: scaffoldBackgroundColor,
//       iconEnabledColor: Colors.white,
//       items: getModelsItem,
//       value: current,
//       onChanged: (value) {
//         setState(() {
//           current = value.toString();
//         });
//       },
//     );