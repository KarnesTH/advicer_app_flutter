import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdvicerUsecases {
  Future sleep1() {
    return Future.delayed(const Duration(seconds: 2), () => "1");
  }

  Future<Either<Failure, AdviceEntity>> getAtviceUsecase() async {
    // call function from reposentory to get advice

    // Buisness logic implementieren z.B. Rechnung etc.

    await sleep1();

    // return Left(ServerFailure());

    return Right(AdviceEntity(advice: "Example", id: 1));
  }
}
