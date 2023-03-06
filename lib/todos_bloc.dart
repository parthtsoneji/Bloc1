import 'package:bloc/bloc.dart';
import 'package:bloc_2/Todos_Repo.dart';
import 'package:equatable/equatable.dart';
import 'Todos_Model.dart';
part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final Todos_Repo _todoRepo;

  TodosBloc(this._todoRepo) : super(TodosLodingState()) {
    on<TodosEvent>((event, emit) async {
      emit(TodosLodingState());
      try {
        var todos = await _todoRepo.getUsers();
        emit(TodosSuccessState(todos));
      } catch (e) {
        emit(TodosErrorState(e.toString()));
      }
    });
  }
}
