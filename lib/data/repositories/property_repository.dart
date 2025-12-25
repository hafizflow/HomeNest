import '../models/property_model.dart';
import '../../domain/entities/property_entity.dart';

class PropertyRepository {
  Future<List<PropertyModel>> getProperties() async {
    // Simulating API call with dummy data
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      PropertyModel(
        id: '1',
        name: 'Dreamsville House',
        location: 'Jl. Sultan Iskandar Muda',
        price: 2500000000,
        priceUnit: 'Year',
        bedrooms: 6,
        bathrooms: 4,
        distance: 1.8,
        imageUrl:
            'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800',
        type: PropertyType.house,
      ),
      PropertyModel(
        id: '2',
        name: 'Ascot House',
        location: 'Jl. Cilandak Tendean',
        price: 3000000000,
        priceUnit: 'Year',
        bedrooms: 5,
        bathrooms: 3,
        distance: 2.5,
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800',
        type: PropertyType.house,
      ),
      PropertyModel(
        id: '3',
        name: 'Dreamsville House',
        location: 'Jl. Sultan Iskandar Muda',
        price: 2500000000,
        priceUnit: 'Year',
        bedrooms: 6,
        bathrooms: 4,
        distance: 1.8,
        imageUrl:
            'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800',
        type: PropertyType.apartment,
      ),
      PropertyModel(
        id: '4',
        name: 'Ascot House',
        location: 'Jl. Cilandak Tendean',
        price: 3000000000,
        priceUnit: 'Year',
        bedrooms: 5,
        bathrooms: 3,
        distance: 2.5,
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800',
        type: PropertyType.hotel,
      ),
      PropertyModel(
        id: '5',
        name: 'Orchad House',
        location: 'Jl. Sultan Iskandar Muda',
        price: 2500000000,
        priceUnit: 'Year',
        bedrooms: 6,
        bathrooms: 4,
        distance: 3.0,
        imageUrl:
            'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=800',
        type: PropertyType.house,
      ),
      PropertyModel(
        id: '6',
        name: 'The Hollies House',
        location: 'Jl. Sultan Iskandar Muda',
        price: 2000000000,
        priceUnit: 'Year',
        bedrooms: 5,
        bathrooms: 2,
        distance: 4.2,
        imageUrl:
            'https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?w=800',
        type: PropertyType.house,
      ),
    ];
  }

  Future<List<PropertyModel>> getPropertiesByType(PropertyType type) async {
    final properties = await getProperties();
    return properties.where((p) => p.type == type).toList();
  }
}
