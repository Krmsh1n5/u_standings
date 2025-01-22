import 'package:get_it/get_it.dart';
import 'package:u_standings/features/standings/data/datasources/api_service.dart';
import 'package:u_standings/features/standings/data/repositories/cohort_semester_repository_impl.dart';
import 'package:u_standings/features/standings/data/repositories/credits_repository_impl.dart';
import 'package:u_standings/features/standings/data/repositories/standings_repository_impl.dart';
import 'package:u_standings/features/standings/domain/repositories/cohort_semester_repository.dart';
import 'package:u_standings/features/standings/domain/repositories/credits_repository.dart';
import 'package:u_standings/features/standings/domain/repositories/standings_repository.dart';
import 'package:u_standings/features/standings/domain/usecases/get_known_cohort_semester.dart';
import 'package:u_standings/features/standings/domain/usecases/get_known_credits.dart';
import 'package:u_standings/features/standings/domain/usecases/get_standings.dart';
import 'package:u_standings/features/standings/domain/usecases/get_total_cohort_semester_credits.dart';
import 'package:u_standings/features/standings/presentation/providers/calculator_notifier.dart';
import 'package:u_standings/features/standings/presentation/providers/standings_notifier.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() {
  // API
   serviceLocator.registerFactory(() => UStandingsApi());

  // Repositories
  serviceLocator.registerLazySingleton<StandingsRepository>(() => StandingsRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<CohortSemesterRepository>(() => CohortSemesterRepositoryImpl());
  serviceLocator.registerLazySingleton<GetCreditsRepository>(() => GetCreditsRepositoryImpl());

  // Use Cases
  serviceLocator.registerLazySingleton(() => GetStandingsUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetKnownCohortSemesterUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetKnownCreditsUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetTotalCohortSemesterCreditsUseCase(serviceLocator()));

  // Providers
  serviceLocator.registerFactory(() => CalculatorProvider());

  serviceLocator.registerFactory(() => StandingsNotifier(
      getStandingsUseCase: serviceLocator(),
      getKnownCohortSemesterUseCase: serviceLocator(),
      getKnownCreditsUseCase: serviceLocator(),
      getTotalCohortSemesterCreditsUseCase: serviceLocator(),
    ));
}