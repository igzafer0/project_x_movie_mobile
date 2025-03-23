// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:project_x_movie_mobile/config/presentation/core_viewmodel.dart';
import 'package:project_x_movie_mobile/data/dto/genre/genre_model.dart';
import 'package:project_x_movie_mobile/data/dto/movie/movie_model.dart';
import 'package:project_x_movie_mobile/domain/usecase/genre/genre_usecase.dart';
import 'package:project_x_movie_mobile/domain/usecase/movie/movie_usecase.dart';
import 'package:project_x_movie_mobile/injection_container.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, CoreViewModel {
  late MovieUseCase _movieUseCase;
  late GenreUseCase _genreUseCase;
  @override
  void init() {
    _movieUseCase = locator<MovieUseCase>();
    _genreUseCase = locator<GenreUseCase>();
    genre();
    _randomFirstPart();
    _randomMovie();
  }

  @observable
  List<MovieModel> movies = [];

  @observable
  List<MovieModel> bigPartMovies = [];

  @observable
  List<MovieModel> randomFirstPart = [];
  @observable
  List<MovieModel> randomMovie = [];

  @observable
  List<MovieModel> randomMovieListByRandomMovie = [];
  @observable
  List<GenreModel> genres = [];

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  Future<List<MovieModel>?> movie({List<int>? genres}) async {
    var result = await _movieUseCase.movies(genres: genres);
    if (result.status) {
      return result.data!;
    }
    return null;
  }

  int genreIndex = -1;
  Future<void> genre() async {
    var result = await _genreUseCase.genres();
    if (result.status) {
      var r = Random();
      genreIndex = r.nextInt((result.data as List<GenreModel>).length);
      genres = result.data!;
      movies = await movie(genres: [genres[genreIndex].id]) ?? [];
      bigPartMovies =
          await movie(genres: [genres[genreIndex != 0 ? 0 : 1].id]) ?? [];
    }
  }

  Future<void> _randomFirstPart() async {
    var result = await _movieUseCase.random();
    if (result.status) {
      randomFirstPart = result.data!;
    }
  }

  Future<void> _randomMovie() async {
    var result = await _movieUseCase.random();
    if (result.status) {
      randomMovie = result.data!;
      _randomMovieListByRandomMovie(randomMovie.first.genres.last.id);
    }
  }

  Future<void> _randomMovieListByRandomMovie(int genreId) async {
    var result = await _movieUseCase.random(limit: 10, genres: [genreId]);
    if (result.status) {
      randomMovieListByRandomMovie = result.data!;
    }
  }
}
