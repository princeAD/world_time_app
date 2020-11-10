import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeapp/services/world_time_api.dart' as world_api;

class Location_loading extends StatefulWidget {
  @override
  _Location_loadingState createState() => _Location_loadingState();
}

class _Location_loadingState extends State<Location_loading> {
  List locations = [];
  Future mai () async{
    await locations.addAll(await world_api.initiate());
    await print(locations.length);
    Navigator.pushReplacementNamed(context, '/location_loading', arguments: {
      'List': locations
    });
  }

  @override
  void initState() {
    super.initState();
    mai();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
              ),
            );
          },
          size: 50.0,
        ),
      ),
    );
  }
}
