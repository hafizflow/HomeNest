class PropertyEntity {
  final String id;
  final String name;
  final String location;
  final double price;
  final String priceUnit;
  final int bedrooms;
  final int bathrooms;
  final double distance;
  final String imageUrl;
  final PropertyType type;

  PropertyEntity({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.priceUnit,
    required this.bedrooms,
    required this.bathrooms,
    required this.distance,
    required this.imageUrl,
    required this.type,
  });
}

enum PropertyType { house, apartment, hotel, villa, cottage }
