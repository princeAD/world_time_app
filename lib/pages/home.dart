import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};
  String bgimage;
  @override
  Widget build(BuildContext context) {
    data= ModalRoute.of(context).settings.arguments;
    bgimage = 'image' + data['timeofday'].toString() + '.jpg';
    Color bgcolor = data['timeofday'] > 2 ? Colors.blue[900] : Colors.yellow[900];
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: data['timeofday']>2?Colors.white : Colors.grey[800],
                    ),
                    label: Text(
                      ' EDIT LOCATION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: Colors.black,// set border color
                                width: 2.0),   // set border width
                            borderRadius: BorderRadius.all(
                                Radius.circular(4.0)), // set rounded corner radius
                          ),
                          child: Text(
                              data['Location'],
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                letterSpacing: 2,
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black,// set border color
                                  width: 2.0),   // set border width
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0)), // set rounded corner radius
                          ),
                          child: Text(
                              data['time'],
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              letterSpacing: 2,
                            )
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}
