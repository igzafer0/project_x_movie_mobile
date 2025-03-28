import 'package:core/presentation/core_view.dart';
import 'package:flutter/material.dart';
import 'package:movie/page/movie_detail/view_model/movie_detail_page_viewmodel.dart';

class MovieDetailPageView extends StatefulWidget {
  const MovieDetailPageView({super.key});

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
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => const SizedBox.shrink(),
    );
  }
}
