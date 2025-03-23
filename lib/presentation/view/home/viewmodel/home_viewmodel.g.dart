// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$moviesAtom =
      Atom(name: '_HomeViewModelBase.movies', context: context);

  @override
  List<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$bigPartMoviesAtom =
      Atom(name: '_HomeViewModelBase.bigPartMovies', context: context);

  @override
  List<MovieModel> get bigPartMovies {
    _$bigPartMoviesAtom.reportRead();
    return super.bigPartMovies;
  }

  @override
  set bigPartMovies(List<MovieModel> value) {
    _$bigPartMoviesAtom.reportWrite(value, super.bigPartMovies, () {
      super.bigPartMovies = value;
    });
  }

  late final _$randomFirstPartAtom =
      Atom(name: '_HomeViewModelBase.randomFirstPart', context: context);

  @override
  List<MovieModel> get randomFirstPart {
    _$randomFirstPartAtom.reportRead();
    return super.randomFirstPart;
  }

  @override
  set randomFirstPart(List<MovieModel> value) {
    _$randomFirstPartAtom.reportWrite(value, super.randomFirstPart, () {
      super.randomFirstPart = value;
    });
  }

  late final _$randomMovieAtom =
      Atom(name: '_HomeViewModelBase.randomMovie', context: context);

  @override
  List<MovieModel> get randomMovie {
    _$randomMovieAtom.reportRead();
    return super.randomMovie;
  }

  @override
  set randomMovie(List<MovieModel> value) {
    _$randomMovieAtom.reportWrite(value, super.randomMovie, () {
      super.randomMovie = value;
    });
  }

  late final _$randomMovieListByRandomMovieAtom = Atom(
      name: '_HomeViewModelBase.randomMovieListByRandomMovie',
      context: context);

  @override
  List<MovieModel> get randomMovieListByRandomMovie {
    _$randomMovieListByRandomMovieAtom.reportRead();
    return super.randomMovieListByRandomMovie;
  }

  @override
  set randomMovieListByRandomMovie(List<MovieModel> value) {
    _$randomMovieListByRandomMovieAtom
        .reportWrite(value, super.randomMovieListByRandomMovie, () {
      super.randomMovieListByRandomMovie = value;
    });
  }

  late final _$genresAtom =
      Atom(name: '_HomeViewModelBase.genres', context: context);

  @override
  List<GenreModel> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(List<GenreModel> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  @override
  String toString() {
    return '''
movies: ${movies},
bigPartMovies: ${bigPartMovies},
randomFirstPart: ${randomFirstPart},
randomMovie: ${randomMovie},
randomMovieListByRandomMovie: ${randomMovieListByRandomMovie},
genres: ${genres}
    ''';
  }
}
