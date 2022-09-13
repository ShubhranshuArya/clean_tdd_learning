import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

// Some general failures
abstract class ServerFailure extends Failure {}

abstract class CacheFailure extends Failure {}
