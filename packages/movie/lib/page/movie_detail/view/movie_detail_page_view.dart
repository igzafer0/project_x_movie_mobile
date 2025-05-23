import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:movie/page/movie_detail/view_model/movie_detail_page_viewmodel.dart';
import 'package:movie/section/movie_list_section.dart';
import 'package:movie/widget/credit_widget.dart';
import 'package:movie/widget/genre_widget.dart';
import 'package:movie/widget/movie_tile_widget.dart';
import 'package:movie/widget/movie_tile_with_shadow_widget.dart';
import 'package:intl/intl.dart';
import 'package:rate/rate.dart';

class MovieDetailPageView extends StatefulWidget {
  final int movieID;
  const MovieDetailPageView(this.movieID, {super.key});

  @override
  State<MovieDetailPageView> createState() => _MovieDetailPageViewState();
}

class _MovieDetailPageViewState extends State<MovieDetailPageView> {
  late MovieDetailPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CoreView<MovieDetailPageViewModel>(
      viewModel: MovieDetailPageViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.movieID = widget.movieID;
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => _scaffoldBody(),
    );
  }

  Widget _scaffoldBody() {
    return Scaffold(
      body: Observer(builder: (context) {
        if (viewModel.movie.id != -1) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SizedBox(height: context.ScreenHeight * .55, child: MovieTileWithShadowWidget(viewModel.movie)),
                  Padding(
                    padding: context.XLargeAllSpacer,
                    child: SizedBox(
                      height: 200,
                      child: MovieTileWidget(movie: viewModel.movie, onTap: () {}),
                    ),
                  ),
                ],
              ),
              Gap(context.MidSpacer),
              Padding(
                padding: context.MidHorizontalSpacer,
                child: GlobalLabelTextWidget(text: viewModel.movie.name, size: TextSize.EXTREME_BIG),
              ),
              Gap(context.MidSpacer),
              Padding(
                padding: context.MidHorizontalSpacer,
                child: GlobalLabelTextWidget(text: DateFormat('yyyy').format(viewModel.movie.release), size: TextSize.SMALL_TITLE),
              ),
              Gap(context.MidSpacer),
              Padding(
                padding: context.MidHorizontalSpacer,
                child: GlobalLabelTextWidget(text: viewModel.movie.description, size: TextSize.SUBTITLE),
              ),
              Gap(context.MidSpacer),
              _starPart(),
              Gap(context.MidSpacer),
              _genrePart(),
              Gap(context.MidSpacer),
              _castSection(),
              _similarMoviePart(),
              Gap(context.DoubleLargeSpacer),
              Gap(context.DoubleLargeSpacer),
            ],
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }

  Widget _genrePart() {
    return Padding(
      padding: context.MidHorizontalSpacer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalLabelTextWidget(
            text: "Genres",
            size: TextSize.BIG_TITLE,
          ),
          Gap(context.MidSpacer),
          Wrap(spacing: 8.0, runSpacing: 4.0, children: viewModel.movie.genres.map((e) => GenreWidget(name: e.name)).toList()),
        ],
      ),
    );
  }

  Widget _similarMoviePart() {
    return Observer(builder: (_) {
      if (viewModel.similarMovieList.isNotEmpty) {
        return Padding(
          padding: context.MidHorizontalSpacer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalLabelTextWidget(
                text: "Similar Movies",
                size: TextSize.BIG_TITLE,
              ),
              Gap(context.LargeSpacer),
              SizedBox(
                height: 200,
                child: MovieListSection(viewModel.similarMovieList, (i) => viewModel.navigateDetailPage(i)),
              ),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }

  Widget _castSection() {
    return Observer(builder: (_) {
      if (viewModel.credit.isEmpty) {
        return const SizedBox.shrink();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.MidHorizontalSpacer,
            child: GlobalLabelTextWidget(text: "Cast", size: TextSize.BIG_TITLE),
          ),
          Gap(context.MidSpacer),
          SizedBox(
            height: 295,
            child: ListView.builder(
              shrinkWrap: true,
              padding: context.MidHorizontalSpacer,
              cacheExtent: (200 / 1.5) * viewModel.credit.length,
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.credit.length,
              itemBuilder: (BuildContext context, int index) {
                return CreditWidget(viewModel.credit[index]);
              },
            ),
          ),
        ],
      );
    });
  }

  _starPart() {
    return Padding(
      padding: context.MidHorizontalSpacer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalLabelTextWidget(
            text: "Rate Movie",
            size: TextSize.BIG_TITLE,
          ),
          Gap(context.MidSpacer),
          Center(
            child: Observer(builder: (context) {
              return Rate(
                iconSize: 42,
                color: Colors.amber,
                allowHalf: true,
                allowClear: false,
                initialValue: viewModel.movieRate,
                readOnly: false,
                onChange: (value) => viewModel.movieRate = value,
              );
            }),
          ),
          Gap(context.MidSpacer),
          GlobalLabelTextWidget(
              text: "You can make the movies we recommend to you sharper by giving a rate to the movies you watch.", size: TextSize.SUBTITLE),
          Gap(context.MidSpacer),
          GlobalCommonButtonWidget(onTap: () => viewModel.setRate(), title: "Send")
        ],
      ),
    );
  }
}
