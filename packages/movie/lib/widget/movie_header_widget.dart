import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/widget/movie_tile_with_shadow_widget.dart';

class MovieHeaderWidget extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onTap;
  const MovieHeaderWidget({required this.movie, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.ScreenWidth,
      height: context.ScreenHeight * .55,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MovieTileWithShadowWidget(movie),
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
                SizedBox(width: context.ScreenWidth * .9, child: GlobalCommonButtonWidget(onTap: () => onTap(), title: "See details"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
