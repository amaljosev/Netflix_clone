import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/screens/mobile/widgets/appbar_mob.dart';
import '../../bloc/movies_bloc.dart';
import '../widgets/movie_cards_mob_widget.dart';
import '../widgets/title_card_widget_mob.dart';

class ScreenHomeMob extends StatefulWidget {
  const ScreenHomeMob({super.key});

  @override
  State<ScreenHomeMob> createState() => _ScreenHomeMobState();
}

class _ScreenHomeMobState extends State<ScreenHomeMob> {
  late ScrollController _scrollController;
  bool isAppBarBottomVisible = true;
  int index = 0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }
  

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      context.read<MoviesBloc>().add(ScrollDownEvent());
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      context.read<MoviesBloc>().add(ScrollUpEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMob(isAppBarBottomVisible,context),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is ShowAppbarState) {
            isAppBarBottomVisible = true;
          } else if (state is HideAppbarState) {
            isAppBarBottomVisible = false;
          }
          if (state is BottomNavigationScreenChangeState) {
            index = state.index;
          }
          if (state is LoadingMoviesState) {
            return Container(
              color: Colors.grey.shade900,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.red),
              ),
            );
          } else if (state is LoadingMoviesSuccessState) {
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollNotification) {
                if (scrollNotification is UserScrollNotification) {
                  _scrollListener();
                }
                return false;
              },
              child: ListView(
                controller: _scrollController,
                children: [
                  TitleCardWidgetMob(movieList: state.popularMoviesList),
                  MovieCardMobWidget(
                      movieList: state.trendingMoviesList,
                      categoryName: 'Trending Movies'),
                  MovieCardMobWidget(
                      movieList: state.popularMoviesList,
                      categoryName: 'Popular Movies'),
                  MovieCardMobWidget(
                      movieList: state.topRatedMoviesList,
                      categoryName: 'Top Rated Movies'),
                  MovieCardMobWidget(
                      movieList: state.popularTvSeriesList,
                      categoryName: 'Popular TV Series'),
                  MovieCardMobWidget(
                      movieList: state.arrivingTodayTvSeriesList,
                      categoryName: 'Arriving Today TV Series'),
                  MovieCardMobWidget(
                      movieList: state.topTvSeriesList,
                      categoryName: 'Top TV Series'),
                ],
              ),
            );
          } else {
            return Container(
              color: Colors.grey.shade900,
              child: const Center(child: Text('Something went wrong')),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home)),
          const BottomNavigationBarItem(
              icon: Icon(Icons.gamepad_outlined),
              label: 'Games',
              activeIcon: Icon(Icons.gamepad)),
          const BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: 'New & Hot',
              activeIcon: Icon(Icons.video_library)),
          BottomNavigationBarItem(
              icon: Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              label: 'My Netflix',
              activeIcon: Container(
                height: 28,
                width: 28,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    border: Border(
                        top: BorderSide(color: Colors.white, width: 2),
                        bottom: BorderSide(color: Colors.white, width: 2),
                        left: BorderSide(color: Colors.white, width: 2),
                        right: BorderSide(color: Colors.white, width: 2)),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ))
        ],
        currentIndex: index,
        onTap: (value) {
          context
              .read<MoviesBloc>()
              .add(BottomNavigationScreenChangeEvent(index: value));
        },
      ),
    );
  }
}
