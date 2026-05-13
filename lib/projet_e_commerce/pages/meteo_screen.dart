import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart';

class MeteoScreen extends StatefulWidget {
  @override
  _MeteoScreenState createState() => _MeteoScreenState();
}

class _MeteoScreenState extends State<MeteoScreen> {
  String temp = "";
  bool isLoading = false;
  int meteoCode = -1;

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getInfoMeteo() async {
    String baseUrl = "";

    double laltitude = 73.80340423492237;
    double longitude = 105.60864830939019;

    setState(() {
      isLoading = true;
    });
    //posiiotn actuelle reelle
    Position pos = await getPosition();
    // if (pos != null) {
    //   laltitude = pos.latitude;
    //   longitude = pos.longitude;
    // }

    baseUrl =
        "https://api.open-meteo.com/v1/forecast?latitude=$laltitude&longitude=$longitude&current_weather=true";
    Uri endPoint = Uri.parse(baseUrl);
    try {
      //appel : method GET
      dynamic resulat = await http.get(endPoint);
      if (resulat.statusCode == 200) {
        final response = jsonDecode(resulat.body);
        setState(() {
          temp =
              response['current_weather']['temperature'].toString() +
              response['current_weather_units']['temperature'].toString();
          meteoCode = response['current_weather']['weathercode'];
          print(meteoCode);
        });

        //print(response);
      }
    } catch (e) {
      print("Exception détectée:$e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getInfoMeteo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info de Méteo..."),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 162, 249, 139), Color(0xFF00f2fe)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),

              const Text(
                "//NOM VILLE TODO",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "//DATE TODO",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),
              Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.blue)
                    : Column(
                        children: [
                          BoxedIcon(WeatherIcons.moon_alt_waning_gibbous_3),
                          BoxedIcon(
                            WeatherIcons.fromString(
                              meteoCode.toString(),
                              // Fallback is optional, throws if not found, and not supplied.
                              fallback: WeatherIcons.na,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            temp,
                            style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "//ETAT METEROLOGIQUE",
                            style: const TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.5,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              ),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: () {
                    getInfoMeteo();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "ACTUALISER",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
