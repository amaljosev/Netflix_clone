part of 'movies_bloc.dart';


abstract class MoviesEvent {}

class GetMoviesEvent extends MoviesEvent {}
final class ScrollUpEvent extends MoviesEvent {}

final class ScrollDownEvent extends MoviesEvent {}

final class BottomNavigationScreenChangeEvent extends MoviesEvent {
  int index;
  BottomNavigationScreenChangeEvent({required this.index});
}


