class CarModel {
  final String model;
  final double distance;
  final double fullCapacity;
  final double pricePerHour;
  final String imageUrl;

  CarModel({
    required this.model,
    required this.distance,
    required this.fullCapacity,
    required this.pricePerHour,
    required this.imageUrl,
  });

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      model: map['model'],
      distance: map['distance'],
      fullCapacity: map['fullCapacity'],
      pricePerHour: map['pricePerHour'],
      imageUrl: map['imageUrl'],
    );
  }
}
