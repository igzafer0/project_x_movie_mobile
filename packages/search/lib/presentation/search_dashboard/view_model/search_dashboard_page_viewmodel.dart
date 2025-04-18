// ignore_for_file: library_private_types_in_public_api

import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:genre/data/model/genre/genre_model.dart';
import 'package:genre/data/usecase/genre_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'search_dashboard_page_viewmodel.g.dart';

class SearchDashboardPageViewModel = _SearchDashboardPageViewModelBase with _$SearchDashboardPageViewModel;

abstract class _SearchDashboardPageViewModelBase with Store, CoreViewModel {
  final genreUseCase = GetIt.I<GenreUseCase>();

  @override
  void init() {
    _getGenreList();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @observable
  List<GenreModel> genreList = [];
  @action
  Future<void> _getGenreList() async {
    var result = await genreUseCase.repository.genres();
    if (result.status) {
      genreList = result.data ?? [];
    }
  }
}
