// ignore_for_file: library_private_types_in_public_api

import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:genre/data/model/genre/genre_model.dart';
import 'package:genre/data/usecase/genre_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/usecase/movie_usecase.dart';

part 'main_dashboard_viewmodel.g.dart';

class MainDashboardViewModel = _MainDashboardViewModelBase with _$MainDashboardViewModel;

abstract class _MainDashboardViewModelBase with Store, CoreViewModel {
  final movieUseCase = GetIt.I<MovieUseCase>();
  final genreUseCase = GetIt.I<GenreUseCase>();

  @override
  void init() {
    _getRandomMovieWithCategoryPart();
    _firstMoviePart();
    _getRandomMovieCategoryPriorityPart();
    _getGenreList();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @observable
  List<MovieModel> randomMovieWithCategoryPartList = [];
  @observable
  List<GenreModel> genreList = [];
  @observable
  MovieModel firstMoviePart = MovieModel(id: -1, name: "", description: "", poster: "", release: "", genres: []);
  @observable
  MovieModel categoryPriorityMoviePart = MovieModel(id: -1, name: "", description: "", poster: "", release: "", genres: []);
  @action
  Future<void> _getRandomMovieWithCategoryPart() async {
    var result = await movieUseCase.repository.random(10, []);
    if (result.status) randomMovieWithCategoryPartList = result.data ?? [];
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
            release: "",
            genres: [],
          );
    }
  }

  Future<void> _getRandomMovieCategoryPriorityPart() async {
    var result = await movieUseCase.repository.random(1, []);
    if (result.status) {
      categoryPriorityMoviePart = result.data?.first ??
          MovieModel(
            id: -1,
            name: "",
            description: "",
            poster: "",
            release: "",
            genres: [],
          );
    }
  }

  Future<void> _getGenreList() async {
    var result = await genreUseCase.repository.genres();
    if (result.status) {
      genreList = result.data ?? [];
    }
  }
}
