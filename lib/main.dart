import 'package:flutter/material.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime;
  // var myFormat = DateFormat('d-MM-yyyy');
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay picked;
  TimeOfDay timePicked;

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(context: context, initialTime: time);
    setState(() {
      time = picked;
      print(time);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                dateTime == null
                    ? 'Nothing has not picked yet'
                    : '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                style: TextStyle(
                  fontSize: 21.0,
                ),
              ),
              RaisedButton(
                child: Text('Pick a date'),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2222),
                  ).then((date) {
                    setState(() {
                      dateTime = date;
                    });
                  });
                },
              ),
              Text(timePicked == null ? 'Not picked Yet' : '${timePicked.hour} : ${timePicked.minute}' ),
              IconButton(
                icon: Icon(Icons.alarm),
                onPressed: () {
                  showTimePicker(context: context, initialTime: time)
                      .then((time) {
                    setState(() {
                      timePicked = time;
                    });
                  });
                },
              )
              // IconButton(icon: Icon(Icons.alarm), onPressed: (){
              //   selectTime(context);
              //   print(time);
              // })
            ],
          ),
        ),
      ),
    );
  }
}
