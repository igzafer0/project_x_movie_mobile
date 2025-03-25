import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/widget/movie_tile_widget.dart';

class MovieListSection extends StatelessWidget {
  final List<MovieModel> movies;
  const MovieListSection(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Container(
          margin: context.MidRightSpacer,
          child: MovieTileWidget(
            movie: movies[index],
          ),
        );
      },
    );
  }
}
