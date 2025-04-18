// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dashboard_page_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchDashboardPageViewModel
    on _SearchDashboardPageViewModelBase, Store {
  late final _$genreListAtom = Atom(
      name: '_SearchDashboardPageViewModelBase.genreList', context: context);

  @override
  List<GenreModel> get genreList {
    _$genreListAtom.reportRead();
    return super.genreList;
  }

  @override
  set genreList(List<GenreModel> value) {
    _$genreListAtom.reportWrite(value, super.genreList, () {
      super.genreList = value;
    });
  }

  late final _$_getGenreListAsyncAction = AsyncAction(
      '_SearchDashboardPageViewModelBase._getGenreList',
      context: context);

  @override
  Future<void> _getGenreList() {
    return _$_getGenreListAsyncAction.run(() => super._getGenreList());
  }

  @override
  String toString() {
    return '''
genreList: ${genreList}
    ''';
  }
}
