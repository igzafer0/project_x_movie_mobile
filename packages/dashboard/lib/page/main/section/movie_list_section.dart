import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/widget/movie_tile_widget.dart';

class MovieListSection extends StatelessWidget {
  final List<MovieModel> movies;
  final Function(int) onTap;
  const MovieListSection(this.movies, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Container(
          margin: context.MidRightSpacer,
          child: MovieTileWidget(
            onTap: () => onTap(movies[index].id),
            movie: movies[index],
          ),
        );
      },
    );
  }
}
