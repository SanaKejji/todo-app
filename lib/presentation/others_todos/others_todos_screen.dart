import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/widgets/component_template.dart';
import 'package:todo_app/core/widgets/todo_card.dart';
import 'package:todo_app/presentation/others_todos/bloc/others_todos_bloc.dart';
import 'package:todo_app/presentation/others_todos/bloc/others_todos_event.dart';
import 'package:todo_app/presentation/others_todos/bloc/others_todos_state.dart';

import '../../core/widgets/infinite_list_widget.dart';

@RoutePage()
class OthersTodosScreen extends StatefulWidget {
  const OthersTodosScreen({super.key});

  @override
  OthersTodosScreenState createState() => OthersTodosScreenState();
}

class OthersTodosScreenState extends State<OthersTodosScreen> {
  final _bloc = getIt<OthersTodosBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(TodosFetchedInitialPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OthersTodosBloc>(
      create: (context) => _bloc,
      child: BlocBuilder<OthersTodosBloc, OthersTodosState>(
          builder: (context, state) {
        return ComponentTemplate(
          state: state.screenStatus,
          errorMessage: state.errorMessage,
          onRetry: () {
            _bloc.add(TodosFetchedInitialPageEvent());
          },
          screen: (context) => InfiniteListWidget(
            hasReachedMax: state.hasReachedMax,
            itemLength: state.todos.length,
            onrefresh: () {
              _bloc.add(TodosFetchedInitialPageEvent());
            },
            onFetchNextPage: () {
              _bloc.add(TodosFetchedNextPageEvent());
            },
            itemBuilder: (context, index) {
              return TodoCard(
                canControl: false,
                todo: state.todos[index],
                onclickDelete: () {},
                onclickUpdate: () {},
              );
            },
          ),
        );
      }),
    );
  }
}
