import 'package:covid_data/api.dart';
import 'package:flutter/cupertino.dart';
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
          children: _list
              .map((e) => DataNameButton(
                    name: e,
                  ))
              .toList(),
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CovidDataPage(
                        name: name,
                      )));
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
    return FutureBuilder(
      future: getContinentData(name),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.data != null) {
          args = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(args['continent']),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    Map data = await getContinentData(name);
                    print("Refreshed");
                    setState(() {
                      this.args = data;
                    });
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CovidDataGrid(
                      args: args,
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class CovidDataGrid extends StatelessWidget {
  final Map args;

  const CovidDataGrid({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      shrinkWrap: true,
      children: [
        DataCard(
          dataLabel: 'Total Cases',
          data: args['cases'].toString(),
        ),
        DataCard(
          dataLabel: 'Active Cases',
          data: args['active'].toString(),
          color: Colors.blueAccent,
        ),
        DataCard(
          dataLabel: 'Total Deaths',
          data: args['deaths'].toString(),
          color: Colors.redAccent,
        ),
        DataCard(
          dataLabel: 'Critical Cases',
          data: args['critical'].toString(),
          color: Colors.orangeAccent,
        ),
        DataCard(
          dataLabel: 'Total Tests',
          data: args['tests'].toString(),
          color: Colors.amberAccent,
        ),
        DataCard(
          dataLabel: 'Cases Per Million',
          data: args['casesPerOneMillion'].toString(),
          color: Colors.cyanAccent,
        ),
      ],
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
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dataLabel,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
