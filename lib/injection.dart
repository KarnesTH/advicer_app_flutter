import 'package:advicer/application/advicer/advicer_bloc.dart';
import 'package:advicer/domain/reposetories/advicer_reposetory.dart';
import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:advicer/infrastructure/datasources/advicer_remote_datasources.dart';
import 'package:advicer/infrastructure/repositories/advicer_repository_implementation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.I;

Future<void> init() async {
  //? Blocs
  serviceLocator.registerFactory(() => AdvicerBloc(usecases: serviceLocator()));

  //? Usecases
  serviceLocator.registerLazySingleton(
      () => AdvicerUsecases(advicerReposetory: serviceLocator()));

  //? Repos
  serviceLocator.registerLazySingleton<AdvicerReposetory>(() =>
      AdvicerRepositoryImplementation(
          advicerRemoteDatasource: serviceLocator()));

  //? Datasources
  serviceLocator.registerLazySingleton<AdvicerRemoteDatasource>(
      () => AdvicerRemoteDatasourceImplementation(client: serviceLocator()));

  //? Extern
  serviceLocator.registerLazySingleton(() => http.Client());
}
