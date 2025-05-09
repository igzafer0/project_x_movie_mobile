// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_page_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieDetailPageViewModel on _MovieDetailPageViewModelBase, Store {
  late final _$movieAtom =
      Atom(name: '_MovieDetailPageViewModelBase.movie', context: context);

  @override
  MovieModel get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(MovieModel value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$creditAtom =
      Atom(name: '_MovieDetailPageViewModelBase.credit', context: context);

  @override
  List<CreditModel> get credit {
    _$creditAtom.reportRead();
    return super.credit;
  }

  @override
  set credit(List<CreditModel> value) {
    _$creditAtom.reportWrite(value, super.credit, () {
      super.credit = value;
    });
  }

  late final _$similarMovieListAtom = Atom(
      name: '_MovieDetailPageViewModelBase.similarMovieList', context: context);

  @override
  List<MovieModel> get similarMovieList {
    _$similarMovieListAtom.reportRead();
    return super.similarMovieList;
  }

  @override
  set similarMovieList(List<MovieModel> value) {
    _$similarMovieListAtom.reportWrite(value, super.similarMovieList, () {
      super.similarMovieList = value;
    });
  }

  late final _$movieRateAtom =
      Atom(name: '_MovieDetailPageViewModelBase.movieRate', context: context);

  @override
  double get movieRate {
    _$movieRateAtom.reportRead();
    return super.movieRate;
  }

  @override
  set movieRate(double value) {
    _$movieRateAtom.reportWrite(value, super.movieRate, () {
      super.movieRate = value;
    });
  }

  late final _$getDetailAsyncAction =
      AsyncAction('_MovieDetailPageViewModelBase.getDetail', context: context);

  @override
  Future<void> getDetail() {
    return _$getDetailAsyncAction.run(() => super.getDetail());
  }

  late final _$getCreditAsyncAction =
      AsyncAction('_MovieDetailPageViewModelBase.getCredit', context: context);

  @override
  Future<void> getCredit() {
    return _$getCreditAsyncAction.run(() => super.getCredit());
  }

  late final _$getSimilarMovieAsyncAction = AsyncAction(
      '_MovieDetailPageViewModelBase.getSimilarMovie',
      context: context);

  @override
  Future<void> getSimilarMovie() {
    return _$getSimilarMovieAsyncAction.run(() => super.getSimilarMovie());
  }

  @override
  String toString() {
    return '''
movie: ${movie},
credit: ${credit},
similarMovieList: ${similarMovieList},
movieRate: ${movieRate}
    ''';
  }
}
