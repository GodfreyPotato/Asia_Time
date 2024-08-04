import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String capital;
  late String time;
  late String scene = "";
  late int timeScene;
  late DateTime dtNow;
  WorldTime({required this.capital});

  Future <void> getTime() async{
    try{
      Response res = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$capital'));
      Map data = jsonDecode(res.body);

      DateTime now = DateTime.parse(data['utc_datetime']);
      
      now = now.add(Duration(hours: int.parse(data['utc_offset'].substring(2,3))));
      dtNow = now;

      time = DateFormat.jm().format(now);
      timeScene = now.hour;
      getScene();
    }catch(e){
      time = '$e';
    }
    

  }

  void getScene(){
      if(timeScene>5&&timeScene<=12){
        scene = 'day.jpeg';
      }
      else if(timeScene>12&&timeScene<=17){
        scene = 'noon.jpg';
      }
      else{
        scene = 'night.jpeg';
      }
  }

}