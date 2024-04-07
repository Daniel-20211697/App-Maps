import 'dart:async';
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapSample extends StatefulWidget {
  MapSample({super.key, this.latitud, this.longitud, this.nombre, this.apellido});
  double? latitud;
  double? longitud;
  String? nombre;
  String? apellido;

  @override
  State<MapSample> createState() => MapSampleState(nombre: nombre, apellido: apellido);
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

    String? nombre;
    String? apellido;
    String city = '';
    MapSampleState({this.nombre, this.apellido});


    @override
    void initState(){
      super.initState();
      getCity();
    }


  //Método para que nos de la posición inicial de la camara

  CameraPosition getCameraPosition(){
    return CameraPosition(
      target: LatLng(this.widget.latitud ?? 0.0, this.widget.longitud ?? 0),
    zoom: 19.151926040649414);
    
  }

  Set<Marker>getMarker(){
    return<Marker>{
      Marker(
        markerId: MarkerId('first-marker'),
        position: LatLng(this.widget.latitud ?? 0.0, this.widget.longitud ?? 0),
        infoWindow: InfoWindow(title:"$nombre $apellido", snippet: city)
      ),
    };
  }

  //Para la ciudad necesitamos el siguiente método

  Future<void> getCity() async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      this.widget.latitud??0.0, this.widget.longitud??0
    );
    if (placemarks.isEmpty) {
      final Placemark placemark = placemarks.first;

      setState(() {
        city = placemark.locality ?? placemark.country ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: getCameraPosition(),//El que estaba aquí lo cambiamos por CamaraPosition
        markers: getMarker(),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

}