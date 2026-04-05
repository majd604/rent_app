import 'package:flutter/material.dart';
import 'package:rent_app/data/model/car_model.dart';
import 'package:rent_app/presentation/pages/maps_detail_page.dart';
import 'package:rent_app/presentation/widgets/car_card.dart';
import 'package:rent_app/presentation/widgets/more_card.dart';

class CarDetailPage extends StatefulWidget {
  const CarDetailPage({super.key, required this.car});
  final CarModel car;

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text(" Information")],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: CarModel(
              model: widget.car.model,
              distance: widget.car.distance,
              fullCapacity: widget.car.fullCapacity,
              pricePerHour: widget.car.pricePerHour,
              imageUrl: widget.car.imageUrl,
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xfff3f3f3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[300],
                          child: Image.asset("assets/user.png"),
                        ),
                        const SizedBox(height: 10),
                        Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold)),

                        Text("\$4.253", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MapsDetailPage(car: widget.car)));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xfff3f3f3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset("assets/maps.png", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: CarModel(
                    model: "${widget.car.model} -1",
                    distance: widget.car.distance + 100,
                    fullCapacity: widget.car.fullCapacity + 100,
                    pricePerHour: widget.car.pricePerHour + 10,
                    imageUrl: widget.car.imageUrl,
                  ),
                ),
                const SizedBox(height: 10),
                MoreCard(
                  car: CarModel(
                    model: "${widget.car.model} -2",
                    distance: widget.car.distance + 200,
                    fullCapacity: widget.car.fullCapacity + 200,
                    pricePerHour: widget.car.pricePerHour + 20,
                    imageUrl: widget.car.imageUrl,
                  ),
                ),
                const SizedBox(height: 10),
                MoreCard(
                  car: CarModel(
                    model: "${widget.car.model} -3",
                    distance: widget.car.distance + 300,
                    fullCapacity: widget.car.fullCapacity + 300,
                    pricePerHour: widget.car.pricePerHour + 30,
                    imageUrl: widget.car.imageUrl,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
