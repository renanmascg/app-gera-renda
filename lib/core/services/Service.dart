import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class Service<Type, Params> {
  Future<Either<Failure, Type>> exec(Params params);
}

class NoParams {}