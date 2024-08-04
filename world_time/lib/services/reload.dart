import 'dart:async';

import 'package:world_time/services/time_api_call.dart';

String loc = "Asia/Manila";
late String ttime;

void main(){
  reload r = reload();
  r.refresh();
}


class reload{

  void refresh()async{
    Timer.periodic(Duration(seconds: 2),(Timer t )async{
      WorldTime reset = WorldTime(capital: loc);
      await reset.getTime();
      ttime = reset.time;
      print(ttime);
    });

  }

}