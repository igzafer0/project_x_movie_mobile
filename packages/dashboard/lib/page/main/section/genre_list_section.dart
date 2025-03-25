import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:genre/data/model/genre/genre_model.dart';
import 'package:genre/widget/genre_tile_widget.dart';

class GenreListSection extends StatelessWidget {
  final List<GenreModel> genres;
  const GenreListSection(this.genres, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return Container(margin: context.MidRightSpacer, child: GenreTileWidget(genreModel: genres[index]));
        });
  }
}
