//Daniel Baez 2021-1697
import 'package:flutter/material.dart';
import 'package:tarea_9_10_entregable/maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController nombreCrontroller = TextEditingController();
  TextEditingController apellidoCrontroller = TextEditingController();
  TextEditingController latitudCrontroller = TextEditingController();
  TextEditingController longitudCrontroller = TextEditingController();
  bool showMap = false;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
    
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 0,left: 12,right: 12,top: 12),
          child: TextField(
            controller: nombreCrontroller,
            decoration: InputDecoration(
              hintText: 'Nombre',
              border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 0,left: 12,right: 12,top: 12),
          child: TextField(
            controller: apellidoCrontroller,
            decoration: InputDecoration(
              hintText: 'Apellido',
              border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 0,left: 12,right: 12,top: 12),
          child: TextField(
            controller: latitudCrontroller,
            decoration: InputDecoration(
              hintText: 'Latitud',
              border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 0,left: 12,right: 12,top: 12),
          child: TextField(
            controller: longitudCrontroller,
            decoration: InputDecoration(
              hintText: 'Longitud',
              border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          ),
          SizedBox(height: 20,),
          FilledButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) => 
            MapSample(latitud: double.parse(latitudCrontroller.text),
            longitud: double.parse(longitudCrontroller.text),
            nombre: nombreCrontroller.text,
            apellido: apellidoCrontroller.text,)));
          }, child: Text('Siguiente'))
        ],
      )
    );
  }
}
//Daniel Baez 2021-1697