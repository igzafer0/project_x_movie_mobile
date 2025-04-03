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

  late final _$getDetailAsyncAction =
      AsyncAction('_MovieDetailPageViewModelBase.getDetail', context: context);

  @override
  Future<void> getDetail() {
    return _$getDetailAsyncAction.run(() => super.getDetail());
  }

  @override
  String toString() {
    return '''
movie: ${movie}
    ''';
  }
}
