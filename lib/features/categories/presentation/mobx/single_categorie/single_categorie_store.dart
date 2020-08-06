import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/services/Service.dart';
import '../../../data/models/service_model.dart';
import '../../../domain/services/get_services_by_category.dart';
import '../../../domain/services/get_user_location_service.dart';

part 'single_categorie_store.g.dart';

enum SortMethod { DEFAULT, DISTANCE, RANKING }

class SingleCategorieStore extends _SingleCategorieStore
    with _$SingleCategorieStore {
  final GetUserLocationService getUserLocationService;
  final GetServicesByCategoryService getServicesByCategoryService;

  SingleCategorieStore(
      {@required this.getUserLocationService,
      @required this.getServicesByCategoryService})
      : super(
          servicesByCategoryService: getServicesByCategoryService,
          userLocationService: getUserLocationService,
        );
}

abstract class _SingleCategorieStore with Store {
  final GetUserLocationService userLocationService;
  final GetServicesByCategoryService servicesByCategoryService;

  _SingleCategorieStore({
    @required this.userLocationService,
    @required this.servicesByCategoryService,
  });

  @observable
  StatusPage statusPage = StatusPage.NORMAL;

  @observable
  ObservableList<ServiceModel> services = ObservableList.of([]);

  String categoryId = '';

  SortMethod sortMethod = SortMethod.DEFAULT;

  @action
  Future<void> fetchData() async {
    statusPage = StatusPage.SEARCHING;

    await _fetchServicesByCategoryId();

    if (statusPage != StatusPage.ERROR) {
      statusPage = StatusPage.NORMAL;
    }
  }

  Future<void> _fetchServicesByCategoryId() async {
    final positionOrFailure = await userLocationService.exec(NoParams());
    Position position;

    positionOrFailure.fold(
      (l) => print('error'),
      (userPosition) => position = userPosition,
    );

    if (position == null) {
      return;
    }

    final params = GeoCategoryParams(
      distance: 10000,
      latitude: position.latitude,
      longitude: position.longitude,
      categoryId: categoryId,
      orderBy: sortMethod.toString()
    );

    final servicesOrFailure = await servicesByCategoryService.exec(params);

    servicesOrFailure.fold((l) {
      statusPage = StatusPage.ERROR;
    }, (nearServices) {
      services.clear();
      services.addAll(nearServices.services);
    });
  }
}
