import 'package:flutter/material.dart';
import 'package:movies/logic/bloc/movie_bloc.dart';
import 'package:movies/pages/detailed_movies.dart';
import 'package:movies/pages/home_page.dart';
import 'package:movies/routes/route_table.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    onGenerateRoute:AppRouter.onGenerateRoute ,
  ));
}
