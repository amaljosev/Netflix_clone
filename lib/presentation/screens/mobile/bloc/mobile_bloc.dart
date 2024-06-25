import 'package:flutter_bloc/flutter_bloc.dart';

part 'mobile_event.dart';
part 'mobile_state.dart';

class MobileBloc extends Bloc<MobileEvent, MobileState> {
  MobileBloc() : super(MobileInitial()) {
    on<MobileEvent>((event, emit) {
       on<ScrollUpEvent>((event, emit) => emit(ShowAppbarState()));
    on<ScrollDownEvent>((event, emit) => emit(HideAppbarState()));
    on<BottomNavigationScreenChangeEvent>((event, emit) =>
        emit(BottomNavigationScreenChangeState(index: event.index)));
    });
  }
}
