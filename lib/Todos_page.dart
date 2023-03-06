import 'package:bloc_2/Todos_Repo.dart';
import 'package:bloc_2/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Todos_Model.dart';

class Todos_Page extends StatefulWidget {
  const Todos_Page({Key? key}) : super(key: key);

  @override
  State<Todos_Page> createState() => _Todos_PageState();
}

class _Todos_PageState extends State<Todos_Page> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TodosBloc(Todos_Repo()),)
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Api Call using bloc"),
          ),
          body: blocApiCall(),
        ));
  }

  Widget blocApiCall() {
    return BlocProvider(create: (context) => TodosBloc(Todos_Repo())..add(LoadTodosEvent()),
    child: BlocBuilder<TodosBloc,TodosState>(
      builder: (context, state) {
        if(state is TodosLodingState){
          return const Center(child: CircularProgressIndicator());
        };
        if(state is TodosSuccessState){
          List<Todos_Model> model = state.todos;
          return ListView.builder(
              itemCount: model.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                      child: ListTile(
                          title: Text(
                            model[index].userId.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: Text(model[index].completed.toString(),style: const TextStyle(color: Colors.black)),
                          subtitle: Text(
                            model[index].title.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          leading: Text(
                            model[index].id.toString(),
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
