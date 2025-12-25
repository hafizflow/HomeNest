import '../../data/repositories/property_repository.dart';
import '../entities/property_entity.dart';

class GetPropertiesUseCase {
  final PropertyRepository repository;

  GetPropertiesUseCase(this.repository);

  Future<List<PropertyEntity>> execute() async {
    return await repository.getProperties();
  }

  Future<List<PropertyEntity>> executeByType(PropertyType type) async {
    return await repository.getPropertiesByType(type);
  }
}
