// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time/services/time_api_call.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

late String loadTime;
class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  void updateTime() async{
    WorldTime info = WorldTime(capital: 'Asia/Manila');
    await info.getTime();
    loadTime = info.time;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': info.time, 'capital': info.capital,'scene': info.scene,
    });
  }
  

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitChasingDots(
        color: Colors.green,
        size:90,
      ),),
    );
  }
}

