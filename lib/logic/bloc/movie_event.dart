part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovies extends MovieEvent{}

class GetSecondLineMovies extends MovieEvent{}