import 'package:get_it/get_it.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  //Services
  serviceLocator.registerLazySingleton<ShipmentDataRepository>(
      () => ShipmentFirestoreService());
  serviceLocator.registerLazySingleton<ClientDataRepository>(
      () => ClientFirestoreService());
  serviceLocator.registerLazySingleton<SourceDataRepository>(
      () => SourceFirestoreService());
  serviceLocator.registerLazySingleton<MixerDataRepository>(
      () => MixerFirestoreService());

  // Viewmodels
  serviceLocator
      .registerFactory<ShipmentCardViewmodel>(() => ShipmentCardViewmodel());
  //todo:3 register ShipmentItemViewModel
  serviceLocator.registerFactory<ShipmentItemScreenViewmodel>(
      () => ShipmentItemScreenViewmodel());
  serviceLocator.registerFactory<MixersListScreenViewmodel>(
      ()=>MixersListScreenViewmodel());
  serviceLocator.registerFactory<MixerDetailsScreenViewmodel>(
      () => MixerDetailsScreenViewmodel());
  serviceLocator
      .registerFactory<MixerCardViewmodel>(() => MixerCardViewmodel());
}
