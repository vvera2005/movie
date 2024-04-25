part of 'movie_bloc.dart';

sealed class MovieEvent  {
  const MovieEvent();
}

class GetMovies extends MovieEvent{}

class GetSecondLineMovies extends MovieEvent{}

class GetMovieByIdEvent extends MovieEvent {
  GetMovieByIdEvent(this.id);

  final int id;
}