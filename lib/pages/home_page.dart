import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/logic/bloc/movie_bloc.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/services/movie_service.dart';
import 'package:movies/services/second_line_movies_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(
          MovieService(ApiService()), SecondLineMoviesService(ApiService()))
        ..add(
          GetMovies(),
        )
        ..add(GetSecondLineMovies()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is MovieFailed && state.error != null ||
                state is MovieSecondLineFailed && state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.error!,
                  style: TextStyle(color: Colors.white),
                ),
              ));
            }
          },
          builder: (BuildContext context, MovieState state) {
            return state is MovieLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/prime_video.png",
                          ),
                          const Icon(
                            Icons.person_pin,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Image.asset("assets/images/main_picture.png"),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Prime - Recommended movies",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.movies.isNotEmpty ? state.movies.length : 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              state.movies[index].primaryImage?.url ?? "",
                              height: 180,
                            ),
                          );
                        },
                      )),
                      const SizedBox(height: 12),
                      // Text(
                      //   "data",
                      //   style: TextStyle(
                      //     color: Colors.amber,
                      //     fontSize: 36,
                      //   ),
                      // ),
                      const Text(
                        "Prime - Movies in indi",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.slmovies.isNotEmpty
                            ? state.slmovies.length
                            : 0,
                        itemBuilder: (context, index) {
                          // return const Text(
                          //   "data",
                          //   style: TextStyle(
                          //     color: Colors.amber,
                          //     fontSize: 36,
                          //   ),
                          // );
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              state.slmovies[index].primaryImage?.url ?? "",
                              height: 180,
                            ),
                          );
                        },
                      )),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
