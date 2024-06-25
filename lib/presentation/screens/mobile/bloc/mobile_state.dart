part of 'mobile_bloc.dart';

abstract class MobileState {}

final class MobileInitial extends MobileState {}

final class ShowAppbarState extends MobileState {}

final class HideAppbarState extends MobileState {}

final class BottomNavigationScreenChangeState extends MobileState{
  int index;
  BottomNavigationScreenChangeState({required this.index});
}