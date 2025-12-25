import '../../domain/entities/property_entity.dart';

class PropertyModel extends PropertyEntity {
  PropertyModel({
    required super.id,
    required super.name,
    required super.location,
    required super.price,
    required super.priceUnit,
    required super.bedrooms,
    required super.bathrooms,
    required super.distance,
    required super.imageUrl,
    required super.type,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      price: json['price'].toDouble(),
      priceUnit: json['priceUnit'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      distance: json['distance'].toDouble(),
      imageUrl: json['imageUrl'],
      type: PropertyType.values.byName(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'price': price,
      'priceUnit': priceUnit,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'distance': distance,
      'imageUrl': imageUrl,
      'type': type.name,
    };
  }
}
