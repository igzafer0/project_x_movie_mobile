import 'package:core/constant/color_constant.dart';
import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';

class BackgroundedTextField extends StatelessWidget {
  const BackgroundedTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: context.MidRadius,
        color: ColorConstant.SECONDARY_COLOR,
      ),
      padding: context.MidHorizontalSpacer,
      margin: context.MidHorizontalSpacer,
      width: context.ScreenWidth,
      child: Row(
        children: [
          Expanded(child: GlobalLabelTextWidget(text: "Search something...", size: TextSize.SMALL_TITLE)),
          SizedBox(height: 50, width: 50, child: Icon(Icons.search)),
        ],
      ),
    );
  }
}
