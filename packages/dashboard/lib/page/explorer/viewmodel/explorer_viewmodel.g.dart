// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explorer_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExplorerViewModel on _ExplorerViewModelBase, Store {
  late final _$randomMovieWithCategoryPartListAtom = Atom(
      name: '_ExplorerViewModelBase.randomMovieWithCategoryPartList',
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

  late final _$_getRandomMovieWithCategoryPartAsyncAction = AsyncAction(
      '_ExplorerViewModelBase._getRandomMovieWithCategoryPart',
      context: context);

  @override
  Future<void> _getRandomMovieWithCategoryPart() {
    return _$_getRandomMovieWithCategoryPartAsyncAction
        .run(() => super._getRandomMovieWithCategoryPart());
  }

  @override
  String toString() {
    return '''
randomMovieWithCategoryPartList: ${randomMovieWithCategoryPartList}
    ''';
  }
}
