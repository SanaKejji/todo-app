import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/data/models/todo/todo.dart';

import '../theme/app_colors.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback onclickUpdate;
  final VoidCallback onclickDelete;

  const TodoCard(
      {super.key,
      required this.todo,
      required this.onclickDelete,
      required this.onclickUpdate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                    color: Colors.white.withOpacity(0.2), width: 0.5),
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
                child: Text(
                  todo.todo,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.white),
                ),
              ),
            ]),
          ),
        ),
      ),
    );

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white70, Colors.grey],
            ),
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey.shade200.withOpacity(0.5)),
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(todo.todo,
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(color: theme.colorScheme.onPrimary))
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ReadMoreText(
                    todo.todo,
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: theme.primaryColorLight),
                    trimLines: 2,
                    colorClickableText: AppColors.primary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'show less',
                    moreStyle: theme.textTheme.bodySmall
                        ?.copyWith(color: theme.colorScheme.onPrimary),
                    lessStyle: theme.textTheme.bodySmall
                        ?.copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
                // Row(
                //   children: [
                //     Container(
                //       width: 35,
                //       height: 35,
                //       decoration: BoxDecoration(
                //         color: AppColors.white,
                //         boxShadow: [
                //           BoxShadow(
                //             color: AppColors.black.withOpacity(0.2),
                //             blurRadius: 2,
                //           ),
                //         ],
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(12.0)),
                //       ),
                //       child: IconButton(
                //         icon: Image.asset(
                //             'assets/job_seeker_assets/ic_share.png'),
                //         onPressed: () {
                //           shareClicked.call();
                //         },
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     Container(
                //       width: 35,
                //       height: 35,
                //       decoration: BoxDecoration(
                //         color: AppColors.primary,
                //         boxShadow: [
                //           BoxShadow(
                //             color: AppColors.black.withOpacity(0.2),
                //             blurRadius: 2,
                //           ),
                //         ],
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(12.0)),
                //       ),
                //       child: IconButton(
                //         iconSize: 20,
                //         icon:
                //             Image.asset('assets/job_seeker_assets/ic_call.png'),
                //         onPressed: () {
                //           callClicked.call();
                //         },
                //       ),
                //     )
                //   ],
                // )
              ],
            )),
      ),
    );
  }
}
