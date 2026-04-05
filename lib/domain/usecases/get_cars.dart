import 'package:rent_app/data/model/car_model.dart';
import 'package:rent_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<CarModel>> call() async {
    return await repository.fetchCars();
  }
}
