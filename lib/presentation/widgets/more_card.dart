import 'package:flutter/material.dart';
import 'package:rent_app/data/model/car_model.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff212020),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16),
                  const SizedBox(width: 5),
                  Text("> ${car.distance} km", style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(width: 10),
                  Icon(Icons.battery_charging_full_rounded, color: Colors.white, size: 16),
                  const SizedBox(width: 5),
                  Text(
                    car.fullCapacity.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
