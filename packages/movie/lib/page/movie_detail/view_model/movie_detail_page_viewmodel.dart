// ignore_for_file: library_private_types_in_public_api

import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movie/data/model/credit/credit_model.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/usecase/movie_usecase.dart';
import 'package:project_x_movie_mobile/util/constant/navigation_constant.dart';
part 'movie_detail_page_viewmodel.g.dart';

class MovieDetailPageViewModel = _MovieDetailPageViewModelBase with _$MovieDetailPageViewModel;

abstract class _MovieDetailPageViewModelBase with Store, CoreViewModel {
  final movieUseCase = GetIt.I<MovieUseCase>();

  @override
  void init() {
    getSimilarMovie();
    getDetail();
    getCredit();
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

  @observable
  List<CreditModel> credit = [];

  @observable
  List<MovieModel> similarMovieList = [];
  late final int movieID;
  @action
  Future<void> getDetail() async {
    var result = await movieUseCase.detail(movieID);
    if (result.status) {
      movie = result.data!;
    }
  }

  @action
  Future<void> getCredit() async {
    var result = await movieUseCase.credit(movieID);
    if (result.status) {
      credit = result.data!;
    }
  }

  @action
  Future<void> getSimilarMovie() async {
    debugPrint("winter $movieID");
    var result = await movieUseCase.similar(movieID: movieID, limit: 10);
    if (result.status) {
      similarMovieList = result.data!;
    }
  }

  navigateDetailPage(int movieID) {
    navigator.navigateToPage(path: NavigationConstant.MOVIE_DETAIL, data: movieID);
  }
}
