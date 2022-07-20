import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/reposetories/advicer_reposetory.dart';
import 'package:advicer/infrastructure/repositories/advicer_repository_implementation.dart';
import 'package:dartz/dartz.dart';

class AdvicerUsecases {
  final AdvicerReposetory advicerReposetory = AdvicerRepositoryImplementation();

  Future<Either<Failure, AdviceEntity>> getAtviceUsecase() async {
    return advicerReposetory.getAdviceFromApi();
  }
}
