import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/widgets/shared_text_field.dart';
import 'package:todo_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:todo_app/presentation/auth/bloc/auth_event.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  AuthScreenState createState() => AuthScreenState();
}

final _bloc = getIt<AuthBloc>();

class AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ReactiveForm(
            formGroup: _bloc.form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Welcome Back!..',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  SharedTextField(
                    formControlName: 'username',
                    labelText: 'Username',
                    icon: Icons.person_2_rounded,
                  ),
                  const SizedBox(height: 15),
                  SharedTextField(
                      labelText: 'Password',
                      formControlName: 'password',
                      obscureText: true,
                      icon: Icons.lock),
                  const SizedBox(height: 35),
                  ReactiveFormConsumer(builder: (context, form, child) {
                    return InkWell(
                      onTap: form.valid
                          ? () {
                              _bloc.add(LoggedInEvent(context: context));
                            }
                          : null,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: form.valid
                                        ? AppColors.primary
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.navigate_next_rounded,
                              color:
                                  form.valid ? AppColors.primary : Colors.grey)
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
