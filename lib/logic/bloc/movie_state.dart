part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  final List<MovieModel> movies;
  final List<MovieModel> slmovies;
  final String? error;
  final MovieModel? movie;
  const MovieState({
    this.movie,
    this.movies = const <MovieModel>[],
    this.slmovies = const <MovieModel>[],
    this.error,
  });
  @override
  List<Object> get props => [movies, slmovies];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {
  MovieLoading(MovieState initstate)
      : super(movies: initstate.movies, slmovies: initstate.slmovies);
}

final class MovieLoaded extends MovieState {
  MovieLoaded(
    List<MovieModel> movies,
    MovieState initstate,
  ) : super(movies: movies, slmovies: initstate.slmovies);
}

final class MovieFailed extends MovieState {
  MovieFailed(MovieState initState, String error)
      : super(
          error: error,
          movies: initState.movies,
          slmovies: initState.slmovies,
        );
}

final class MovieSecondLineLoading extends MovieState {
  MovieSecondLineLoading(MovieState initstate)
      : super(slmovies: initstate.slmovies, movies: initstate.movies);
}

final class MovieSecondLineLoaded extends MovieState {
  MovieSecondLineLoaded(List<MovieModel> slmovies, MovieState initstate)
      : super(slmovies: slmovies, movies: initstate.movies);
}

final class MovieSecondLineFailed extends MovieState {
  MovieSecondLineFailed(MovieState initState, String error)
      : super(
            error: error,
            slmovies: initState.slmovies,
            movies: initState.movies);
}

final class MovieDetailLoading extends MovieState {
  MovieDetailLoading(MovieState initState)
      : super(
            movies: initState.movies,
            movie: initState.movie,
            slmovies: initState.slmovies);
}

final class MoviesDetailLoaded extends MovieState {
  MoviesDetailLoaded(MovieState initState, MovieModel model)
      : super(
            movie: model,
            movies: initState.movies,
            slmovies: initState.slmovies);
}
