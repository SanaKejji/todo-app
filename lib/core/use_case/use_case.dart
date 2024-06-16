import 'package:dartz/dartz.dart';

import '../error/app_exception.dart';

abstract class UseCase<output, Params> {
  output call(Params params);
}

class NoParams {}
