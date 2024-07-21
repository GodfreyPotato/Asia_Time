// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data = {};
  late String scene;
  @override
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context)!.settings.arguments as Map;
    scene = data['scene'];

    return Scaffold(
        backgroundColor: Colors.amber,
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
                Text('${data['time']}',
                  style: TextStyle(fontSize: 60, color: Color.fromARGB(255, 255, 255, 255)),

                ),
                SizedBox(height: 20,),
                Text('${data['capital']}',style: TextStyle(color: const Color.fromARGB(255, 243, 243, 243),fontSize: 40),),
                SizedBox(height: 40,),
                ElevatedButton.icon(onPressed: (){
                  Navigator.pushNamed(context, '/location');
                }, label: Text('Edit Location'),),
                
              ],),
            ),
          ),
        ),
    );
  }
}