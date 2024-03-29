part of 'TodosBloc.dart';

abstract class TodosState extends Equatable {}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLodingState extends TodosState {
  @override
  List<Object?> get props => [];
}

class TodosSuccessState extends TodosState {
  final List<TodosModel> todos;
  TodosSuccessState(this.todos);
  @override
  List<Object?> get props => [todos];
}

class TodosErrorState extends TodosState {
  final String error;
  TodosErrorState(this.error);
  @override
  List<Object?> get props => [error];
}


