

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/logic/bloc/movie_bloc.dart';
import 'package:movies/pages/detailed_movies.dart';
import 'package:movies/pages/home_page.dart';
import 'package:movies/routes/route_params/movie_detail_route_params.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/services/movie_service.dart';
import 'package:movies/services/second_line_movies_service.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings,
      {dynamic arguments}) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MovieBloc(MovieService(ApiService()), SecondLineMoviesService(ApiService()) // TODO: Use getIt
            )..add(GetMovies())..add(GetSecondLineMovies()),
            child:  const HomePage(),
          ),
        );
      case '/movie-detail':
        final MovieDetailRouteParam movieDetailRouteParam =
            settings.arguments as MovieDetailRouteParam;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: movieDetailRouteParam.movieBloc..add(GetMovieByIdEvent(movieDetailRouteParam.index ?? 0)),
          child: DetailedMovie(),
          )
        );
      default:
        throw Exception('Route not found!');
    }
  }
}