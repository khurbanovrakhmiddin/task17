abstract class AppFailure {
  final String message;
  final int statusCode;

  const AppFailure({required this.message, required this.statusCode});
}

class AppServerFailure extends AppFailure {
  AppServerFailure({required super.message, required super.statusCode});
}
class AppSomethingFailure extends AppFailure {
  AppSomethingFailure({required super.message, required super.statusCode});
}
class AppEmptyFailure extends AppFailure {
  const AppEmptyFailure({  super.message = '',   super.statusCode = -1});
}
