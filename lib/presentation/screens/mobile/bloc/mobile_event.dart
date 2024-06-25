part of 'mobile_bloc.dart';

abstract class MobileEvent {}

final class ScrollUpEvent extends MobileEvent {}

final class ScrollDownEvent extends MobileEvent {}

final class BottomNavigationScreenChangeEvent extends MobileEvent {
  int index;
  BottomNavigationScreenChangeEvent({required this.index});
}
