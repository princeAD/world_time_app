import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List locations = [];
  Map data ;
  List<Color> _colors = [Colors.blueAccent, Colors.blueGrey];
  List<double> _stops = [0.0, 0.9];


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    locations = data['List'];
    return Scaffold(

      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Choose Location',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          )
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _colors,
                    stops: _stops,

                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/location', arguments: {
                      'Location': locations[index].location,
                      'Url': locations[index].url,
                      'flag': locations[index].flag
                    });
                  },
                  title: Text(
                    locations[index].location,
                    style: TextStyle(
                      color: Colors.white,
                    ),

                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(locations[index].flag),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
