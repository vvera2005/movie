part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  final List<MovieModel> movies;
  final List<MovieModel> slmovies;
  final String? error;
  const MovieState({
    this.movies = const <MovieModel>[],
    this.slmovies = const <MovieModel>[],
    this.error,
  });
  @override
  List<Object> get props => [movies, slmovies];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {
  MovieLoading(MovieState initstate) : super(movies: initstate.movies);
}

final class MovieLoaded extends MovieState {
  const MovieLoaded(
    List<MovieModel> movies,
  ) : super(
          movies: movies,
        );
}

final class MovieFailed extends MovieState {
  MovieFailed(MovieState initState, String error)
      : super(
          error: error,
          movies: initState.movies,
        );
}

final class MovieSecondLineLoading extends MovieState {
  MovieSecondLineLoading(MovieState initstate) : super(slmovies: initstate.slmovies);
}

final class MovieSecondLineLoaded extends MovieState {
  const MovieSecondLineLoaded(
    List<MovieModel> slmovies,
  ) : super(
          slmovies: slmovies,
        );
}

final class MovieSecondLineFailed extends MovieState {
  MovieSecondLineFailed(MovieState initState, String error)
      : super(
          error: error,
          slmovies: initState.slmovies,
        );
}
