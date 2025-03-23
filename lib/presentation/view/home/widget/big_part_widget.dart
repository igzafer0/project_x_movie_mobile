import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_x_movie_mobile/data/dto/movie/movie_model.dart';
import 'package:project_x_movie_mobile/presentation/view/widget/movie/common_movie_poster_widget.dart';
import 'package:project_x_movie_mobile/presentation/widget/button/global_common_button_widget.dart';
import 'package:project_x_movie_mobile/presentation/widget/text/global_label_text_widget.dart';
import 'package:project_x_movie_mobile/util/constant/color_constant.dart';
import 'package:project_x_movie_mobile/util/enum/text_size.dart';
import 'package:project_x_movie_mobile/util/extension/text_extension.dart';
import 'package:project_x_movie_mobile/util/extension/ui_extension.dart';

class BigPartWidget extends StatelessWidget {
  final MovieModel movie;
  const BigPartWidget({required this.movie, super.key});

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
              child: CommonMoviePosterWidget(imagePath: movie.poster),
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
