import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String capital;
  late String time;
  String? scene;


  WorldTime({required this.capital});

  Future <void> getTime() async{
    try{
      Response res = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/$capital'));
      Map data = jsonDecode(res.body);

      DateTime now = DateTime.parse(data['utc_datetime']);
      now = now.add(Duration(hours: int.parse(data['utc_offset'].substring(2,3))));

      time = DateFormat.jm().format(now);

      if(now.hour>5&&now.hour<=12){
        scene = 'day.jpeg';
      }
      else if(now.hour>12&&now.hour<=17){
        scene = 'noon.jpg';
      }
      else{
        scene = 'night.jpeg';
      }

    }catch(e){
      time = '$e';
    }
    

  }


}