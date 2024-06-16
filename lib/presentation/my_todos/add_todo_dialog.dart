import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:todo_app/core/widgets/shared_text_field.dart';

import '../../core/theme/app_colors.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key, required this.onClickAdd});
  final Function(String todo) onClickAdd;

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final form = FormGroup({
    'todo': FormControl<String>(validators: [Validators.required]),
  });
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Dialog(
        // insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add new todo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              SharedTextField(
                icon: Icons.abc_rounded,
                formControlName: 'todo',
                labelText: 'Todo description',
              ),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ReactiveFormConsumer(builder: (context, form, child) {
                  return ElevatedButton(
                      onPressed: form.valid
                          ? () {
                              widget.onClickAdd(form.control('todo').value);
                              Navigator.pop(context, true);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: const Text('Add'));
                }),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.primary)),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Cancel'),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
