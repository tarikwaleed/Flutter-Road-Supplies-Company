import 'package:get_it/get_it.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  //Service
  serviceLocator.registerLazySingleton<ShipmentDataRepository>(
      () => ShipmentFirestoreService());
  serviceLocator.registerLazySingleton<ClientDataRepository>(
      () => ClientFirestoreService());
  serviceLocator.registerLazySingleton<SourceDataRepository>(
      () => SourceFirestoreService());
  serviceLocator.registerLazySingleton<MixerDataRepository>(
      () => MixerFirestoreService());

  // ViewModels
  serviceLocator
      .registerFactory<ShipmentCardViewmodel>(() => ShipmentCardViewmodel());
  //todo:3 register ShipmentItemViewModel
}
