import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/styles/app_styles.dart';
import 'package:netflix/presentation/screens/bloc/movies_bloc.dart';
import 'package:netflix/presentation/screens/web/home/widgets/continue_watching_widget.dart';
import 'package:netflix/presentation/screens/web/home/widgets/movie_cards_widget.dart';
import 'package:netflix/presentation/screens/web/home/widgets/title_video_widget.dart';
import 'package:netflix/presentation/screens/widgets/drawer_widget.dart';
import 'package:video_player/video_player.dart';

class ScreenHomeWeb extends StatefulWidget {
  const ScreenHomeWeb({super.key});

  @override
  State<ScreenHomeWeb> createState() => _ScreenHomeWebState();
}

class _ScreenHomeWebState extends State<ScreenHomeWeb> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(GetMoviesEvent());
    _controller = VideoPlayerController.asset('assets/videos/inside_out.mp4')
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error) {
        log('Error initializing video player: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NETFLIX', style: AppStyles.logoStyle),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
        ),
        drawer: drawer(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _controller.play(),
        ),
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
                  TitleVideoWidget(controller: _controller),
                  ContinueWatchingWidget(movieList: state.trendingMoviesList),
                  MovieCardWidget(
                      movieList: state.trendingMoviesList,
                      categoryName: 'Trending Movies'),
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
