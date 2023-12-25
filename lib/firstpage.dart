import 'package:flutter/material.dart';
import 'package:trspecmr/airquality.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);
  static String routeName = '/firstpage';
  AirQuality airQuality = AirQuality();

  @override
  State<FirstPage> createState() => _FirstPageState();
}

    
class _FirstPageState extends State<FirstPage> {
  int airQualitydata = 0;
  AirQuality airQuality = AirQuality();
  @override
  void initState() {
    _getAirQualityData();
    super.initState();
  }
  String statusText() {
      if(airQualitydata <= 50) {
        return "Sehat";
      }
      else if(airQualitydata > 50 && airQualitydata < 200) {
        return "Kurang Sehat";
      }
      else if(airQualitydata >= 200 && airQualitydata < 400) {
        return "Tidak Sehat!";
      }
      else {
        return "Sangat Tidak Sehat!";
      }
    }
  
  Color getColorBasedOnAirQuality(int airQualitydata) {
  if (airQualitydata <= 50) {
    return Colors.green;
  } else if (airQualitydata > 50 && airQualitydata < 200) {
    return Colors.yellow;
  } else if (airQualitydata >= 200 && airQualitydata < 400){
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: getColorBasedOnAirQuality(airQualitydata),
            borderRadius: BorderRadius.circular(20.0), // Set border radius here
          ),
          child: SizedBox(
            height: 600,
            width: 450,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text("Average Air Quality",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0), // Set border radius here
                    ),
                    child:const SizedBox(
                      height: 150,
                    ),
                  ),
                  Container(
                    child: Text('$airQualitydata',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 150.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0), // Set border radius here
                    ),
                    child:const SizedBox(
                      height: 5,
                    ),
                  ),
                  Container(
                    child: Text('${statusText()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0), // Set border radius here
                    ),
                    child:SizedBox(
                      height: 125,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: getColorBasedOnAirQuality(airQualitydata), primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                            onPressed: _getAirQualityData,
                            child: const Text('Refresh')
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ) 
    );
  }



  //create a function to get airqualitydata
  void _getAirQualityData() async {
    final airQualityDataReceived = await airQuality.airQuality();
    setState(() {
      airQualitydata = airQualityDataReceived;
    });
  }


}