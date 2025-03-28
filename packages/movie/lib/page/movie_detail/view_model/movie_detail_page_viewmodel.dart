// ignore_for_file: library_private_types_in_public_api

import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'movie_detail_page_viewmodel.g.dart';

class MovieDetailPageViewModel = _MovieDetailPageViewModelBase with _$MovieDetailPageViewModel;

abstract class _MovieDetailPageViewModelBase with Store, CoreViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }
}
