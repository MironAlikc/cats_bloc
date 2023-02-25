import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../cats_repo.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  CatsBloc({required this.repo}) : super(CatsInitial()) {
    on<PressButtonEvent>(
      (event, emit) async {
        // Что буде происходить при нажатии на кнопку
        try {
          final image = await repo.getCatsUrl();
          emit(CatsSucces(image: image)); // emit вызови такое состояние
        } catch (e) {
          emit(CatsError());
        }
// передаю данные в состояние
      },
    );
  }
  final CatsRepo repo;
}
