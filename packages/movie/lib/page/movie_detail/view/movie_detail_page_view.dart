import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/core_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:movie/page/movie_detail/view_model/movie_detail_page_viewmodel.dart';
import 'package:movie/widget/credit_widget.dart';
import 'package:movie/widget/movie_tile_widget.dart';
import 'package:movie/widget/movie_tile_with_shadow_widget.dart';

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
                child: GlobalLabelTextWidget(text: viewModel.movie.release, size: TextSize.SMALL_TITLE),
              ),
              Gap(context.MidSpacer),
              Padding(
                padding: context.MidHorizontalSpacer,
                child: GlobalLabelTextWidget(text: viewModel.movie.description, size: TextSize.SUBTITLE),
              ),
              Gap(context.MidSpacer),
              Padding(
                padding: context.MidHorizontalSpacer,
                child: GlobalLabelTextWidget(text: "Cast", size: TextSize.BIG_TITLE),
              ),
              Gap(context.MidSpacer),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: context.MidHorizontalSpacer,
                  cacheExtent: (200 / 1.5) * viewModel.credit.length,
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.credit.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CreditWidget(viewModel.credit[index]);
                  },
                ),
              ),
              Gap(context.DoubleLargeSpacer),
              Gap(context.DoubleLargeSpacer),
            ],
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
