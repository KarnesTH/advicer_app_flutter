import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdvicerReposetory {
  Future<Either<Failure, AdviceEntity>> getAdviceFromApi();
}
