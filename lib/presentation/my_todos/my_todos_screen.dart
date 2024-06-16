import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/widgets/component_template.dart';
import 'package:todo_app/presentation/my_todos/bloc/my_todos_event.dart';
import 'package:todo_app/presentation/my_todos/bloc/my_todos_state.dart';

import '../../core/widgets/infinite_list_widget.dart';
import 'bloc/my_todos_bloc.dart';

@RoutePage()
class MyTodosScreen extends StatefulWidget {
  const MyTodosScreen({super.key});

  @override
  MyTodosScreenState createState() => MyTodosScreenState();
}

class MyTodosScreenState extends State<MyTodosScreen> {
  final _bloc = getIt<MyTodosBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(MyTodosFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.openAddTodoDialog(context);
        },
        elevation: 3,
        child: const Icon(Icons.add),
      ),
      body: BlocProvider<MyTodosBloc>(
        create: (context) => _bloc,
        child:
            BlocBuilder<MyTodosBloc, MyTodosState>(builder: (context, state) {
          return ComponentTemplate(
            state: state.screenStatus,
            errorMessage: state.errorMessage,
            onRetry: () {
              _bloc.add(MyTodosFetchedEvent());
            },
            screen: (context) => InfiniteListWidget(
              hasReachedMax: true,
              itemLength: state.todos.length,
              onrefresh: () {
                _bloc.add(MyTodosFetchedEvent());
              },
              onFetchNextPage: () {},
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _bloc.add(DeletedTodoEvent(id: state.todos[index].id));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(state.todos[index].todo),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
