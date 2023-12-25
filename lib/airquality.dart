import 'package:firebase_database/firebase_database.dart';

class AirQuality {
  
Future<int> calculateTotalAirQuality() async {
  DatabaseReference refQuery = FirebaseDatabase.instance.ref('/');
  DatabaseEvent event = await refQuery.once();

  Map<String, dynamic> datas = event.snapshot.value as Map<String, dynamic>;
  double total = 0;

  datas.forEach((key, value) {
    total += (value['airQuality'] /5 as double);
  });
  return total.toInt();
}
  Future <int> airQuality() async {
      int totalAirQuality = 0; 
      totalAirQuality =  await calculateTotalAirQuality();
      print('Average air quality: $totalAirQuality');
      return totalAirQuality;
    }
}