import 'package:chatgpt_integration/constants/constants.dart';
import 'package:chatgpt_integration/widgets/drop_down_widget.dart';
import 'package:chatgpt_integration/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
      backgroundColor: scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Flexible(
              child: TextWidget(
                label: 'Chosen Model',
                fontSize: 16,
              ),
            ),
            Flexible(
              flex: 2,
              child: DropDownWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
