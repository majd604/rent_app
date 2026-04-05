import 'package:rent_app/data/model/car_model.dart';

abstract class CarRepository {
  Future<List<CarModel>> fetchCars();
}
