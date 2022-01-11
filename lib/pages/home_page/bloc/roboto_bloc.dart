import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/roboto_repo.dart';
import 'roboto_event.dart';
import 'roboto_state.dart';

class RobotoBloc extends Bloc<RobotoEvent, RobotoState> {
  final RobotoRepo _repo;

  RobotoBloc(this._repo) : super(InitialRobotoState()) {
    on<RobotoEvent>((event, emit) async {
      if (event is FecthRobotoData) {
        emit(LoadingRobotoState());

        try {
          final robots = await _repo.getRobots();

          emit(FetchedRobotoState(robots: robots));
        } catch (e) {
          emit(ErrorRobotoState(error: e.toString()));
        }
      }
    });
  }
}
