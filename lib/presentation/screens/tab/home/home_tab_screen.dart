import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/styles/app_styles.dart';
import 'package:netflix/presentation/screens/bloc/movies_bloc.dart';
import 'package:netflix/presentation/screens/tab/home/widgets/movie_cards_tab_widget.dart';
import 'package:netflix/presentation/screens/tab/home/widgets/title_card_widget_tab.dart';
import 'package:netflix/presentation/screens/widgets/drawer_widget.dart';

class ScreenHomeTab extends StatelessWidget {
  const ScreenHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NETFLIX-tab', style: AppStyles.logoStyle),
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
                  TitleCardWidgetTab(movieList: state.popularMoviesList),
                  MovieCardTabWidget(
                      movieList: state.trendingMoviesList,
                      categoryName: 'Trending Movies'),
                  MovieCardTabWidget(
                      movieList: state.popularMoviesList,
                      categoryName: 'Popular Movies'),
                  MovieCardTabWidget(
                      movieList: state.topRatedMoviesList,
                      categoryName: 'Top Rated Movies'),
                  MovieCardTabWidget(
                      movieList: state.popularTvSeriesList,
                      categoryName: 'Popular TV Series'),
                  MovieCardTabWidget(
                      movieList: state.arrivingTodayTvSeriesList,
                      categoryName: 'Arriving Today TV Series'),
                  MovieCardTabWidget(
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
