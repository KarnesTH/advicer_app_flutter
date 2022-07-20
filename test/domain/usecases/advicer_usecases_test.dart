import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/reposetories/advicer_reposetory.dart';
import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_usecases_test.mocks.dart';

@GenerateMocks([AdvicerReposetory])
void main() {
  late AdvicerUsecases advicerUsecases;
  late MockAdvicerReposetory mockAdvicerRepository;

  setUp(() {
    mockAdvicerRepository = MockAdvicerReposetory();
    advicerUsecases = AdvicerUsecases(advicerReposetory: mockAdvicerRepository);
  });

  group("getAdviceUsecase", () {
    final tAdvice = AdviceEntity(advice: "test", id: 1);
    test("should return the same advice as repo", () async {
      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Right(tAdvice));
      // act
      final result = await advicerUsecases.getAtviceUsecase();
      // assert
      expect(result, Right(tAdvice));
      verify(mockAdvicerRepository.getAdviceFromApi());
      verifyNoMoreInteractions(mockAdvicerRepository);
    });

    test("should return the same failure as repo", () async {
      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      final result = await advicerUsecases.getAtviceUsecase();
      // assert
      expect(result, Left(ServerFailure()));
      verify(mockAdvicerRepository.getAdviceFromApi());
      verifyNoMoreInteractions(mockAdvicerRepository);
    });
  });
}
