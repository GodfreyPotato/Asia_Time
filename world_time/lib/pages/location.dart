import 'package:flutter/material.dart';
import 'package:world_time/services/time_api_call.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {

  List<WorldTime> location = [
    WorldTime(capital: 'Jerusalem'),
    WorldTime(capital: 'Tokyo'),
    WorldTime(capital: 'Kabul'),
    WorldTime(capital: 'Bangkok'),
    WorldTime(capital: 'Seoul'),
    WorldTime(capital: 'Manila'),
    WorldTime(capital: 'Beirut'),
    WorldTime(capital: 'Dhaka'),
    WorldTime(capital: 'Colombo'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your Capital'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 3),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                  onTap: () async{

                    await location[index].getTime();

                    Navigator.pushNamed(context,'/home',arguments: {
                      'time': location[index].time,
                      'capital': location[index].capital,
                      'scene': location[index].scene,
                    });
                  },
                  title: Text(location[index].capital),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 145, 143, 143),
    );
  }
}