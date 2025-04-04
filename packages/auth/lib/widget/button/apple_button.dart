import 'package:core/constant/color_constant.dart';
import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:flutter/material.dart';

class AppleButton extends StatelessWidget {
  const AppleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorConstant.SECONDARY_COLOR, borderRadius: context.MidRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: context.SmallAllSpacer, child: GlobalNetworkImageWidget(imagePath: "https://img.icons8.com/m_sharp/512/FFFFFF/mac-os.png")),
          GlobalLabelTextWidget(text: "with Apple", size: TextSize.PARAGRAPH)
        ],
      ),
    );
  }
}
