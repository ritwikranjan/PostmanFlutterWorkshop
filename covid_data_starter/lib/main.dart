import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Data App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> _list = [
    'Asia',
    'Australia',
    'North America',
    'South America',
    'Africa',
    'Europe'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19 Data'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataNameButton(name: 'Asia'),
          ],
        ),
      ),
    );
  }
}

class DataNameButton extends StatelessWidget {
  const DataNameButton({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.6,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
        ),
        onPressed: () {
          //TODO: 3. Navigate to Next Page and pass the name along with it
        },
        child: Text(name),
      ),
    );
  }
}

class CovidDataPage extends StatefulWidget {
  final String name;

  const CovidDataPage({Key? key, required this.name}) : super(key: key);

  @override
  _CovidDataPageState createState() => _CovidDataPageState();
}

class _CovidDataPageState extends State<CovidDataPage> {
  late Map args;

  @override
  Widget build(BuildContext context) {
    final String name = widget.name;
    //TODO: 4. Implement Future Builder to dynamically build the UI
    return Scaffold(
      appBar: AppBar(
        title: Text(args['continent']),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //TODO 8: Refresh the data
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8.0),
          //TODO: 5. Add a GridView Widget to display the data on this page
          //TODO: 6b. Add Cards inside the GridView to display data
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  const DataCard({
    Key? key,
    required this.dataLabel,
    required this.data,
    this.color = Colors.tealAccent,
  }) : super(key: key);

  final String dataLabel, data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container();
    //TODO: 6a. Implement the Card Design
  }
}
