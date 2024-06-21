import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/styles/app_styles.dart';
import 'package:netflix/presentation/screens/bloc/movies_bloc.dart';
import 'package:netflix/presentation/screens/web/home/widgets/continue_watching_widget.dart';
import 'package:netflix/presentation/screens/web/home/widgets/movie_cards_widget.dart';
import 'package:netflix/presentation/screens/web/home/widgets/title_card_widget_web.dart';
import 'package:netflix/presentation/screens/widgets/drawer_widget.dart';

class ScreenHomeWeb extends StatelessWidget {
  const ScreenHomeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NETFLIX-web', style: AppStyles.logoStyle),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
        ),
        drawer: drawer(context),
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is LoadingMoviesState) {
              return Container(
                color: Colors.grey.shade900,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (state is LoadingMoviesSuccessState) {
              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  TitleCardWidgetWeb(movieList: state.popularMoviesList),
                  MovieCardWidget(
                      movieList: state.trendingMoviesList,
                      categoryName: 'Trending Movies'),
                  ContinueWatchingWidget(movieList: state.trendingMoviesList),
                  MovieCardWidget(
                      movieList: state.popularMoviesList,
                      categoryName: 'Popular Movies'),
                  MovieCardWidget(
                      movieList: state.topRatedMoviesList,
                      categoryName: 'Top Rated Movies'),
                  MovieCardWidget(
                      movieList: state.popularTvSeriesList,
                      categoryName: 'Popular TV Series'),
                  MovieCardWidget(
                      movieList: state.arrivingTodayTvSeriesList,
                      categoryName: 'Arriving Today TV Series'),
                  MovieCardWidget(
                      movieList: state.topTvSeriesList,
                      categoryName: 'Top TV Series'),
                ],
              );
            } else {
              return Container(
                color: Colors.grey.shade900,
                child: const Center(child: Text('Something went wrong')),
              );
            }
          },
        ));
  }
}
