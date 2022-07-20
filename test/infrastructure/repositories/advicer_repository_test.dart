import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/reposetories/advicer_reposetory.dart';
import 'package:advicer/infrastructure/datasources/advicer_remote_datasources.dart';
import 'package:advicer/infrastructure/exceptions/exceptions.dart';
import 'package:advicer/infrastructure/models/advice_model.dart';
import 'package:advicer/infrastructure/repositories/advicer_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_repository_test.mocks.dart';

@GenerateMocks([AdvicerRemoteDatasource])
void main() {
  late AdvicerReposetory advicerReposetory;
  late MockAdvicerRemoteDatasource mockAdvicerRemoteDatasource;

  setUp(() {
    mockAdvicerRemoteDatasource = MockAdvicerRemoteDatasource();
    advicerReposetory = AdvicerRepositoryImplementation(
        advicerRemoteDatasource: mockAdvicerRemoteDatasource);
  });

  group("getAdviceFromApi", () {
    final tAdviceModel = AdviceModel(advice: "Test", id: 1);
    final AdviceEntity tAdvice = tAdviceModel;

    test(
        "should return remote data if the call to remote datasource is successfull",
        () async {
      // arrange
      when(mockAdvicerRemoteDatasource.getRandomAdviceFromApi())
          .thenAnswer((_) async => tAdviceModel);
      // act
      final result = await advicerReposetory.getAdviceFromApi();
      // assert
      verify(mockAdvicerRemoteDatasource.getRandomAdviceFromApi());
      expect(result, Right(tAdvice));
      verifyNoMoreInteractions(mockAdvicerRemoteDatasource);
    });

    test("should return server failure if datasource throws SeverException",
        () async {
      // arrange
      when(mockAdvicerRemoteDatasource.getRandomAdviceFromApi())
          .thenThrow(ServerException());
      // act
      final result = await advicerReposetory.getAdviceFromApi();
      // assert
      verify(mockAdvicerRemoteDatasource.getRandomAdviceFromApi());
      expect(result, Left(ServerFailure()));
      verifyNoMoreInteractions(mockAdvicerRemoteDatasource);
    });
  });
}
