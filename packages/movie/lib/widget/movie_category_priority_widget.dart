import 'package:core/constant/color_constant.dart';
import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/widget/movie_tile_widget.dart';

class MovieCategoryPriorityWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieCategoryPriorityWidget({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalLabelTextWidget(
            text: movie.genres.last.id.movieGenreText(),
            size: TextSize.BIG_TITLE),
        Gap(context.MidSpacer),
        Row(
          children: [
            SizedBox(
              height: 150,
              child: MovieTileWidget(imagePath: movie.poster),
            ),
            Gap(context.MidSpacer),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalLabelTextWidget(text: movie.name, size: TextSize.TITLE),
                  Gap(context.SmallSpacer),
                  GlobalLabelTextWidget(
                      text: movie.release, size: TextSize.SUBTITLE),
                ],
              ),
            ),
          ],
        ),
        Gap(context.MidSpacer),
        GlobalLabelTextWidget(
          text: movie.description,
          size: TextSize.BIG_SUBTITLE,
          color: ColorConstant.SECONDARY_TEXT_COLOR,
        ),
        Gap(context.MidSpacer),
        SizedBox(
            width: context.ScreenWidth * .9,
            child: GlobalCommonButtonWidget(onTap: () {}, title: "See details"))
      ],
    );
  }
}
