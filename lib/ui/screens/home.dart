import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/data/models/weather_api_response.dart';
import 'package:weather/network/weather_api.dart';
import 'package:weather/ui/widgets/eachDayWeather.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController cityName = TextEditingController();
  String currentCity = 'Mansoura';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherApiResponse>(
        future: WeatherAPI().getAPIData(currentCity),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Scaffold(
              body: Stack(
                fit: StackFit.loose,
                children: [
                  Positioned.fill(
                    child: Image.asset('assets/images/stars.jpg',
                    fit: BoxFit.fill,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50,),
                          TextFormField(
                            controller: cityName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search,
                                    size: 30, color: Colors.white),
                                onPressed: () {
                                  currentCity = cityName.text;
                                  setState(() {

                                  });
                                },
                              ),
                              hintText: "Enter your City",
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(snapshot.data!.city.name, style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.normal
                              ),),
                              const SizedBox(width: 50,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    "https://openweathermap.org/img/wn/${snapshot.data!.list[0].weather.first.icon}@2x.png",
                                  ),
                                  Text(snapshot.data!.list[0].weather[0].description.toString(),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 50,),
                          Text('${(snapshot.data!.list[0].main.temp - 273.15).round()}\u2103', style: const TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.normal
                          ),),
                          Text(
                            DateFormat()
                                .add_MMMMEEEEd()
                                .format(DateTime.now()),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text('Min: ${(snapshot.data!.list[0].main.temp_min - 273.15).round()}\u2103 , Max: ${(snapshot.data!.list[0].main.temp_max - 273.15).round()}\u2103', style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(
                            "Wind: ${snapshot.data!.list[0].wind.speed.toString()}",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 150,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                EachDayWeather(
                                    day: snapshot.data!.list[0].dt_txt.toString(),
                                    icon: snapshot.data!.list[0].weather.first.icon,
                                    temp: snapshot.data!.list[0].main.temp,
                                  description: snapshot.data!.list[0].weather.first.description.toString()
                                  ,),
                                const SizedBox(width: 11,),
                                EachDayWeather(
                                    day: snapshot.data!.list[8].dt_txt.toString(),
                                    icon: snapshot.data!.list[8].weather.first.icon,
                                    temp: snapshot.data!.list[8].main.temp,
                                    description: snapshot.data!.list[8].weather.first.description.toString()
                                ),
                                const SizedBox(width: 11,),
                                EachDayWeather(
                                    day: snapshot.data!.list[16].dt_txt.toString(),
                                    icon: snapshot.data!.list[16].weather.first.icon,
                                    temp: snapshot.data!.list[16].main.temp,
                                    description: snapshot.data!.list[16].weather.first.description.toString()
                                ),
                                const SizedBox(width: 11,),
                                EachDayWeather(
                                    day: snapshot.data!.list[24].dt_txt.toString(),
                                    icon: snapshot.data!.list[24].weather.first.icon,
                                    temp: snapshot.data!.list[24].main.temp,
                                    description: snapshot.data!.list[24].weather.first.description.toString()
                                ),
                                const SizedBox(width: 11,),
                                EachDayWeather(
                                    day: snapshot.data!.list[32].dt_txt.toString(),
                                    icon: snapshot.data!.list[32].weather.first.icon,
                                    temp: snapshot.data!.list[32].main.temp,
                                    description: snapshot.data!.list[32].weather.first.description.toString()
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          else {
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: SizedBox(
                  height: 100, width: 100,
                  child: CircularProgressIndicator(
                    color: Colors.orangeAccent,
                  ),
                ),
              ) ,
            );
          }
        },
      ),
    );
  }
}