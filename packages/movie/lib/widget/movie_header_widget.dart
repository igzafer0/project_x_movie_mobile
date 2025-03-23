import 'package:core/constant/color_constant.dart';
import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie/data/model/movie/movie_model.dart';

class MovieHeaderWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieHeaderWidget({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.ScreenWidth,
      height: context.ScreenHeight * .55,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: context.ScreenWidth,
            child: GlobalNetworkImageWidget(imagePath: movie.poster),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  ColorConstant.PRIMARY_COLOR.withValues(alpha: .5),
                  ColorConstant.PRIMARY_COLOR,
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: context.MidHorizontalSpacer,
                  child: GlobalLabelTextWidget(
                    text: movie.name,
                    align: TextAlign.center,
                    size: TextSize.EXTREME_BIG,
                  ),
                ),
                Gap(context.MidSpacer),
                SizedBox(
                    width: context.ScreenWidth * .9,
                    child: GlobalCommonButtonWidget(
                        onTap: () {}, title: "See details"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
