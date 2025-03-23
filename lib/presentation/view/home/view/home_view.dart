// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_x_movie_mobile/config/presentation/core_view.dart';
import 'package:project_x_movie_mobile/presentation/view/home/viewmodel/home_viewmodel.dart';
import 'package:project_x_movie_mobile/presentation/view/home/widget/big_part_widget.dart';
import 'package:project_x_movie_mobile/presentation/view/home/widget/first_movie_widget.dart';
import 'package:project_x_movie_mobile/presentation/view/widget/movie/common_genre_row_widget.dart';
import 'package:project_x_movie_mobile/presentation/view/widget/movie/common_movie_poster_widget.dart';
import 'package:project_x_movie_mobile/presentation/widget/text/global_label_text_widget.dart';
import 'package:project_x_movie_mobile/util/constant/color_constant.dart';
import 'package:project_x_movie_mobile/util/enum/text_size.dart';
import 'package:project_x_movie_mobile/util/extension/ui_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CoreView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => ScaffoldBody(),
    );
  }

  Widget ScaffoldBody() => Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Observer(builder: (_) {
              if (viewModel.randomFirstPart.isNotEmpty) {
                return FirstMovieWidget(movie: viewModel.randomFirstPart.first);
              }
              return SizedBox();
            }),
            Padding(
              padding: context.MidHorizontalSpacer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categorylist(),
                  genreslist(),
                  bigPosterPart(),
                  randomMoviePart(),
                  randomMovieCategoryMoviesPart(),
                  Gap(context.DoubleLargeSpacer),
                ],
              ),
            )
          ],
        ),
      );

  Widget categorylist() {
    return Observer(builder: (_) {
      if (viewModel.movies.isNotEmpty && viewModel.genres.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalLabelTextWidget(
                text: "${viewModel.genres[viewModel.genreIndex].name} Movies",
                size: TextSize.BIG_TITLE),
            Gap(context.MidSpacer),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: context.MidRightSpacer,
                    child: CommonMoviePosterWidget(
                        imagePath: viewModel.movies[index].poster),
                  );
                },
                itemCount: viewModel.movies.length,
              ),
            ),
            Gap(context.MidSpacer),
          ],
        );
      }
      return SizedBox();
    });
  }

  Widget bigPosterPart() {
    return Observer(builder: (_) {
      if (viewModel.bigPartMovies.isNotEmpty && viewModel.genres.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalLabelTextWidget(
                text:
                    "${viewModel.genres[viewModel.genreIndex != 0 ? 0 : 1].name} Movies",
                size: TextSize.BIG_TITLE),
            Gap(context.MidSpacer),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: context.MidRightSpacer,
                    child: CommonMoviePosterWidget(
                        imagePath: viewModel.bigPartMovies[index].poster),
                  );
                },
                itemCount: viewModel.bigPartMovies.length,
              ),
            ),
            Gap(context.MidSpacer),
          ],
        );
      }
      return SizedBox();
    });
  }

  Widget randomMoviePart() {
    return Observer(builder: (_) {
      if (viewModel.randomMovie.isNotEmpty) {
        return BigPartWidget(movie: viewModel.randomMovie.first);
      }
      return SizedBox();
    });
  }

  Widget genreslist() {
    return Observer(builder: (_) {
      if (viewModel.genres.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalLabelTextWidget(text: "Genres", size: TextSize.BIG_TITLE),
            Gap(context.MidSpacer),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: context.MidRightSpacer,
                    child: CommonGenreRowWidget(
                        genreModel: viewModel.genres[index]),
                  );
                },
                itemCount: viewModel.genres.length,
              ),
            ),
            Gap(context.MidSpacer),
          ],
        );
      }
      return SizedBox();
    });
  }

  Widget randomMovieCategoryMoviesPart() {
    return Observer(builder: (_) {
      if (viewModel.randomMovieListByRandomMovie.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.MidSpacer),
            GlobalLabelTextWidget(
              text:
                  "And the other ${viewModel.randomMovie.first.genres.last.name.toLowerCase()} movies...",
              size: TextSize.BIG_PARAGRAPH,
              color: ColorConstant.PRIMARY_TEXT_COLOR,
            ),
            Gap(context.MidSpacer),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: context.MidRightSpacer,
                    child: CommonMoviePosterWidget(
                        imagePath: viewModel
                            .randomMovieListByRandomMovie[index].poster),
                  );
                },
                itemCount: viewModel.randomMovieListByRandomMovie.length,
              ),
            ),
            Gap(context.MidSpacer),
          ],
        );
      }
      return SizedBox();
    });
  }
}
