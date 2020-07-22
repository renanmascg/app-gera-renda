import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/services/Service.dart';
import '../../../data/models/service_full_info/service_full_info_model.dart';
import '../../../domain/services/get_service_full_info_service.dart';
import '../../../domain/services/get_user_location_service.dart';

part 'single_service_store.g.dart';

class SingleServiceStore extends _SingleServiceStore with _$SingleServiceStore {
  final GetUserLocationService getUserLocationService;
  final GetServiceFullInfoService getServiceFullInfoService;

  SingleServiceStore(
      {@required this.getUserLocationService,
      @required this.getServiceFullInfoService})
      : super(
          serviceFullInfoService: getServiceFullInfoService,
          userLocationService: getUserLocationService,
        );
}

abstract class _SingleServiceStore with Store {
  final GetUserLocationService userLocationService;
  final GetServiceFullInfoService serviceFullInfoService;

  _SingleServiceStore({
    @required this.userLocationService,
    @required this.serviceFullInfoService,
  });

  @observable
  StatusPage statusPage = StatusPage.NORMAL;

  @observable
  ServiceFullInfo serviceFullInfo;

  @action
  Future<void> fetchData(String id) async {
    statusPage = StatusPage.SEARCHING;

    await _fetchServiceFullInfo(id);

    if (statusPage != StatusPage.ERROR) {
      statusPage = StatusPage.NORMAL;
    }
  }

  Future<void> _fetchServiceFullInfo(String id) async {
    final positionOrFailure = await userLocationService.exec(NoParams());
    Position position;

    positionOrFailure.fold(
      (l) => print('error'),
      (userPosition) => position = userPosition,
    );

    if (position == null) {
      return;
    }

    final params = GeoIdParams(
      latitude: position.latitude,
      longitude: position.longitude,
      id: id,
    );

    final servicesOrFailure = await serviceFullInfoService.exec(params);

    servicesOrFailure.fold((l) {
      statusPage = StatusPage.ERROR;
    }, (service) {
      serviceFullInfo = service;
    });
  }
}
