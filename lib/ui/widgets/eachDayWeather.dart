import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EachDayWeather extends StatelessWidget {
  EachDayWeather({super.key, required this.day,required this.icon, required this.temp, required this.description});

  late String day;
  late String icon;
  late String description;
  late double temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.blueGrey)
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(DateFormat.E().format(DateTime.parse(day)), style: const TextStyle(
              color: Colors.white,
              fontSize: 17),),
          const SizedBox(height: 10,),
          Image.network(
            "https://openweathermap.org/img/wn/$icon@2x.png"
          ),
          SizedBox(
            width: 100,
            height: 45,
            child: Center(
              child: Text(description,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text('${(temp - 273.15).round()}\u2103', style: const TextStyle(
              color: Colors.white,
              fontSize: 17)),
        ],
      ),
    );
  }
}
