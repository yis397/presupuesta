import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculo_event.dart';
part 'calculo_state.dart';

class CalculoBloc extends Bloc<CalculoEvent, CalculoState> {
  CalculoBloc() : super(CalculoState(i: 0)) {
    on<CalculoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
