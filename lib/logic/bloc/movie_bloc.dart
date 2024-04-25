import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/services/movie_service.dart';
import 'package:movies/services/second_line_movies_service.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this._movieService, this._secondLinemovieService)
      : super(MovieInitial()) {
    on<GetMovies>(_mapGetMovieEventToState);
    on<GetSecondLineMovies>(_mapGetSecondLineMovieEventToState);
    on<GetMovieByIdEvent>(_mapGetMovieByIdEventToState);
  }
  final MovieService _movieService;
  final SecondLineMoviesService _secondLinemovieService;

  FutureOr<void> _mapGetMovieEventToState(
      GetMovies event, Emitter<MovieState> emit) async {
    try {
      emit(MovieLoading(state));
      final List<MovieModel> models = await _movieService.getMovies();
      emit(MovieLoaded(models, state));
    } catch (e) {
      emit(MovieFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapGetSecondLineMovieEventToState(
      GetSecondLineMovies event, Emitter<MovieState> emit) async {
    try {
      emit(MovieSecondLineLoading(state));
      final List<MovieModel> slmodels =
          await _secondLinemovieService.getMovies();
      emit(MovieSecondLineLoaded(slmodels, state));
    } catch (e) {
      emit(MovieSecondLineFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapGetMovieByIdEventToState(GetMovieByIdEvent event, Emitter<MovieState> emit)async {
    try {
      emit(MovieDetailLoading(state));
      final MovieModel model = await _movieService.getMovieById(event.id);
      emit(MoviesDetailLoaded(state, model));
    } catch (e) {
      emit(MovieFailed(state, e.toString()));
    }
  }
}
