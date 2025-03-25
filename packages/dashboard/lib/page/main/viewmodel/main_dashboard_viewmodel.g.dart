// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_dashboard_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainDashboardViewModel on _MainDashboardViewModelBase, Store {
  late final _$randomMovieWithCategoryPartListAtom = Atom(
      name: '_MainDashboardViewModelBase.randomMovieWithCategoryPartList',
      context: context);

  @override
  List<MovieModel> get randomMovieWithCategoryPartList {
    _$randomMovieWithCategoryPartListAtom.reportRead();
    return super.randomMovieWithCategoryPartList;
  }

  @override
  set randomMovieWithCategoryPartList(List<MovieModel> value) {
    _$randomMovieWithCategoryPartListAtom
        .reportWrite(value, super.randomMovieWithCategoryPartList, () {
      super.randomMovieWithCategoryPartList = value;
    });
  }

  late final _$genreListAtom =
      Atom(name: '_MainDashboardViewModelBase.genreList', context: context);

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

  late final _$firstMoviePartAtom = Atom(
      name: '_MainDashboardViewModelBase.firstMoviePart', context: context);

  @override
  MovieModel get firstMoviePart {
    _$firstMoviePartAtom.reportRead();
    return super.firstMoviePart;
  }

  @override
  set firstMoviePart(MovieModel value) {
    _$firstMoviePartAtom.reportWrite(value, super.firstMoviePart, () {
      super.firstMoviePart = value;
    });
  }

  late final _$categoryPriorityMoviePartAtom = Atom(
      name: '_MainDashboardViewModelBase.categoryPriorityMoviePart',
      context: context);

  @override
  MovieModel get categoryPriorityMoviePart {
    _$categoryPriorityMoviePartAtom.reportRead();
    return super.categoryPriorityMoviePart;
  }

  @override
  set categoryPriorityMoviePart(MovieModel value) {
    _$categoryPriorityMoviePartAtom
        .reportWrite(value, super.categoryPriorityMoviePart, () {
      super.categoryPriorityMoviePart = value;
    });
  }

  late final _$_getRandomMovieWithCategoryPartAsyncAction = AsyncAction(
      '_MainDashboardViewModelBase._getRandomMovieWithCategoryPart',
      context: context);

  @override
  Future<void> _getRandomMovieWithCategoryPart() {
    return _$_getRandomMovieWithCategoryPartAsyncAction
        .run(() => super._getRandomMovieWithCategoryPart());
  }

  @override
  String toString() {
    return '''
randomMovieWithCategoryPartList: ${randomMovieWithCategoryPartList},
genreList: ${genreList},
firstMoviePart: ${firstMoviePart},
categoryPriorityMoviePart: ${categoryPriorityMoviePart}
    ''';
  }
}
