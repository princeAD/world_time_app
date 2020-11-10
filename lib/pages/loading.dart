import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data;
  String time= 'loading';
  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(location: data['Location'], flag: data['flag'], url: data['Url']);
    await instance.getData();
    int h = (instance.timeofDay ~/4).toInt();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'Location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'timeofday': h
    });

  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    setupWorldTime();
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