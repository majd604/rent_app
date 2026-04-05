import 'package:flutter/material.dart';
import 'package:rent_app/data/model/car_model.dart';
import 'package:rent_app/presentation/pages/car_detail_page.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap event
        Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailPage(car: car)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff3f3f3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)],
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(car.imageUrl, height: 180),
            Text(car.model, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Image.asset('assets/gps.png', height: 16),
                        Text('${car.distance.toStringAsFixed(1)} Km'),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Image.asset('assets/pump.png', height: 16),
                        Text('${car.fullCapacity.toStringAsFixed(1)} L'),
                      ],
                    ),
                  ],
                ),
                Text(
                  "\$${car.pricePerHour.toStringAsFixed(2)}/h",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
