part of 'cats_bloc.dart';

@immutable
abstract class CatsState {}

class CatsInitial extends CatsState {} //состояние

class CatsSucces extends CatsState {
  // успех

  final String? image;

  CatsSucces({required this.image});
}

class CatsError extends CatsState {} // ошибка
