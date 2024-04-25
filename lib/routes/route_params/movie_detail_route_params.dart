import 'package:movies/logic/bloc/movie_bloc.dart';

class MovieDetailRouteParam {
  final MovieBloc movieBloc;
  final int? index;

  MovieDetailRouteParam({required this.movieBloc, required this.index});
}