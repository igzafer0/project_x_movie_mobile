import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:dashboard/page/main/section/genre_list_section.dart';
import 'package:dashboard/page/main/section/movie_list_section.dart';
import 'package:dashboard/page/main/viewmodel/main_dashboard_viewmodel.dart';
import 'package:dashboard/page/main/widget/backgrounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:movie/widget/movie_category_priority_widget.dart';
import 'package:movie/widget/movie_header_widget.dart';

class MainDashboardView extends StatefulWidget {
  const MainDashboardView({super.key});

  @override
  State<MainDashboardView> createState() => _MainDashboardViewState();
}

class _MainDashboardViewState extends State<MainDashboardView> {
  late MainDashboardViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CoreView<MainDashboardViewModel>(
      viewModel: MainDashboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => _scaffoldSection(),
    );
  }

  Widget _scaffoldSection() {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _firstMoviePart(),
          _genrePart(),
          Gap(context.LargeSpacer),
          BackgroundedTextField(),
          Gap(context.LargeSpacer),
          _randomMovieWithCategoryTitlePart(),
          Gap(context.LargeSpacer),
          _randomMovieCategoryPriorityPart(),
          Gap(context.DoubleLargeSpacer),
        ],
      ),
    );
  }

  Widget _randomMovieWithCategoryTitlePart() {
    return Observer(builder: (_) {
      if (viewModel.randomMovieWithCategoryPartList.isNotEmpty) {
        return Padding(
          padding: context.MidHorizontalSpacer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalLabelTextWidget(
                text: "${viewModel.randomMovieWithCategoryPartList.first.genres.last.name} Movies",
                size: TextSize.BIG_TITLE,
              ),
              Gap(context.LargeSpacer),
              SizedBox(
                height: 200,
                child: MovieListSection(viewModel.randomMovieWithCategoryPartList, (i) => viewModel.navigateDetailPage(i)),
              ),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }

  _firstMoviePart() {
    return Observer(builder: (_) {
      if (viewModel.firstMoviePart.id != -1) {
        return MovieHeaderWidget(
          movie: viewModel.firstMoviePart,
          onTap: () => viewModel.navigateDetailPage(viewModel.firstMoviePart.id),
        );
      }
      return const SizedBox.shrink();
    });
  }

  _genrePart() {
    return Observer(builder: (_) {
      if (viewModel.genreList.isNotEmpty) {
        return Padding(
          padding: context.MidHorizontalSpacer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalLabelTextWidget(
                text: "Genres",
                size: TextSize.BIG_TITLE,
              ),
              Gap(context.LargeSpacer),
              SizedBox(height: 100, child: GenreListSection(viewModel.genreList)),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }

  _randomMovieCategoryPriorityPart() {
    return Observer(builder: (_) {
      if (viewModel.categoryPriorityMoviePart.id != -1) {
        return Padding(
          padding: context.MidHorizontalSpacer,
          child: MovieCategoryPriorityWidget(
            movie: viewModel.categoryPriorityMoviePart,
            onTap: () => viewModel.navigateDetailPage(viewModel.categoryPriorityMoviePart.id),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
