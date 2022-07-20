import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/reposetories/advicer_reposetory.dart';
import 'package:advicer/infrastructure/datasources/advicer_remote_datasources.dart';
import 'package:advicer/infrastructure/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';

class AdvicerRepositoryImplementation implements AdvicerReposetory {
  final AdvicerRemoteDatasource advicerRemoteDatasource =
      AdvicerRemoteDatasourceImplementation();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromApi() async {
    try {
      final remoteAdvice =
          await advicerRemoteDatasource.getRandomAdviceFromApi();
      return Right(remoteAdvice);
    } catch (e) {
      if (e.runtimeType is ServerException) {
        return Left(ServerFailure());
      } else {
        return Left(GeneralFailure());
      }
    }
  }
}
