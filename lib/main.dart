import 'package:flutter/material.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'MyBall'),
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
  final List<String> Match = <String>[
    'Real Madrid VS Barcelona',
    'Liverpool VS Man United',
    'Lyon VS PSG',
    'Chealsea VS Arsenal',
    'Ajax VS PSV',
    'Atletico Madrid VS Sevilla',
    'Man City VS Totenham',
    'Benfica VS Porto',
    'Dortmund VS Bayern',
  ];
  final List<String> Hours = <String>[
    '23.00 WIB',
    '23.00 WIB',
    '01.00 WIB',
    '20.00 WIB',
    '23.00 WIB',
    '23.00 WIB',
    '23.00 WIB',
    '23.00 WIB',
    '21.00 WIB'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        // padding: EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Colors.green,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(text: 'NEWS'),
                              Tab(text: 'MATCH TODAY'),
                            ],
                          ),
                        ),
                        Container(
                            height: 400, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: ListView(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      elevation: 5,
                                      child: Column(
                                        children: [
                                          Image(
                                              image: NetworkImage(
                                                  'https://pbs.twimg.com/media/Fb-cfGAX0AELhkR?format=jpg&name=medium')),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0)),
                                          Text(
                                            'Real Madrid Menjuarai Liga Champions Tahun 2001/2002',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                    itemCount: Match.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: ListTile(
                                          title: Center(
                                            child: Text(Match[index]),
                                          ),
                                          subtitle:
                                              Center(child: Text(Hours[index])),
                                        ),
                                      );
                                    }),
                              ),
                            ]))
                      ])),
            ]),
      ),
    );
  }
}
