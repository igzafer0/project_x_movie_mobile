import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/usecase/movie_usecase.dart';

part 'explorer_viewmodel.g.dart';

class ExplorerViewModel = _ExplorerViewModelBase with _$ExplorerViewModel;

abstract class _ExplorerViewModelBase with Store, CoreViewModel {
  final movieUseCase = GetIt.I<MovieUseCase>();

  @override
  void init() {
    _getRandomMovieWithCategoryPart();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @observable
  List<MovieModel> randomMovieWithCategoryPartList = [];
  @action
  Future<void> _getRandomMovieWithCategoryPart() async {
    var result = await movieUseCase.repository.random(121, []);
    if (result.status) randomMovieWithCategoryPartList = result.data ?? [];
    debugPrint("test ${randomMovieWithCategoryPartList.length}");
  }
}
