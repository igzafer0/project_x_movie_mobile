import 'package:core/constant/color_constant.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';

class GlobalCommonButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color color;
  final BorderRadius radius;
  const GlobalCommonButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.radius = const BorderRadius.all(Radius.circular(10)),
    this.color = ColorConstant.APP_ORANGE,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buttonHolder(context),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: radius,
              highlightColor: Colors.transparent,
              onTap: () => onTap(),
            ),
          ),
        ),
      ],
    );
  }

  Container _buttonHolder(BuildContext context) {
    return Container(
      padding: context.MidVerticalSpacer,
      alignment: Alignment.center,
      decoration: _buttonHolderDecoration(context),
      child: _titleWidget(context),
    );
  }

  BoxDecoration _buttonHolderDecoration(BuildContext context) => BoxDecoration(
        color: color,
        borderRadius: radius,
      );

  Text _titleWidget(BuildContext context) {
    return Text(title,
        style:
            _titleTextStyle(context).copyWith(color: Colors.white, height: 1));
  }

  TextStyle _titleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }
}
