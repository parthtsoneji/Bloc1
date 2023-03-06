import 'package:bloc_2/Service/TodosApi.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/TodosModel.dart';
part 'TodosEvent.dart';
part 'TodosState.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosApi todosapi;

  TodosBloc(this.todosapi) : super(TodosLodingState()) {
    on<TodosEvent>((event, emit) async {
      emit(TodosLodingState());
      try {
        var todos = await todosapi.getUsers();
        emit(TodosSuccessState(todos));
      } catch (e) {
        emit(TodosErrorState(e.toString()));
      }
    });
  }
}
