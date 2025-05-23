// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:genre/data/model/genre/genre_model.dart';
import 'package:genre/data/usecase/genre_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/usecase/movie_usecase.dart';
import 'package:project_x_movie_mobile/util/constant/navigation_constant.dart';

part 'main_dashboard_viewmodel.g.dart';

class MainDashboardViewModel = _MainDashboardViewModelBase with _$MainDashboardViewModel;

abstract class _MainDashboardViewModelBase with Store, CoreViewModel {
  final movieUseCase = GetIt.I<MovieUseCase>();
  final genreUseCase = GetIt.I<GenreUseCase>();

  @override
  void init() {
    _firstMoviePart();
    _getRandomMovieCategoryPriorityPart();
    _getGenreList();
    _getRecomendation();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  navigateDetailPage(int movieID) {
    navigator.navigateToPage(path: NavigationConstant.MOVIE_DETAIL, data: movieID);
  }

  @observable
  List<MovieModel> randomMovieWithCategoryPartList = [];

  @observable
  List<MovieModel> recomendationMovieList = [];

  @observable
  List<GenreModel> genreList = [];
  @observable
  MovieModel firstMoviePart = MovieModel(
    id: -1,
    name: "",
    description: "",
    poster: "",
    backdrop: "",
    release: DateTime.now(),
    genres: [],
    adult: false,
  );
  @observable
  MovieModel categoryPriorityMoviePart = MovieModel(
    id: -1,
    name: "",
    description: "",
    poster: "",
    backdrop: "",
    release: DateTime.now(),
    genres: [],
    adult: false,
  );
  @action
  Future<void> _getRandomMovieWithCategoryPart() async {
    var randomIndex = Random().nextInt(genreList.length);
    var result = await movieUseCase.repository.random(10, [genreList[randomIndex].id]);
    if (result.status) randomMovieWithCategoryPartList = result.data ?? [];
  }

  @action
  Future<void> _getRecomendation() async {
    var result = await movieUseCase.repository.recomendation(50);
    if (result.status) recomendationMovieList = result.data ?? [];
  }

  Future<void> _firstMoviePart() async {
    var result = await movieUseCase.repository.random(1, []);
    if (result.status) {
      firstMoviePart = result.data?.first ??
          MovieModel(
            id: -1,
            name: "",
            description: "",
            poster: "",
            backdrop: "",
            release: DateTime.now(),
            genres: [],
            adult: false,
          );
    }
  }

  String findCommonGenre(List<MovieModel> movies) {
    final Map<int, int> genreCount = {};
    final Map<int, GenreModel> genreMap = {};
    for (var movie in movies) {
      for (var genre in movie.genres) {
        genreCount[genre.id] = (genreCount[genre.id] ?? 0) + 1;
        genreMap[genre.id] = genre;
      }
    }

    final topGenreId = genreCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    final topGenre = genreMap[topGenreId];
    return topGenre?.name ?? "";
  }

  Future<void> _getRandomMovieCategoryPriorityPart() async {
    var result = await movieUseCase.repository.random(1, []);
    if (result.status) {
      categoryPriorityMoviePart = result.data?.first ??
          MovieModel(id: -1, name: "", description: "", poster: "", backdrop: "", release: DateTime.now(), genres: [], adult: false);
    }
  }

  Future<void> _getGenreList() async {
    var result = await genreUseCase.repository.genres();
    if (result.status) {
      genreList = result.data ?? [];
      _getRandomMovieWithCategoryPart();
    }
  }
}
