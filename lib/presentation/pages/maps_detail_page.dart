// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rent_app/data/model/car_model.dart';

class MapsDetailPage extends StatelessWidget {
  const MapsDetailPage({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
      ),

      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(initialCenter: LatLng(51, -0.09), initialZoom: 13),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.example.rent_app',
              ),
            ],
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: carDetailCard(car)),
        ],
      ),
    );
  }
}

Widget carDetailCard(CarModel car) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 0)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "${car.model}",
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text("${car.distance} km", style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(width: 10),
                  Text("${car.fullCapacity.toString()} ", style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(width: 10),
                  Icon(Icons.battery_charging_full_rounded, color: Colors.white, size: 16),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,

          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 0)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Feature", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                featureIcons(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${car.pricePerHour}/day", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {},
                      child: Text(
                        "Book Now",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Positioned(top: 50, right: 20, child: Image.asset('assets/white_car.png')),
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, "Diesel", "Commmon Rail "),
      featureIcon(Icons.speed, "Acceleration", "0-100 km/s"),
      featureIcon(Icons.ac_unit, "Cold", "Temp Control"),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subTitle) {
  return Container(
    height: 100,
    width: 100,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Column(
      children: [
        Icon(icon, size: 28),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          subTitle,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    ),
  );
}
