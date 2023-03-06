import 'package:bloc_2/Bloc/TodosBloc.dart';
import 'package:bloc_2/Service/TodosApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/TodosModel.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TodosBloc(TodosApi()),)
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Api Call using bloc"),
          ),
          body: blocApiCall(),
        ));
  }

  Widget blocApiCall() {
    return BlocProvider(create: (context) => TodosBloc(TodosApi())..add(LoadTodosEvent()),
    child: BlocBuilder<TodosBloc,TodosState>(
      builder: (context, state) {
        if(state is TodosLodingState){
          return const Center(child: CircularProgressIndicator());
        };
        if(state is TodosSuccessState){
          List<TodosModel> list = state.todos;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                      child: ListTile(
                          title: Text(
                            list[index].userId.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: Text(list[index].completed.toString(),style: const TextStyle(color: Colors.black)),
                          subtitle: Text(
                            list[index].title.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          leading: Text(
                            list[index].id.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                      )),
                );
              });
        }
        return const Text("Something wrong");
      },
    )
    );
  }
}
