part of 'TodosBloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class LoadTodosEvent extends TodosEvent{
  @override
  List<Object?> get props => [];
}