// import 'package:flutter/material.dart';
// import 'package:movies/logic/bloc/movie_bloc.dart';
// import 'package:movies/models/movie_model.dart';

// class DetailedMovie extends StatelessWidget {
//   const DetailedMovie(
//       {super.key,  required this.index, required this.name});
//   final int index;
//   final List<MovieModel> name;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: const Icon(
//           Icons.arrow_back,
//           color: Colors.white,
//         ),
//         actions: const [
//           Icon(
//             Icons.person_pin,
//             color: Colors.white,
//           )
//         ],
//       ),
//       body: Column(
//         children: <Widget>[
//          name[index].primaryImage != null
//                                   ? Image.network(
//                                       name[index].primaryImage?.url ??
//                                           "",
//                                       height: 180,
//                                     )
//                                   : Container(
//                                       decoration: const BoxDecoration(
//                                           color: Colors.white),
//                                       child: Center(
//                                           child: Text(name[index]
//                                                   .titleText?.text ??
//                                               "No Name")),
//                                     ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/logic/bloc/movie_bloc.dart';

class DetailedMovie extends StatelessWidget {
  const DetailedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state is MovieFailed && state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error!),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            actions: const <Widget>[Icon(Icons.person_pin)],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                  height: 200,
                  child: state.movie?.primaryImage?.url != null
                      ? Image.network(state.movie?.primaryImage?.url ?? "")
                      : Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child:
                              Text(state.movie?.titleText?.text ?? "No movie"),
                        )),
              Text(
                state.movie?.titleText?.text ?? "NO MOVIE",
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.all(8),
                height: 36,
                color: Colors.white,
                child: Center(child: Text("Play Movie")),
              ),
              Container(
                margin: EdgeInsets.all(8),
                height: 36,
                color: Colors.grey,
                child: Center(
                  child: Text("Download"),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
