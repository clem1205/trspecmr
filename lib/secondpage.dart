import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:trspecmr/widget/device_card.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final DatabaseReference refQuery = FirebaseDatabase.instance.ref('/');

    return MaterialApp(
      home: Scaffold( 
        body: FirebaseAnimatedList(
          query: refQuery,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            if (!snapshot.exists) {
              return const SizedBox(); // Or a loading/error widget if you prefer
            }
            
            final deviceData = snapshot.value as Map<dynamic, dynamic>? ?? {};
            final airQuality = deviceData['airQuality'];
            final airQualityString = airQuality?.toString() ?? 'N/A';

            return DeviceCard(
              deviceName: deviceData['deviceName'] ?? "Device ${index + 1}",
              airQuality: airQualityString,
            );
          },
        ), 
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
