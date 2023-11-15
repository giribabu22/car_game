import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//flutter config --android-sdk 'C:\Program Files\Dart\dart-sdk'
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'car move',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Play Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // double _controller = 10.0;
  double carPosition = 0.0;
  double carUPdown = 10.0;
  void _moveCar(double newPosition) {
    setState(() {
      if (carPosition < 100 &&
          carPosition > -110 &&
          newPosition < 100 &&
          newPosition > -110) {
        carPosition = newPosition;
      }
    });
  }

  void _moveUpDown(double Position__) {
    setState(() {
      if (carUPdown < 650 &&
          carUPdown > -200 &&
          Position__ < 650 &&
          Position__ > -200) {
        carUPdown = Position__;
      }
    });
  }

  // double _animation = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
  Container(
    width: 300,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      color: Colors.black,
    ),
    child: Stack(
      children: <Widget>[
        for (var i = 0; i <= 1100; i += 100)
          Positioned(
            bottom: i.toDouble(),
            left: 145,
            child: Container(
              width: 3.0,
              height: 25,
              color: Colors.white,
            ),
          ),
        Positioned(
          bottom: carUPdown,
          left: carPosition,
          child: Image.asset(
            '../car.png',
            width: 310,
            height: 600,
          ),
        ),
      ],
    ),
  ),
],
          ),
        ),
        //  backgroundColor: Colors.grey,

        floatingActionButton: Stack(
          children: <Widget>[
            Positioned(
              left: 80,
              bottom: 100,
              child: FloatingActionButton(
                onPressed: () => _moveCar(carPosition - 10),
                tooltip: 'Move Left',
                child: const Icon(Icons.arrow_back),
              ),
            ),
            Positioned(
              left: 180,
              bottom: 100,
              child: FloatingActionButton(
                onPressed: () => _moveCar(carPosition + 10),
                tooltip: 'Move Right',
                child: const Icon(Icons.arrow_forward),
              ),
            ),
            Positioned(
              left: 125,
              bottom: 50,
              child: FloatingActionButton(
                onPressed: () => _moveUpDown(carUPdown - 10),
                tooltip: 'Move down',
                child: const Icon(Icons.arrow_downward),
              ),
            ),
            Positioned(
              left: 125,
              bottom: 150,
              child: FloatingActionButton(
                onPressed: () => _moveUpDown(carUPdown + 10),
                tooltip: 'Move up',
                child: const Icon(Icons.arrow_upward),
              ),
            ),
          ],
        ));
  }
}
