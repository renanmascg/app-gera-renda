import 'package:get_it/get_it.dart';

import 'core/network/custom_dio.dart';
import 'features/categories/data/datasources/categories_remote_datasource.dart';
import 'features/categories/data/repositories/categories_repository_impl.dart';
import 'features/categories/domain/repository/categories_repository.dart';
import 'features/categories/domain/services/get_all_categories_service.dart';
import 'features/categories/domain/services/get_near_services_service.dart';
import 'features/categories/domain/services/get_service_full_info_service.dart';
import 'features/categories/domain/services/get_services_by_category.dart';
import 'features/categories/domain/services/get_user_location_service.dart';
import 'features/categories/presentation/mobx/categories/categories_store.dart';
import 'features/categories/presentation/mobx/single_categorie/single_categorie_store.dart';
import 'features/categories/presentation/mobx/single_service/single_service_store.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  // Register MOBX
  serviceLocator.registerLazySingleton(
    () => CategoriesStore(
      getAllCategoriesService: serviceLocator(),
      getUserLocationService: serviceLocator(),
      getNearServicesService: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(() => SingleCategorieStore(
      getUserLocationService: serviceLocator(),
      getServicesByCategoryService: serviceLocator()));

  serviceLocator.registerLazySingleton(
    () => SingleServiceStore(
        getServiceFullInfoService: serviceLocator(),
        getUserLocationService: serviceLocator()),
  );

  // Services
  serviceLocator.registerLazySingleton(
      () => GetAllCategoriesService(repository: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => GetNearServicesService(repository: serviceLocator()));

  serviceLocator.registerLazySingleton(() => GetUserLocationService());

  serviceLocator.registerLazySingleton(
      () => GetServicesByCategoryService(repository: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => GetServiceFullInfoService(repository: serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(remoteDatasource: serviceLocator()));

  // Datasources
  serviceLocator.registerLazySingleton<CategoriesRemoteDatasource>(
      () => CategorioesRemoteDatasourceImpl(customDio: serviceLocator()));

  // Core
  serviceLocator.registerLazySingleton(() => CustomDio());
}
