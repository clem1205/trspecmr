import 'package:flutter/material.dart';
import 'package:trspecmr/airquality.dart';

class DeviceCard extends StatelessWidget {
  final String deviceName, airQuality;
  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.airQuality,
  });

Color getColorBasedOnAirQuality(int airQuality) {
  if (airQuality <= 50) {
    return Colors.green;
  } else if (airQuality > 50 && airQuality < 200) {
    return const Color.fromARGB(255, 232, 211, 21);
  } else if (airQuality >= 200 && airQuality < 400){
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
  @override
  Widget build(BuildContext context) {

    String statusText() {
      int airQualityNum = int.parse(airQuality);
      if(airQualityNum <= 50) {
        return "Sehat";
      }
      else if(airQualityNum > 50 && airQualityNum < 200) {
        return "Kurang Sehat";
      }
      else if(airQualityNum >= 200 && airQualityNum < 400) {
        return "Tidak Sehat!";
      }
      else {
        return "Sangat Tidak Sehat!";
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120.0,
        width: 500.0,
        child: Container(
          decoration: BoxDecoration(
            color: getColorBasedOnAirQuality(int.parse(airQuality)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  deviceName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Air Quality: " + airQuality,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Text("Status: ${statusText()}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
