import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Las Pelis en el cine'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
               icon: const Icon(Icons.search_outlined)
                )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            // Tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies),

            // Slider de peliculas
             MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Populares!',
            onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            

          ],
        )
        )
        );
  }
}
