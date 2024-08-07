// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:world_time/services/time_api_call.dart';
import 'package:intl/intl.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data = {};
  late String scene;
  late String homeTime="";
  late String capitalURL;

  Timer? t; 
  void refresh() async{
    WorldTime info = WorldTime(capital:capitalURL);
    await info.getTime();
    setState(() {
      homeTime = info.time;
    });
    DateTime now = info.dtNow;
    t = Timer.periodic(Duration(seconds: 1), (t){
      now = now.add(Duration(seconds: 1));
      setState(() {
        homeTime = DateFormat.jm().format(now);
      });
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
    data = ModalRoute.of(context)!.settings.arguments as Map;
      capitalURL = data['capital'];
      scene = data['scene'];
      refresh();
    });
  super.initState();
  }


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    scene = data['scene'];
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$scene',),
              fit: BoxFit.cover
              
              ),
            
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(homeTime,
                  style: TextStyle(fontSize: 60, color: Color.fromARGB(255, 255, 255, 255)),

                ),
                SizedBox(height: 20,),
                Text('${data['capital'].split('/')[1]}',
                  style: TextStyle(color: const Color.fromARGB(255, 243, 243, 243),
                  fontSize: 40),),
                SizedBox(height: 40,),
                ElevatedButton.icon(onPressed: (){
                  Navigator.pushReplacementNamed(context, '/location');
                  t?.cancel();
                }, label: Text('Change Location'),),
                
              ],),
            ),
          ),
        ),
    );
  }
}