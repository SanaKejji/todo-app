import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';

import 'package:todo_app/data/models/todo/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final bool canControl;
  final VoidCallback onclickUpdate;
  final VoidCallback onclickDelete;

  const TodoCard(
      {super.key,
      required this.todo,
      required this.onclickDelete,
      required this.onclickUpdate,
      this.canControl = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                    color: Colors.white.withOpacity(0.2), width: 0.5),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
                child: Text(
                  canControl ? todo.todo : '${todo.id}: ${todo.todo}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (canControl)
                    InkWell(
                      onTap: canControl
                          ? () {
                              onclickDelete.call();
                            }
                          : null,
                      child: Container(
                        width: 90,
                        height: 45,
                        decoration: BoxDecoration(
                            color: AppColors.red.withOpacity(.3),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15))),
                        child: Center(
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                    ),
                  InkWell(
                    onTap: canControl
                        ? () {
                            onclickUpdate.call();
                          }
                        : null,
                    child: Container(
                      width: 90,
                      height: 45,
                      decoration: BoxDecoration(
                          color: todo.completed
                              ? AppColors.green.withOpacity(.3)
                              : Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topLeft: canControl
                                  ? Radius.zero
                                  : Radius.circular(15))),
                      child: Center(
                        child: Icon(
                          todo.completed
                              ? Icons.check_circle_outline_rounded
                              : Icons.circle_outlined,
                          color: todo.completed ? AppColors.green : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
