import 'package:flutter/cupertino.dart';

abstract class AuthEvent {}

class LoggedInEvent extends AuthEvent {
  final BuildContext context;

  LoggedInEvent({required this.context});
}
