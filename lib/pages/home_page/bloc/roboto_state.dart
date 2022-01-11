import '../../../models/roboto.dart';

abstract class RobotoState {}

class InitialRobotoState extends RobotoState {}

class LoadingRobotoState extends RobotoState {}

class FetchedRobotoState extends RobotoState {
  final List<Roboto> robots;

  FetchedRobotoState({required this.robots});
}

class ErrorRobotoState extends RobotoState {
  final String error;

  ErrorRobotoState({required this.error});
}
