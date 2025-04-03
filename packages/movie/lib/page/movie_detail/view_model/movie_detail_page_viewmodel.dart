// ignore_for_file: library_private_types_in_public_api

import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/usecase/movie_usecase.dart';
part 'movie_detail_page_viewmodel.g.dart';

class MovieDetailPageViewModel = _MovieDetailPageViewModelBase with _$MovieDetailPageViewModel;

abstract class _MovieDetailPageViewModelBase with Store, CoreViewModel {
  final movieUseCase = GetIt.I<MovieUseCase>();

  @override
  void init() {
    getDetail();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @observable
  MovieModel movie = MovieModel(
    id: -1,
    name: "",
    description: "",
    poster: "",
    backdrop: "",
    release: "",
    adult: false,
    genres: [],
  );

  late final int movieID;
  @action
  Future<void> getDetail() async {
    var result = await movieUseCase.detail(movieID);
    if (result.status) {
      movie = result.data!;
    }
  }
}
