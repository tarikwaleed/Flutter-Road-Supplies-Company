import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

abstract class SourceDataRepository {
  factory SourceDataRepository() => SourceFirestoreService();

  Future<List<Source>> retrieveSources();

  void addSource(dynamic source);
}
