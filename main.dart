import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loadshedding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Loadshedding'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapController mapController = MapController(
    initPosition:
        GeoPoint(latitude: 27.615979267279837, longitude: 84.51982317790957),
    areaLimit: const BoundingBox.world(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 500));
      await mapController.drawCircle(
        CircleOSM(
          //Create a Cirlce in the Map.
          key: "circle0",
          centerPoint: GeoPoint(latitude: 27.68333, longitude: 84.43333),
          radius: 2500.0,
          color: Colors.green,
          strokeWidth: 1.5,
        ),
      );
      await mapController.drawCircle(
        CircleOSM(
          key: "circle1",
          centerPoint: GeoPoint(
              latitude: 27.69322309368159, longitude: 84.41716432571411),
          radius: 200.0,
          color: Colors.red,
          strokeWidth: 1.0,
        ),
      );
      await mapController.drawCircle(
        CircleOSM(
          key: "circle1",
          centerPoint: GeoPoint(
              latitude: 27.693227843597928, longitude: 84.42577958106996),
          radius: 250.0,
          color: Colors.red,
          strokeWidth: 1.0,
        ),
      );
      await mapController.drawCircle(
        CircleOSM(
          key: "circle1",
          centerPoint: GeoPoint(
              latitude: 27.667869846790882, longitude: 84.42426681518556),
          radius: 300.0,
          color: Colors.red,
          strokeWidth: 1.0,
        ),
      );
      await mapController.drawCircle(
        CircleOSM(
          key: "circle1",
          centerPoint: GeoPoint(
              latitude: 27.675471213012955, longitude: 84.44615364074707),
          radius: 300.0,
          color: Colors.red,
          strokeWidth: 1.0,
        ),
      );

      await mapController.drawCircle(
        CircleOSM(
          key: "circle1",
          centerPoint: GeoPoint(
              latitude: 27.615979267279837, longitude: 84.51982317790957),
          radius: 200.0,
          color: Colors.green,
          strokeWidth: 1.0,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          OSMFlutter(
            controller: mapController,
            initZoom: 15,
            stepZoom: 1.0,
            userLocationMarker: UserLocationMaker(
              personMarker: const MarkerIcon(
                icon: Icon(
                  Icons.location_history_rounded,
                  color: Colors.red,
                  size: 48,
                ),
              ),
              directionArrowMarker: const MarkerIcon(
                icon: Icon(
                  Icons.double_arrow,
                  size: 48,
                ),
              ),
            ),
            markerOption: MarkerOption(
                defaultMarker: const MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Colors.blue,
                size: 56,
              ),
            )),
          )
        ],
      ),
    );
  }
}
